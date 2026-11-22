# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change the frequency the auto-updater is run (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line to set how old an update must be before it's applied, manually or via the auto-updater (in days).
# zstyle ':omz:update' cooldown 10

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# No beep from the shell
unsetopt BEEP

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ---------------------------------------------------------------
# Personal settings (moved over from .bashrc and the old Fedora .zshrc)
# ---------------------------------------------------------------

# Editor
export VISUAL=micro
export EDITOR=micro
export MICRO_TRUECOLOR=1

# Shell behaviour
setopt interactivecomments   # allow comments when typing commands
setopt nonomatch             # no error when a wildcard matches nothing
setopt hist_ignore_space     # commands starting with a space are not saved
HISTSIZE=10000
SAVEHIST=20000

# Flutter / Android / Chrome
export PATH="$HOME/Flutter/bin:$PATH"
export CHROME_EXECUTABLE="$(command -v chromium || command -v chromium-browser || echo /snap/bin/chromium)"
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"

# Java 21
if [ -d "/usr/lib/jvm/java-21-openjdk-amd64" ]; then
  export JAVA_HOME="/usr/lib/jvm/java-21-openjdk-amd64"
elif [ -d "$HOME/.local/jdk-21" ]; then
  export JAVA_HOME="$HOME/.local/jdk-21"
fi
[ -n "$JAVA_HOME" ] && export PATH="$JAVA_HOME/bin:$PATH"

# Node (nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm use 20 --silent 2>/dev/null

# Google Cloud SDK
[ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ] && . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"
[ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ] && . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"

# Personal scripts
export PATH="$HOME/.local/bin:$PATH"

# Grey suggestions as you type, and coloured commands
# (sudo apt install zsh-autosuggestions zsh-syntax-highlighting)
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi
[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && \
  . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---------------- Aliases ----------------
alias zsh="micro ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias mi="micro "
alias history="history 0"
alias diff='diff --color=auto'
alias ytd="yt-dlp "

# Ubuntu package manager (was dnf on Fedora)
alias update="sudo apt update && sudo apt upgrade"
alias install="sudo apt install -y "
alias remove="sudo apt remove "

alias rmi="sudo rm -rfi"
alias ll="ls -l"
alias la="ls -A"
alias h="tree -h ."
alias d="tree -d -h"
alias shutdown="sudo shutdown -h now"
alias doctor="flutter doctor -v"
alias remoteip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias gs="git status"
alias gaa="git add -A"
alias gp="git push"

# Old aliases that need software or files not on this computer yet.
# Remove the # in front once they are in place.
#alias scan_here="sudo clamscan -r ."                                  # needs: sudo apt install clamav
#alias msf="msfconsole"                                                # needs: Metasploit
#alias burp="java -jar -Xmx4g ~/BurpSuiteCommunity/burpsuite_community.jar"   # needs: Burp Suite in that folder
#alias android="$HOME/android-studio/bin/studio.sh"                   # needs: Android Studio in that folder
#alias htb="sudo openvpn ~/Base/VPN/HTB/lab_ph055a.ovpn"               # needs: your VPN files in ~/Base/VPN
#alias vpn='sudo openvpn "$(ls -1 ~/Base/VPN/Proton/UDPCountryConfig/*.ovpn | shuf -n1)"'
#alias mac="sudo ip link set enp0s31f6 down && sudo macchanger -r enp0s31f6 && sudo ip link set enp0s31f6 up"  # needs: sudo apt install macchanger

# Rust (cargo, rustc, rustup and tools installed with cargo)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Claude Code: pick up where the last conversation left off
# (type "command claude" for a fresh one)
alias claude="claude --continue"
