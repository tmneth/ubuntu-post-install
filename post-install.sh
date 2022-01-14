# !/bin/bash

# Update and Upgrade
echo "Updating and Upgrading"
sudo apt update && sudo apt upgrade -y

echo "Installing Flatpak"
sudo apt install flatpak -y
flatpak update -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

read -r -p "Have you chosen normal Ubuntu installation mode? [Y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
   normal_install
else
    continue
fi

# VS Code
echo "Installing Visual Studio Code"
flatpak install flathub com.visualstudio.code -y

# Install VS Code extensions
code --install-extension GitHub.vscode-pull-request-github
code --install-extension esbenp.prettier-vscode
code --install-extension jonkwheeler.styled-components-snippets
code --install-extension dsznajder.es7-react-js-snippets

# Node.js
echo "Installing Node.js"
sudo apt install nodejs -y

# NPM
echo "Installing Npm"
sudo apt install npm -y

# GIT
echo "Installing Git"
sudo apt install git -y

# Chromium
echo "Installing Chromium"
flatpak install flathub com.github.Eloston.UngoogledChromium -y

# Discord
echo "Installing Discord"
flatpak install flathub com.discordapp.Discord -y

# Telegram
echo "Installing Telegram"
flatpak install flathub org.telegram.desktop -y

# OnlyOffice
echo "Installing OnlyOffice"
flatpak install flathub  org.onlyoffice.desktopeditors -y

# GIMP
echo "Installing GIMP"
flatpak install flathub  org.gimp.GIMP -y

# OBS
echo "Installing OBS"
flatpak install flathub  com.obsproject.Studio -y

sudo apt install curl
# Installing gh
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# Neofetch
sudo apt install neofetch -y

sudo apt install dialog
cmd=(dialog --separate-output --checklist "Please Select Optional Software you want to install:" 114 137 218)
options=(
	 1 "Spotify" off
	 2 "Steam" off  
	 3 "CLion" off 
   	 4 "PyCharm (community)" off
	 5 "PyCharm (professional)" off
	 6 "PhpStorm" off
	 7 "WebStorm" off
	 8 "GitKraken" off
	 9 "Gitg" off
	 10 "Postman" off
	 11 "KeePassXC" off
	 12 "Bitwarden" off
	 13 "Signal" off
	 14 "Microsoft Teams" off
	 15 "Skype" off
	 16 "Brave" off
	 17 "Anki" off
	 )
	 choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		clear
		for choice in $choices
		do
		    case $choice in
			1)
	     			# Install Spotify
				echo "Installing Spotiy"
				flatpak install flathub com.spotify.Client -y
				;;
	        	
	   		2)
	     			# Install Steam
				echo "Installing Steam"
				flatpak install flathub com.valvesoftware.Steam -y
				;;
			3)
			    	# Install CLion
			    	echo "Installing CLion"
				flatpak install flathub com.jetbrains.CLion -y
				;;
    			4)	
				# Install PyCharm (community)
				echo "Installing PyCharm (community)"
				flatpak install flathub com.jetbrains.PyCharm-Community -y
				;;
    			5)	
				# Install PyCharm (professional)
				echo "Installing PyCharm (professional)"
				flatpak install flathub com.jetbrains.PyCharm-Professional -y
				;;
    			6)	
				# Install PhpStorm
				echo "Installing PhpStorm"
				flatpak install flathub com.jetbrains.PhpStorm -y
				;;
 		    	7)	
				# Install WebStorm
				echo "Installing WebStorm"
				flatpak install flathub com.jetbrains.WebStorm -y
				;;
			8)	
				# Install GitKraken
				echo "Installing GitKraken"
				flatpak install flathub com.axosoft.GitKraken -y
				;;	
 			9)
				# Install Gitg
				echo "Installing Gitg"
				flatpak install flathub org.gnome.gitg -y
				;;
		 	10)
				# Install Postman
				echo "Installing Gitg"
				flatpak install flathub com.getpostman.Postman -y
				;;
			11)
				# Install KeePassXC
				echo "Installing KeePassXC"
				flatpak install flathub org.keepassxc.KeePassXC -y
				;;
			12)
				# Install Bitwarden
				echo "Installing Bitwarden"
				flatpak install flathub com.bitwarden.desktop -y
				;;
			13)
				# Install Signal
				echo "Installing Signal"
				flatpak install flathub org.signal.Signal -y
				;;
			14)
				# Install Microsoft Teams
				echo "Installing Microsoft Teams"
				flatpak install flathub com.microsoft.Teams -y
				;;
			15)
				# Install Skype
				echo "Installing Skype"
				flatpak install flathub com.skype.Client -y
				;;
			16)
				# Install Brave
				echo "Installing Brave"
				sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg -y
				echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
				sudo apt update -y
				sudo apt install brave-browser -y
				;;
			17)
				# Anki
				echo "Installing Anki"
				flatpak install flathub net.ankiweb.Anki
				;;
				
	esac
done

# Setting up desktop wallpaper
wget https://raw.githubusercontent.com/tmneth/ubuntu-post-install/main/wallpaper.jpeg
URI="Downloads/ubuntu-post-install-main/wallpaper.jpeg"
gsettings set org.gnome.desktop.background picture-uri "${URI}"


# Setting up favourite-apps
gsettings set org.gnome.shell favorite-apps "[
'firefox_firefox.desktop', 
'org.gnome.Terminal.desktop',
'nautilus.desktop',
'com.visualstudio.code.desktop', 
'org.telegram.desktop.desktop', 
'com.discordapp.Discord.desktop',
'org.onlyoffice.desktopeditors.desktop', 
'com.github.Eloston.UngoogledChromium.desktop',
'libreoffice-writer.desktop',
'org.gnome.Screenshot.desktop'
]"

sudo reboot
