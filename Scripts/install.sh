# OSINT Tools from Debian package
echo "Installing OSINT Tools"
sudo apt install -y \
whois \
shutter \
youtube-dl \
nmap \
whatweb \
jshon \
catfish \
tree \
hping3 \
sikuli-ide \
gnome-maps \
wuzz \
zmap \
zenmap \
wapiti \
websploit \
urlscan \
thc-ipv6 \
sslscan \
scanssh \
wfuzz \
wget \
zonecheck-cgi \
httrack

# Utilities
echo "Installing Utilities"
sudo apt install -y \
snapd \
gparted \
zsh \
puppet \
apt-transport-https \
i3 \
i3status \
exif \
vlc \
asciinema \
bzip2 \
feh \
ranger \
rkhunter \
curl \
clonezilla \
vlc \
clamav \
clamav-unofficial-sigs \
jq \
libreoffice \
libreoffice-systray \
rofi \
gimp \
wine-stable \
darktable \
simplescreenrecorder \
vagrant \
fonts-font-awesome \
fonts-hack \
markdown \
ffmeg \
curl

# Networking
echo "Installing Networking Tools"
sudo apt install -y \
wireshark \
nethogs \
etherape \
tor

# Browsers & Drivers
echo "Installing Browsers & Drivers"
sudo apt install -y \
chromium-browser \
chromium-chromedriver \
firefoxdriver \

# Languages
echo "Installing Languages"
ruby-dev \
golang \
luarocks \
python-pip \
lua5.3

# Snaps
echo "Installing Snaps"
sudo snap install amass
sudo snap install bitwarden
sudo snap install keepassxc
sudo snap install micro --classic
sudo snap install atom --classic
sudo snap install gitkraken
sudo snap install docker
sudo snap install rocketchat-desktop
sudo snap install brave
sudo snap install certstream
sudo snap install shotcut --classic
sudo snap install snapcraft --classic

echo "Starting Docker"
sudo systemctl start docker
echo "Pulling Containers"
sudo docker pull microsoft/powershell
sudo docker pull alpine
sudo docker pull busybox
sudo docker pull ubuntu
sudo docker pull ruby
sudo docker pull python
sudo docker pull golang
sudo docker pull nginx

# Gem install script
sudo gem install bundler
sudo gem install capybara
sudo gem install csv
sudo gem install cucumber
sudo gem install domain_name
sudo gem install gherkin
sudo gem install ipaddr
sudo gem install json
sudo gem install nokogiri
sudo gem install rspec
sudo gem install selenium-webdriver
sudo gem install spreadsheet
sudo gem install vagrant
sudo gem install watir
sudo gem install watir-webdriver
sudo gem install websocket-extensions
sudo gem install xpath