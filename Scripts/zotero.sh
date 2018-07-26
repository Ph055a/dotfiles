# Download zotero
cd ~/Downloads
curl --header 'Host: download.zotero.org' --user-agent 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' --header 'Accept-Language: en-GB,en;q=0.5' --referer 'https://www.zotero.org/download/' --cookie 'zotero_www_session_v2=av2emb6jrf9lbq9sauumia9gl3' --header 'Upgrade-Insecure-Requests: 1' --header 'DNT: 1' 'https://download.zotero.org/client/release/5.0.54/Zotero-5.0.54_linux-x86_64.tar.bz2' --output 'Zotero-5.0.54_linux-x86_64.tar.bz2'

# Decompress
bzip2 -d Zotero-5.0.54_linux-x86_64.tar.bz2
tar -xvf Zotero-5.0.54_linux-x86_64.tar
# Remove Zotero
sudo rm -rf Zotero-5.0.54_linux-x86_64.tar.bz2
sudo rm -rf Zorero-5.0.54_linux-x86_64.tar
# Move to /etc/opt
sudo mv Zotero_linux-x86_64/ /etc/opt
