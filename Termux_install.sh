#!/bin/sh
pkg update && yes | pkg upgrade && pkg install unzip -y && pkg install jq -y && pkg install nodejs-lts -y && pkg install git -y && pkg install python -y && pkg install ffmpeg -y && pkg install yarn -y
CURRENT_VERSION=$(curl --silent "https://api.github.com/repos/victorsouzaleal/lbot-whatsapp/releases/latest" | jq -r .tag_name)
cd ~  && [ ! -d ".gyp" ] && mkdir ~/.gyp
cd ~/.gyp && [ -f "include.gypi" ] && rm ~/.gyp/include.gypi
echo "{
	'variables': {
		'android_ndk_path': ''
	}
}" >> ~/.gyp/include.gypi
rm -rf ~/LBOT &&
wget https://github.com/Leonardo28l13/lbot-whatsapp/releases/download/$CURRENT_VERSION/LBOT-v$CURRENT_VERSION.zip -P ~ &&
unzip ~/LBOT-v$CURRENT_VERSION.zip -d ~/LBOT &&
rm ~/LBOT-v$CURRENT_VERSION.zip
