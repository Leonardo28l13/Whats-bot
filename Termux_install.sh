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
rm -rf ~/storage/dcim/LBOT &&
wget https://github.com/victorsouzaleal/lbot-whatsapp/releases/download/$CURRENT_VERSION/LBOT-v$CURRENT_VERSION.zip -P ~ &&
unzip ~/storage/dcim/LBOT-v$CURRENT_VERSION.zip -d ~/storage/dcim/LBOT &&
rm ~/storage/dcim/LBOT-v$CURRENT_VERSION.zip
