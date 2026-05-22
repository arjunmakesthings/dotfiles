# what: 
sarah schulte, at the recurse-center (summer-2026), introduced me to the concept of backing up your dotfiles in a git repository, so that it is easier to set up a new machine. since i have now moved over to vim as my text editor, and using custom-configs for iterm, i decided to make my dotfiles repo too. 

more about dotfiles can be found [here](https://www.atlassian.com/git/tutorials/dotfiles).

essentially, you make a bare repository in your home directory, but make your home directory your working tree. afterwards, you manually select the files that you want to track in the dotfiles repo using an alias.

mine is set up in the following way: 
- the dotfiles repo is `.dotfiles` in my home directory.
- the alias is configured as `dotfiles`. so, i use normal git commands like `git add`, but using `dotfiles add`.
