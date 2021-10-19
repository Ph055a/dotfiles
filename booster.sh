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

base_packages(){
    # variables
    install="sudo apt install -y"
    # Package Array
    packages=("nim" "golang" "nethogs" "tree" "jq" "peco" "vlc" "httpie" "micro")

    # Update and Install packages
    $install ${packages[*]}
    echo "[*] Installing Base Requirements"

}

clean(){
    sudo apt autoremove -y; sudo apt autoclean -y
}
    

sudo_check
dir_check
base_packages
clean
