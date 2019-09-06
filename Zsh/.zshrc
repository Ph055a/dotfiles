# 		ZSH Configuration
# ------------------------------------
export ZSH=/home/ph055a/.oh-my-zsh		# Path to your oh-my-zsh installation
TERM=xterm-256color						# Term
ZSH_THEME="blinks"				# Theme See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
CASE_SENSITIVE="false"					# Uncomment the following line to use case-sensitive completion.
plugins=(jsontools docker httpie)		# Plugins	
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
# ------------------------------------

# 		Quick Configs
# ------------------------------------
alias Config_i3="sudo micro ~/.config/i3/config"
alias Config_zsh="sudo micro .zshrc"
# ------------------------------------

# 		Quick Configs
# ------------------------------------
alias Dhl="(ruby ~/Scripts/dhl.rb)"
# ------------------------------------

# 		Hugo Server
# ------------------------------------
alias Hugo="(cd ~/Command/keybase/Personal/Command && hugo server)"
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
# ------------------------------------

# 		Shutdown
# ------------------------------------
alias shutdown="sudo shutdown -h now"
# ------------------------------------

# 		Clamav
# ------------------------------------
alias fresh="sudo freshclam"
alias scan="sudo clamscan -r ."
# ------------------------------------

# 		Privacy
# ------------------------------------
alias mac="sudo ifconfig wlp2s0 down && sudo macchanger -r wlp2s0 && sudo ifconfig wlp2s0 up"
alias remoteip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"  
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
alias ds="df -h /var/lib/docker"
alias dmi="sudo docker images"
alias dri="sudo docker rmi "
alias dr="sudo docker run -it "
# -----------------------------------

# 		Lua5.3   													     	
# ------------------------------------
alias lua="lua5.3"
# ------------------------------------

# 		Go
# ------------------------------------
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$HOME/.local/bin:$HOME/.bin
# ------------------------------------

# 		Crystal 													     	
# ------------------------------------
alias c="crystal"
alias sh="shards"
alias shi="shards install"
alias shc="shards check"
alias shb="shards build"
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
alias vpn="cd /etc/openvpn/Country_UDP; ls"
# ------------------------------------