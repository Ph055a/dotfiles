# Download Google Earth Pro
cd ~/Downloads
curl --header 'Host: dl.google.com' --user-agent 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' --header 'Accept-Language: en-GB,en;q=0.5' --referer 'https://www.google.com/earth/download/thanks.html' --cookie '1P_JAR=2018-07-26-07; NID=135=XPOoO0TVdPAvzA8ozB8_O9VbecIrxPbkqIweU54hrNjVYoQeXnp0HZb9lM6XDHxvxix5HctomQhO4spvRAryFORs9_pwoH01VhNYoALIMw5BWsIpCUtmyPzkLmVM5Oa3xHQxTtz2jlw; OGP=-5061451:' --header 'Upgrade-Insecure-Requests: 1' --header 'DNT: 1' 'https://dl.google.com/dl/earth/client/current/google-earth-pro-stable_current_amd64.deb' --output 'google-earth-pro-stable_current_amd64.deb'

# Install Google Earth Pro
sudo dpkg -i google-earth-pro-stable_current_amd64.deb
sudo apt install -f
sudo rm -rf google-earth-pro-stable_current_amd64.deb
cd ~/
