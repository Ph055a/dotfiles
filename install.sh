sudo apt update; sudo apt upgrade -y

sudo apt install -y \
vlc \
gparted \
transmission-qt \
clamav \
ruby-dev \
git \
zsh \
i3 \
rofi \
compton \
feh \
wget \
curl \
httpie \
arc-theme \
nethogs

i="sudo snap install"

$i bitwarden
$i brave
$i gotop
$i libreoffice
$i micro --classic
$i poddr
$i powershell-preview  --classic
$i rocketchat-desktop
$i shotcut --classic
$i signal-desktop
$i telegram-desktop
$i whalebird
$i keepassxc

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"