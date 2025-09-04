#!/bin/sh
pkg install unzip -y && pkg install jq -y && pkg install nodejs-lts -y && pkg install git -y && pkg install python -y && pkg install ffmpeg -y && pkg install yarn -y
cd ~  && [ ! -d ".gyp" ] && mkdir ~/.gyp
cd ~/.gyp && [ -f "include.gypi" ] && rm ~/.gyp/include.gypi
echo "{
	'variables': {
		'android_ndk_path': ''
	}
}" >> ~/.gyp/include.gypi
rm -rf ~/LBOT &&
wget https://github.com/Leonardo28l13/Whats-bot/blob/main/LBOT-v3.4.6.zip -P ~ &&
unzip ~/LBOT-v3.4.6.zip -d ~/LBOT &&
rm ~/LBOT-v3.4.6.zip
