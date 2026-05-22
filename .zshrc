# for server: 
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

open -a "Google Chrome" "http://localhost:8080/"

python3 -m http.server 8080 --bind 0.0.0.0
}

# for tidal:
export PATH="/Users/a/.local/bin:$PATH"
source ${HOME}/.ghcup/env
export PATH="/Applications/SuperCollider.app/Contents/MacOS:$PATH"
alias dotfiles='/usr/bin/git --git-dir=/Users/a/.dotfiles --work-tree=/Users/a'
