#!/bin/bash

#Update and Upgrade
echo "Updating and Upgrading"
sudo apt update && sudo apt upgrade -y

echo "Installing Flatpak"
sudo apt install flatpak -y
flatpak update -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Uninstall Default Ubuntu Apps
sudo apt purge aisleriot -y
sudo apt purge gnome-mahjongg -y
sudo apt purge gnome-mines -y
sudo apt purge gnome-sudoku -y


#VS Code
echo "Installing Visual Studio Code"
flatpak install flathub com.visualstudio.code -y

#Node.js
echo "Installing Node.js"
sudo apt install nodejs -y

#NPM
echo "Installing Npm"
sudo apt install npm -y

#GIT
echo "Installing Git"
sudo apt install git -y

#Chromium
echo "Installing Chromium"
flatpak install flathub com.github.Eloston.UngoogledChromium -y

#Discord
echo "Installing Discord"
flatpak install flathub com.discordapp.Discord -y

#Telegram
echo "Installing Telegram"
flatpak install flathub org.telegram.desktop -y

#OnlyOffice
echo "Installing OnlyOffice"
flatpak install flathub  org.onlyoffice.desktopeditors -y

#GIMP
echo "Installing GIMP"
flatpak install flathub  org.gimp.GIMP -y

#OBS
echo "Installing OBS"
flatpak install flathub  com.obsproject.Studio -y


sudo apt install dialog
cmd=(dialog --separate-output --checklist "Please Select Optional Software you want to install:" 114 137 218)
options=(
	 1 "Spotify" off
	 2 "Steam" off  
   	 4 "Pyrcharm (community)" off
	 5 "Pyrcharm (professional)" off
	 6 "PhpStorm" off
	 7 "WebStorm" off
	 8 "GitKraken" off
	 9 "Gitg" off
	 10 "Postman" off
	 11 "KeePassXC" off
	 12 "Bitwarden" off
	 )
	 choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		clear
		for choice in $choices
		do
		    case $choice in
			1)
	     			#Install Spotify
				echo "Installing Spotiy"
				flatpak install flathub com.spotify.Client -y
				;;
	        	
	   		2)
	     			 #Install Steam
				echo "Installing Steam"
				flatpak install flathub com.valvesoftware.Steam -y
				;;
			3)
			    	#Install CLion
			    	echo "Installing CLion"
				flatpak install flathub com.jetbrains.CLion -y
				;;
    			4)	
				#Install Pyrcharm (community)
				echo "Installing Pyrcharm (community)"
				flatpak install flathub com.jetbrains.PyCharm-Community -y
				;;
    			5)	
				#Install Pyrcharm (professional)
				echo "Installing Pyrcharm (professional)"
				flatpak install flathub com.jetbrains.PyCharm-Professional -y
				;;
    			6)	
				#Install PhpStorm
				echo "Installing PhpStorm"
				flatpak install flathub com.jetbrains.PhpStorm -y
				;;
 		    	7)	
				#Install WebStorm
				echo "Installing WebStorm"
				flatpak install flathub com.jetbrains.WebStorm -y
				;;
			8)	
				#Install GitKraken
				echo "Installing GitKraken"
				flatpak install flathub com.axosoft.GitKraken -y
				;;	
 			9)
				#Install Gitg
				echo "Installing Gitg"
				flatpak install flathub org.gnome.gitg -y
				;;
		 	10)
				#Install Postman
				echo "Installing Gitg"
				flatpak install flathub com.getpostman.Postman -y
				;;
			11)
				#Install KeePassXC
				echo "Installing KeePassXC"
				flatpak install flathub org.keepassxc.KeePassXC -y
				;;
			12)
				#Install Bitwarden
				echo "Installing Bitwarden"
				flatpak install flathub com.bitwarden.desktop -y
				;;
				
	esac
done

# Setting up desktop wallpaper
URI="Downloads/Ubuntu-post-install-main/wallpaper.jpeg"
gsettings set org.gnome.desktop.background picture-uri "${URI}"


# Setting up favourite-apps
gsettings set org.gnome.shell favorite-apps "[
'firefox_firefox.desktop', 
'org.gnome.Terminal.desktop',
'nautilus.desktop',
'com.visualstudio.code.desktop', 
'org.telegram.desktop.desktop', 
'com.discordapp.Discord.desktop',
'com.spotify.Client.desktop',
'org.onlyoffice.desktopeditors.desktop', 
'com.github.Eloston.UngoogledChromium.desktop',
'libreoffice-writer.desktop'
]"