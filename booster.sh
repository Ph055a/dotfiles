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
    packages=("golang" "nethogs" "tree" "jq" "peco" "vlc" "httpie" "micro" "clamav" "gospider" "httprobe" "assetfinder" "subfinder" "ddgr" "zathura" "i3_gaps" "feh" "polybar" "unar")

    # Update and Install packages
    $install ${packages[*]}

}

function go_packages(){
    echo "[*] Installing Go packages"
    go install -u github.com/tomnomnom/qsreplace@latest
    go install github.com/tomnomnom/burl@latest	
    go install github.com/tomnomnom/waybackurls@latest
    go install -u github.com/tomnomnom/unfurl@latest
    go install github.com/shellhunter/gocewl@latest
    go install github.com/hans-strudle/seashells@latest
    go install -u github.com/lc/gau@latest
    go install github.com/tomnomnom/meg@latest

    # Move binaries into /bin directory
    cd ~/go/bin
    cp * /bin; cd ~/
}

# clean up some things after installation
function clean(){
    echo "[*] Cleaning up after installation"
    sudo apt autoremove -y; sudo apt autoclean -y
}

function freshclam(){
    echo "[*] Updating ClamAV Database"
    sudo freshclam
}
    
sudo_check
dir_check
base_packages
go_packages
clean
freshclam
echo "[*] Installation Completed!!!"
