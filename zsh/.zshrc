# 		ZSH Configuration
# ------------------------------------
export ZSH=/home/ph055a/.oh-my-zsh		# Path to your oh-my-zsh installation
TERM=xterm-256color						# Term
ZSH_THEME="juanghurtado"				# Theme See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
CASE_SENSITIVE="false"					# Uncomment the following line to use case-sensitive completion.
plugins=(gitfast git-extras jsontools docker httpie aterminal)		# Plugins	
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
# ------------------------------------

# 		Quick Configs
# ------------------------------------
alias Config_awesome="sudo micro ~/.config/awesome/rc.lua"
alias Config_zsh="sudo micro .zshrc"
alias Config_powershell="sudo micro ~/.config/powershell/Microsoft.PowerShell_profile.ps1"
# ------------------------------------

# 		Misc
# ------------------------------------
export SSH_KEY_PATH="~/.ssh/rsa_id"
alias Zshreload="source .zshrc" 		# Reload alias
alias Xreload="xrdb ~/.Xresources"		# Reload Xresources
# ------------------------------------

# 		Package Management
# ------------------------------------
alias Up="sudo apt update; sudo apt upgrade"
alias Install="sudo apt install"
alias Remove="sudo apt remove"
alias Clean="sudo apt autoclean; sudo apt autoremove"
# ------------------------------------

# 		Remove
# ------------------------------------
alias rmi="sudo rm -rfi"		# Remove with confirmation
alias rm="sudo rm -rf"
# ------------------------------------

# 		Shutdown
# ------------------------------------
alias Shutdown="sudo shutdown -h now"
# ------------------------------------

# 		Clamav
# ------------------------------------
alias Fresh="sudo freshclam"
alias Scan="sudo clamscan -r ."
# ------------------------------------

# 		Privacy
# ------------------------------------
alias Mac="sudo ifconfig wlp2s0 down && sudo macchanger -r wlp2s0 && sudo ifconfig wlp2s0 up"
alias Remoteip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"  
alias Fuckstarbucks="sudo rm -rf /etc/NetworkManager/system-connections/starbucks && sudo ifconfig wlp2s0 down && sudo macchanger -r wlp2s0 && sudo ifconfig wlp2s0 up"
# ------------------------------------

# 		Sound
# ------------------------------------
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
# ------------------------------------

# 		Docker
# ------------------------------------
alias Dkr_start="sudo systemctl start docker"			   # Start docker service	
alias Dkr="sudo docker --help"
alias Dkr_search="sudo docker search"	
alias Dkr_Images="sudo docker container images"
alias Dkr_prune="sudo docker container system prune"        # Kill All Docker Container
alias Dkr_remove_all="docker rm 'docker ps --no-trunc -aq'" # Remove non-running Docker containers
# ------------------------------------

# 		Snaps   													     	
# ------------------------------------
alias snp_search="sudo snap search"
alias snp_install="sudo snap install"
alias snp_remove="sudo snap remove"
alias snp_init="snapcraft init"
# ------------------------------------

# 		Go   													     	
# ------------------------------------
export GOPATH=$HOME/go												
export PATH=$PATH:$GOPATH/bin
alias gr="go run ."
alias gg="go get -u"
alias gd="go doc"
# ------------------------------------

# 		Lua5.3   													     	
# ------------------------------------
alias lua="lua5.3"
# ------------------------------------

# 		Git   													     	
# ------------------------------------
alias gs="git status"
alias gaa="git add -A"
alias gp="git push"
# ------------------------------------

# 		Networking
# ------------------------------------
alias Network_restart="sudo systemctl restart NetworkManager.service"
alias Network_stop="sudo systemctl stop NetworkManager.service"
alias Network_Vpn="cd /etc/openvpn/Country"
# ------------------------------------

# 		Domain Tools
# ------------------------------------
