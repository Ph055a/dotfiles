# 		ZSH Configuration
# ------------------------------------
export ZSH=/home/ph055a/.oh-my-zsh
TERM=xterm-256color
ZSH_THEME="agnoster"
CASE_SENSITIVE="false"
plugins=(jsontools docker httpie)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
# ------------------------------------

# 		Quick Configs
# ------------------------------------
alias i3="sudo micro ~/.config/i3/config"
alias zsh="sudo micro .zshrc"
# ------------------------------------

# 		Quick Configs
# ------------------------------------
alias Dhl="(ruby ~/Scripts/dhl.rb)"
alias 17track="(ruby ~/Scripts/17track.rb)"
# ------------------------------------

# 		Ruby Path
# ------------------------------------
export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
# ------------------------------------

# 		Hugo
# ------------------------------------
alias Hugo="(cd ~/Command/keybase/Personal/Command && hugo server)"
alias Notes="(cd ~/Notes && ./notes)"
# ------------------------------------

# 		Micro
# ------------------------------------
alias Mi="micro "
VISUAL=micro; export VISUAL EDITOR=micro; export EDITOR
# ------------------------------------

# 		Misc
# ------------------------------------
export SSH_KEY_PATH="~/.ssh/rsa_id"
alias Zshreload="source .zshrc" 		# Reload alias
alias Xreload="xrdb ~/.Xresources"		# Reload Xresources
# ------------------------------------

# 		Package Management
# ------------------------------------
alias Up="sudo pacman -Syyu"
alias Full="sudo pacman -Syyu; sudo freshclam"
alias Install="sudo pacman -S "
alias Remove="sudo pacman -R "
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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
