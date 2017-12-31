#!/bin/bash

# add repos
sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"

# update
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade


# some apps
sudo apt-get -y --allow-unauthenticated install \
    libxss1 \
    git \
    gitk \
    gitg \
    p7zip \
    p7zip-full \
    p7zip-rar \
    software-properties-common \
    exfat-utils \
    exfat-fuse \
    apt-transport-https \
    ca-certificates \
    curl \
    gdebi \
    google-chrome-stable \
    vlc


# installing apps that require tailored approach:

# node via nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
nvm install stable

# python
sudo apt-get install -y build-essential \
checkinstall
libreadline-gplv2-dev \
libncursesw5-dev \
libssl-dev \
libsqlite3-dev \
tk-dev libgdbm-dev \
libc6-dev libbz2-dev

 # choose the version:
pyversion=2.7.14
cd /usr/src
sudo wget https://www.python.org/ftp/python/$pyversion/Python-$pyversion.tgz
sudo tar xzf Python-$pyversion.tgz
cd Python-$pyversion
sudo ./configure
sudo make altinstall

# visual studio code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo usermod -a -G docker $USER

# docker compose
sudo curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# mongo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org 

# postman
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman
cat > ~/.local/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL

# kitematic
wget https://github.com/docker/kitematic/releases/download/v0.17.2/Kitematic-0.17.2-Ubuntu.zip
unzip Kitematic-0.17.2-Ubuntu.zip
sudo gdebi --n dist/Kitematic_0.17.2_amd64.deb
rm -rf dist/ Kitematic-0.17.2-Ubuntu.zip

# robo3t
wget https://download.robomongo.org/1.1.1/linux/robo3t-1.1.1-linux-x86_64-c93c6b0.tar.gz
sudo tar -xzf robo3t-1.1.1-linux-x86_64-c93c6b0.tar.gz -C /opt
rm robo3t-1.1.1-linux-x86_64-c93c6b0.tar.gz
sudo mkdir /opt/robo3t-1.1.1-linux-x86_64-c93c6b0//lib/BKP/
sudo mv /opt/robo3t-1.1.1-linux-x86_64-c93c6b0/lib/libstdc++* /opt/robo3t-1.1.1-linux-x86_64-c93c6b0//lib/BKP/
sudo ln -s /opt/robo3t-1.1.1-linux-x86_64-c93c6b0/bin/robo3t /usr/bin/robo3t
cat > ~/.local/share/applications/robo3t.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Robo3T
Exec=robo3t
Terminal=false
Type=Application
Categories=Development;
EOL

# webtorrent
wget https://github.com/feross/webtorrent-desktop/releases/download/v0.18.0/webtorrent-desktop_0.18.0-1_amd64.deb
sudo gdebi --n webtorrent-desktop_0.18.0-1_amd64.deb
rm webtorrent-desktop_0.18.0-1_amd64.deb

# folders
rm -rf ~/Documents
rm -rf ~/Public
rm -rf ~/Templates
rm -rf ~/Videos
rm -rf ~/Music
rm ~/examples.desktop
mkdir ~/dev
mkdir ~/stage
mkdir ~/dist


# some preferences
gsettings set com.canonical.indicator.session show-real-name-on-panel true
gsettings set com.canonical.Unity.Launcher launcher-position Left
gsettings set com.canonical.Unity always-show-menus true
gsettings set com.canonical.Unity integrated-menus false
gsettings set com.canonical.Unity minimize-count 99
gsettings set com.canonical.indicator.power show-percentage true
gsettings set com.canonical.Unity.Launcher favorites "['application://gnome-terminal.desktop', 'application://code.desktop', 'application://google-chrome.desktop', 'application://org.gnome.Nautilus.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']"
gsettings set com.canonical.Unity.Lenses remote-content-search 'none'
gsettings set org.gnome.desktop.default-applications.terminal exec 'gnome-terminal'
gsettings set org.gnome.desktop.media-handling autorun-never true
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false
gsettings set org.gnome.settings-daemon.plugins.power critical-battery-action 'shutdown'
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.settings-daemon.plugins.power lid-close-ac-action 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power lid-close-battery-action 'nothing'

# some buetooth settings
sudo sed -i 's@#AutoEnable=false@AutoEnable=true@g' /etc/bluetooth/main.conf
sudo sed -i 's@#FastConnectable = false@FastConnectable = true@g' /etc/bluetooth/main.conf

# interactive
sudo apt-get install -y ubuntu-restricted-extras


clear
echo "reboot your coputer"
