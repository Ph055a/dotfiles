# Path to your oh-my-zsh installation.
export ZSH=/home/machiavelli/.oh-my-zsh

# Term
TERM=xterm-256color

# Theme See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="juanghurtado"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Plugins
plugins=(gitfast git-extras jsontools docker httpie aterminal rvm ruby rails gem)
source $ZSH/oh-my-zsh.sh

# User configuration
# You may need to manually set your language environment
export LANG=en_US.UTF-8

#################################### Alias #############################################################
##### Reload alias #####
alias Zshreload="source .zshrc"
alias Xreload="xrdb ~/.Xresources"

###### Package Management #####
alias Up="sudo apt update && sudo apt upgrade"
alias Install="sudo apt install"
alias Remove="sudo apt remove"

##### Shutdown & logout #####
alias Shutdown="sudo shutdown -h now"

##### Clamav #####
alias Fresh="sudo freshclam"
alias Scan="sudo clamscan -r ."

##### Privacy #####
alias Mac="sudo ifconfig wlp2s0 down && sudo macchanger -r wlp2s0 && sudo ifconfig wlp2s0 up"
alias Remoteip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"  
alias Fuckstarbucks="sudo rm -rf /etc/NetworkManager/system-connections/starbucks && sudo ifconfig wlp2s0 down && sudo macchanger -r wlp2s0 && sudo ifconfig wlp2s0 up"

##### Sound #####
alias 00="amixer set Master 00%"
alias 10="amixer set Master 10%"
alias 20="amixer set Master 20%"
alias 30="amixer set Master 30%"
alias 40="amixer set Master 40%"
alias 50="amixer set Master 50%"
alias 60="amixer set Master 60%"
alias 70="amixer set Master 70%"
alias 80="amixer set Master 80%"
alias 90="amixer set Master 90%"
alias 100="amixer set Master 100%"

##### Docker #####
# Start docker service
alias Docker_start="sudo systemctl start docker"
# Kill All Docker Containers
alias Docker_prune="sudo docker system prune"
# Remove non-running Docker containers
alias Docker_remove_all="docker rm 'docker ps --no-trunc -aq'"
##### Networking ##### 
alias Network_restart="sudo systemctl restart NetworkManager.service"
alias Network_stop="sudo systemctl stop NetworkManager.service"
alias OpenVpn="cd /etc/openvpn/"

##### Misc #####
# Set Gopath												     	
export GOPATH=$HOME/go												
export PATH=$PATH:$GOPATH/bin

# SSH
export SSH_KEY_PATH="~/.ssh/rsa_id"