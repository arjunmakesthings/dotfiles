# what: 
sarah schulte, at the recurse-center (summer-2026), introduced me to the concept of backing up your dotfiles in a git repository, so that it is easier to set up a new machine. since i have now moved over to vim as my text editor, and using custom-configs for iterm, i decided to make my dotfiles repo too. 

more about dotfiles can be found [here](https://www.atlassian.com/git/tutorials/dotfiles).

essentially, you make a bare repository in your home directory, but make your home directory your working tree. afterwards, you manually select the files that you want to track in the dotfiles repo using an alias.

mine is set up in the following way: 
- the dotfiles repo is `.dotfiles` in my home directory.
- the alias is configured as `dotfiles`. so, i use normal git commands like `git add`, but using `dotfiles add`.

---

copy pasting the atlassian article, just in case the post is subject to link-rot.

Dotfiles: Best way to store in a bare git repository
Disclaimer: the title is slightly hyperbolic, there are other proven solutions to the problem. I do think the technique below is very elegant though.

Recently I read about this amazing technique in an Hacker News thread on people's solutions to store their dotfiles. User StreakyCobra showed his elegant setup and ... It made so much sense! I am in the process of switching my own system to the same technique. The only pre-requisite is to install Git.

In his words the technique below requires:

No extra tooling, no symlinks, files are tracked on a version control system, you can use different branches for different computers, you can replicate you configuration easily on new installation.

The technique consists in storing a Git bare repository in a "side" folder (like $HOME/.cfg or $HOME/.myconfig) using a specially crafted alias so that commands are run against that repository and not the usual .git local folder, which would interfere with any other Git repositories around.

Starting from scratch
If you haven't been tracking your configurations in a Git repository before, you can start using this technique easily with these lines:

1git init --bare $HOME/.cfg
2alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
3config config --local status.showUntrackedFiles no
4echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
The first line creates a folder ~/.cfg which is a Git bare repository that will track our files.

Then we create an alias config which we will use instead of the regular git when we want to interact with our configuration repository.

We set a flag - local to the repository - to hide files we are not explicitly tracking yet. This is so that when you type config status and other commands later, files you are not interested in tracking will not show up as untracked.

Also you can add the alias definition by hand to your .bashrc or use the the fourth line provided for convenience.

I packaged the above lines into a snippet up on Bitbucket and linked it from a short-url. So that you can set things up with:

1curl -Lks http://bit.do/cfg-init | /bin/bash
After you've executed the setup any file within the $HOME folder can be versioned with normal commands, replacing git with your newly created config alias, like:

1config status
2config add .vimrc
3config commit -m "Add vimrc"
4config add .bashrc
5config commit -m "Add bashrc"
6config push
Installing your dotfiles onto a new system (or migrate to this setup)
If you already store your configuration/dotfiles in a Git repository, on a new system you can migrate to this setup with the following steps:

Prior to the installation make sure you have committed the alias to your .bashrc or .zsh:

1alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:

1echo ".cfg" >> .gitignore
Now clone your dotfiles into a bare repository in a "dot" folder of your $HOME:

1git clone --bare <git-repo-url> $HOME/.cfg
Define the alias in the current shell scope:

1alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
Checkout the actual content from the bare repository to your $HOME:

1config checkout
The step above might fail with a message like:

1error: The following untracked working tree files would be overwritten by checkout:
2    .bashrc
3    .gitignore
4Please move or remove them before you can switch branches.
5Aborting
This is because your $HOME folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: back up the files if you care about them, remove them if you don't care. I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:

1mkdir -p .config-backup && \
2config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
3xargs -I{} mv {} .config-backup/{}
Re-run the check out if you had problems:

1config checkout
Set the flag showUntrackedFiles to no on this specific (local) repository:

1config config --local status.showUntrackedFiles no
You're done, from now on you can now type config commands to add and update your dotfiles:

1config status
2config add .vimrc
3config commit -m "Add vimrc"
4config add .bashrc
5config commit -m "Add bashrc"
6config push
Again as a shortcut not to have to remember all these steps on any new machine you want to setup, you can create a simple script, store it as Bitbucket snippet like I did, create a short url for it and call it like this:

1curl -Lks http://bit.do/cfg-install | /bin/bash
For completeness this is what I ended up with (tested on many freshly minted Alpine Linux containers to test it out):

1git clone --bare https://bitbucket.org/durdn/cfg.git $HOME/.cfg
2function config {
3   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
4}
5mkdir -p .config-backup
6config checkout
7if [ $? = 0 ]; then
8  echo "Checked out config.";
9  else
10    echo "Backing up pre-existing dot files.";
11    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
12fi;
13config checkout
14config config status.showUntrackedFiles no
