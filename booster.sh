#!/bin/bash

# This script installs whatever I need on top of ParrotOS system

# check for sudo
function sudo_check(){
    if [ "$EUID" -ne 0 ];then 
        echo "[*] This script needs to be run as root"
        exit
    fi
}

# Check for the existence of directories
function dir_check(){
    echo "[*] Checking if directories exist"
    if [[ -d ~/Github ]] && [[ -d ~/Scripts ]]
    then 
        echo "[*] Directories already exist"
    else
        echo "[*] Creating required directories"
        mkdir ~/Github
        mkdir ~/Scripts
    fi
}

# Install packages via apt
function base_packages(){
    echo "[*] Installing base requirements"
    install="sudo apt install -y"
    # Package Array
    packages=("golang" "nethogs" "tree" "jq" "peco" "vlc" "httpie" "micro" "clamav" "gospider" "httprobe" "assetfinder" "subfinder" "ddgr" "zathura" "feh" "polybar" "unar" "peek" "flameshot")

    # Update and Install packages
    $install ${packages[*]}

}

function go_packages(){
    echo "[*] Installing Go packages"
    go install github.com/tomnomnom/qsreplace@latest
    go install github.com/tomnomnom/burl@latest	
    go install github.com/tomnomnom/waybackurls@latest
    go install github.com/tomnomnom/unfurl@latest
    go install github.com/shellhunter/gocewl@latest
    go install github.com/hans-strudle/seashells@latest
    go install github.com/lc/gau@latest
    go install github.com/tomnomnom/meg@latest
    go install github.com/tomnomnom/fff@latest
    GO111MODULE=on go install github.com/jaeles-project/gospider@latest

    # Move binaries into /bin directory
    cd ~/go/bin
    cp * /usr/bin/; cd ~/
}

# clean up some things after installation
function clean(){
    echo "[*] Cleaning up after installation"
    sudo apt autoremove -y; sudo apt autoclean -y
}

    
sudo_check
dir_check
base_packages
go_packages
clean
echo "[*] Installation Completed!!!"
