# small script to serve a local server wherever, and also give me an ip to be able to test on my phone.: 
serveme(){
# get interface:
IFACE=$(route get default | grep interface | awk '{print $2}')

# get ip: 
IP=$(ipconfig getifaddr $IFACE)

# fallback: 
if [ -z "$IP" ]; then
  IP="localhost"
fi

echo ""
echo "ip to test on phone: $IP:8080"
echo ""

# i do all web-testing on google-chrome. but, if i needed to, i could change this browser here:
open -a "Google Chrome" "http://localhost:8080/"

python3 -m http.server 8080 --bind 0.0.0.0
}

# for tidal-cycles:
export PATH="/Users/a/.local/bin:$PATH"
source ${HOME}/.ghcup/env
export PATH="/Applications/SuperCollider.app/Contents/MacOS:$PATH"

# aliases: 
# for dotfiles repo, so that i can call git commands with dotfile ...:
alias dotfiles='/usr/bin/git --git-dir=/Users/a/.dotfiles --work-tree=/Users/a'

#python: 
alias python='python3'

#show files when changing cd:
cc() {
    cd "$@" && ls -a
}

#show tree inside a directory:
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

#aliases: 
alias la="ls -a"

#for und-net:
alias ssh-undnet="ssh non-root@167.99.147.44"
alias droplet-ip="echo '167.99.147.44' "

#for raspberry pi: 
alias ssh-pi="ssh -i /Users/a/data/raspberry-pi/pi-key a@10.23.10.89"
alias pi-ip="echo '10.23.10.89'"

alias itp="cd ~/data/itp/sem-3 && ls -a"
