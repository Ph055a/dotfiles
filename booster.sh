#!/bin/bash

# Script to boost kali linux installation with additional tools

# check for sudo
sudo_check(){
    if [ "$EUID" -ne 0 ];then 
        echo "[*] This script needs to be run as root"
        exit
    fi
}

# Check for the existence of directories
dir_check(){
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
base_packages(){
    install="sudo apt install -y"
    # Package Array
    packages=("nim" "golang" "nethogs" "tree" "jq" "peco" "vlc" "httpie" "micro" "clamav" "gospider" "httprobe" "assetfinder" "subfinder" "ddgr")

    # Update and Install packages
    $install ${packages[*]}
    echo "[*] Installing Base Requirements"

}

go_packages(){
    go get -u github.com/tomnomnom/qsreplace
    go get github.com/tomnomnom/burl
    go get -u github.com/tomnomnom/unfurl
    go get github.com/shellhunter/gocewl
    GO111MODULE=on go get -u -v github.com/lc/gau
    
}

# clean up some things after installation
clean(){
    sudo apt autoremove -y; sudo apt autoclean -y
    cd ~/go/bin
    cp * /bin; cd ~/
}
    
sudo_check
dir_check
base_packages
go_packages
clean
