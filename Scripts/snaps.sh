# Install snapd
echo "Installing snapd"
sudo apt update;sudo apt install snapd -y

# Utilities
echo "Installing bitwarden"
sudo snap install bitwarden
echo "Installing Brave Browser"
sudo snap intall brave
echo "Installing keepasscx"
sudo snap install keepasscx
echo "Installing RocketChat Desktop"
sudo snap install rocketchat-desktop

# Development
echo "Installing Micro Editor"
sudo snap install micro --classic
echo "Installing Atom Editor"
sudo snap install atom --classic
echo "Installing Zenkit"
sudo snap install zenkit
echo "Installing Gitkraken"
