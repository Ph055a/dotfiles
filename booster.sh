#!/bin/bash

# check for sudo
sudo_check(){
    if [ "$EUID" -ne 0 ];then 
        echo "[*] This script needs to be run as root"
        exit
    fi
}

directories(){
    echo "[*] Creating Directories"
    mkdir ~/Automation
    mkdir ~/Github
}


echo "[*] Installing Base Requirements"
apt="sudo apt"
install="sudo apt install -y "
$apt update; sudo apt upgrade -y
$install --reinstall build-essentials
$install golang nim

$install nethogs \
httpie \
tree \
micro \
vlc \
jq \
peco \

clean(){
    $apt autoremove -y
    $apt autoclean -y
    cd $GOPATH/bin
    sudo mv * /usr/bin
}
    

sudo_check()
directories()
clean()
