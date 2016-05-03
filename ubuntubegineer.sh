#!/bin/bash

# All  things to do after installing Ubuntu Linux and Add more awesome tools to your Ubuntu Linux system
# ---------------------------------------------------------------------------
# Copyright 2016, moe wynn <moewynn82@gmail.com>

# This program script is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program script is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License at <http://www.gnu.org/licenses/> for
# more details.

# Revision history:
# Ko Yan Naing Myint ( Our Trainer ) Cyber Wings Team
# Reference google, Bash cook-book, dos script
# 2016-04-28  Created
# ------------------------------------------------------------------------------

#some variables
DEFAULT_ROUTE=$(ip route show default | awk '/default/ {print $3}')
IFACE=$(ip route show | awk '(NR == 2) {print $3}')
MYIP=$(ip route show | awk '(NR == 2) {print $9}')
DEFAULT_USER=$(whoami)
HOSTNAME=$(hostname)
OS=$(lsb_release -ds)
KERNEL=$(uname -srm)
UPTIME=$(uptime -p)
#HD=$()
#CPU=$()
#RAM=$()


######## Update Ubuntu 16.04 lts
function Desktopmanager () {
clear
tput bold; echo -e "
\033[32m################################################################################\033[m
               Ubuntu Desktop Manager, Software and Toolkit script
\033[32m################################################################################\033[m
      \033[1;36mScript by All things to do after installing Ubuntu Version : 1.0\033[m

                          ./+o+-          Host  : \033[32m$HOSTNAME\033[m
                  yyyyy- $c2-yyyyyy+         OS    : \033[32m$OS\033[m
               $c1://+//////$c2-yyyyyy0         Kerne : \033[32m$KERNEL\033[m
           .++ $c1.:/++++++/-$c2.+sss/\`         Uptime: \033[32m$UPTIME\033[m
         .:++o:  $c1/++++++++/:--:/-
        o:+o+:++.$c1\`..\`\`\`.-/oo+++++/
       .:+o:+o/.$c1          \`+sssoo+/       Script Location : \033[32m$0\033[m
  .++/+:$c3+oo+o:\`     I       /sssooo.      Connection Info :---------------------
 /+++//+:$c3\`oo+o     LOVE      /::--:.      Gateway         : \033[32m$DEFAULT_ROUTE\033[m
 \+/+o+++$c3\`o++o    UBUNTU     ++////.      Interface       : \033[32m$IFACE\033[m
  .++.o+$c3++oo+:\`             /dddhhh.      My LAN Ip       : \033[32m$MYIP\033[m
       .+.o+oo:.          \`oddhhhh+       Current User    : \033[32m$DEFAULT_USER\033[m
        \+.++o+o\`$c2\`-\`\`\`\`.:ohdhhhhh+
         \`:o+++ $c2\`ohhhhhhhhyo++os:
           .o:$c2\`.syhhhhhhh/$c3.oo++o\`
               /osyyyyyyo$c3++ooo+++/
                   \`\`\`\`\` $c3+oo+++o\:
                          \`oo++.

\033[31m#################################################################################\033[m
\033[31m###                     Change Ubuntu Desktop Manager                         ###\033[m
\033[31m#################################################################################\033[m"
select menusel in "XFCE Desktop" "KDE Desktop" "LXDE Desktop" "CINNAMON Desktop" "MATE Desktop" "Back to Main"; do
case $menusel in
  "XFCE Desktop")

		echo -e "\033[31m====== Installing XFCE Desktop ======\033[m"
		echo -e "\033[31m====== View XFCE Desktop before installing it ======\033[m"
    echo -e "\033[31m====== https://www.xfce.org ======\033[m"
    sudo add-apt-repository ppa:xubuntu-dev/xfce-4.12
    sudo apt-get update && sudo apt-get dist-upgrade
    sudo apt-get install xfce4
		echo xfce4-session > /root/.xsession
		echo -e "\033[32mDone Installing\033[m"
		pause
		clear ;;
	"KDE Desktop")

		echo -e "\033[31m====== Installing KDE Desktop ======\033[m"
		echo -e "\033[31m====== View KDE Desktop before installing it ======\033[m"
		echo -e "\033[31m====== https://www.kde.org ======\033[m"
    sudo add-apt-repository ppa:kubuntu-ppa/backports
    sudo apt-get update && sudo apt-get dist-upgrade
		sudo apt-get install kubuntu-desktop
		echo -e "\033[32mDone Installing\033[m"
		pause
		clear ;;
	"LXDE Desktop")

		echo -e "\033[31m====== Installing LXDE Desktop ======\033[m"
		echo -e "\033[31m====== View LXDE Desktop before installing it ======\033[m"
		echo -e "\033[31m====== https://www.lxde.org ======\033[m"
		sudo apt-get install lxde
    sudo apt-get install lubuntu-core lubuntu-icon-theme lubuntu-restricted-extras
		echo -e "\033[32mDone Installing\033[m"
		pause
		clear ;;
    "CINNAMON Desktop")

  		echo -e "\033[31m====== Installing CINNAMON Desktop ======\033[m"
  		echo -e "\033[31m====== View CINNAMON Desktop before installing it ======\033[m"
  		echo -e "\033[31m====== https://www.cinnamon.linuxmint.com ======\033[m"
      sudo add-apt-repository ppa:lestcape/cinnamon
      sudo apt-get update && sudo apt-get install cinnamon
  		echo -e "\033[32mDone Installing\033[m"
  		pause
  		clear ;;
      "MATE Desktop")

        echo -e "\033[31m====== Installing MATE Desktop ======\033[m"
        echo -e "\033[31m====== View MATE Desktop before installing it ======\033[m"
        echo -e "\033[31m====== https://www.mate-desktop.org ======\033[m"
        sudo apt-add-repository ppa:ubuntu-mate-dev/ppa && sudo apt-add-repository ppa:ubuntu-mate-dev/trusty-mate
        sudo apt-get update && sudo apt-get install mate-desktop-environment-core
        sudo apt-get install mate-desktop-environment && sudo apt-get install mate-desktop-environment-extras
        echo -e "\033[32mDone Installing\033[m"
        pause
        clear ;;

	  "Back to Main")
		clear
		mainmenu ;;

	*)
		screwup
		Desktopmanager ;;

esac

break

done
}
######### Install VirutalBox
function installvirtualbox () {

	echo -e "\e[1;31mThis option will install virtualbox!\e[0m"
	echo -e "\e[1;31mOf course, Your source.list correct!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing Virtualbox ======\033[m"
				sleep 2
				sudo apt-get update && sudo apt-get install -y linux-headers-$(uname -r)
				sudo apt-get install virtualbox
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
#### Bleachbit Installation
function installbleachbit () {
	echo -e "\e[1;31mThis option will install Bleachbit!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
	read install
	if [[ $install = Y || $install = y ]] ; then
		echo -e "\e[31m[+] Installing Bleachbit now!\e[0m"
		sudo apt-get -y install bleachbit
		echo -e "\e[32m[-] Done Installing Bleachbit!\e[0m"
	else
		echo -e "\e[32m[-] Ok,maybe later !\e[0m"
	fi
}
#### Installation GoldenDict
function installGoldendict () {
	echo -e "\e[1;31mThis option will install GoldenDict!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
	read install
	if [[ $install = Y || $install = y ]] ; then
		echo -e "\e[31m[+] Installing GoldenDict now!\e[0m"
		sudo apt-get -y install goldendict
		echo -e "\e[32m[-] Done Installing goldendict!\e[0m"
	else
		echo -e "\e[32m[-] Ok,maybe later !\e[0m"
	fi
}
######## Install Krita
function installkrita () {
	echo "This will install Krita (video editor). Do you want to install it ? (Y/N)"
	read install
	if [[ $install = Y || $install = y ]] ; then
		echo -e "\e[31m[+] Installing Krita now!\e[0m"
    sudo add-apt-repository ppa:dimula73/krita
    sudo apt-get update && sudo apt-get install krita-2.9 krita-2.9-dbg
		echo -e "\e[32m[-] Done Installing Krita!\e[0m"
	else
		echo -e "\e[32m[-] Ok,maybe later !\e[0m"
	fi


}
######## Install ibus
function installibus () {
	echo "This will install ibus. Do you want to install it ? (Y/N)"
	read install
	if [[ $install = Y || $install = y ]] ; then
		echo -e "\e[31m[+] Installing ibus now!\e[0m"
		sudo apt-get -y install ibus && apt-get -y install ibus-unikey
		echo -e "\e[32m[-] Done Installing ibus!\e[0m"
	else
		echo -e "\e[32m[-] Ok,maybe later !\e[0m"
	fi


}
######## Install wpsoffice
function installwpsoffice () {
	echo "This will install wpsoffice. Do you want to install it ? (Y/N)"
	read install
	if [[ $install = Y || $install = y ]] ; then
		echo -e "\e[31m[+] Installing wpsoffice now!\e[0m"
    cd && wget -O wps-office.deb http://kdl.cc.ksosoft.com/wps-community/download/a19/wps-office_9.1.0.4975~a19p1_amd64.deb
    sudo dpkg -i wps-office.deb
    sudo apt-get -f install && rm wps-office.deb
    wget -O web-office-fonts.deb http://kdl.cc.ksosoft.com/wps-community/download/a15/wps-office-fonts_1.0_all.deb
    sudo dpkg -i web-office-fonts.deb
		echo -e "\e[32m[-] Done Installing wpsoffice!\e[0m"
	else
		echo -e "\e[32m[-] Ok,maybe later !\e[0m"
	fi


}
######## Install knotes
function installknotes () {
	echo "This will install knotes. Do you want to install it ? (Y/N)"
	read install
	if [[ $install = Y || $install = y ]] ; then
		echo -e "\e[31m[+] Installing knotes now!\e[0m"
		sudo apt-get -y install knotes
		echo -e "\e[32m[-] Done Installing knotes!\e[0m"
	else
		echo -e "\e[32m[-] Ok,maybe later !\e[0m"
	fi


}
# JAVA JDK Update
#################################################################################
######## Install Java version 8
function installjava () {
	echo -e "\e[1;31mThis option will install java!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing Java ======\033[m"
				sleep 2
				echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
				echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
				sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
				sudo apt-get update && sudo apt-get -y install oracle-java8-installer
				echo -e "\033[32m====== Done Installing ======\033[m"
				echo -e "\033[32mTo remove java version 1.8\033[m"
				echo -e "\033[32mapt-get --purge remove oracle-java8-installer\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install youtube-dl
function installyoutubedl () {
	echo -e "\e[1;31mThis option will install youtube-dl!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing youtube-dl ======\033[m"
				sleep 2
				sudo apt-get -y install youtube-dl
      else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install VPN-BOOK
function installvpnbook () {
if [ ! -f /root/Desktop/vpnbook.sh ]; then
	echo -e "\e[1;31mThis option will install VPN-BOOK!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing VPN-BOOK ======\033[m"
				sleep 2
				cd /root/Desktop
				wget https://github.com/Top-Hat-Sec/thsosrtl/blob/master/VeePeeNee/VeePeeNee.sh
				mv VeePeeNee.sh vpnbook.sh
				chmod a+x vpnbook.sh
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
	else
		echo -e "\e[32m[-] VPN-BOOK already installed !\e[0m"
	fi
}

######## Install Tor Browser
function installtorbrowser () {
if [ ! -f /root/tor-browser_en-US/Browser/start_tor_browser ]; then
	echo -e "\e[1;31mThis option will install Tor Browser!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing Tor Browser ======\033[m"
				sleep 2
				cd /root/Desktop
				wget https://www.torproject.org/dist/torbrowser/4.5.3/tor-browser-linux32-4.5.3_en-US.tar.xz
				tar -xf tor-browser-linux32-4.5.3_en-US.tar.xz
				cd /root/Desktop/tor-browser_en-US/Browser/
				mv start-tor-browser start-tor-browser.txt
				sed -i 's/`id -u`" -eq 0/`id -u`" -eq 1/g' start-tor-browser.txt
				mv start-tor-browser.txt start-tor-browser
				cd ..
				ls -ld
				chown -R root:root .
				ls -ld
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
	else
		echo -e "\e[32m[-] Tor Browser already installed !\e[0m"
	fi
}
######## Install VPN
function installvpn () {
	echo -e "\e[1;31mThis option will install VPN!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing VPN ======\033[m"
				sleep 2
				sudo apt-get -y install network-manager-openvpn
				sudo apt-get -y install network-manager-openvpn-gnome
				sudo apt-get -y install network-manager-pptp
				sudo apt-get -y install network-manager-pptp-gnome
				sudo apt-get -y install network-manager-strongswan
				sudo apt-get -y install network-manager-vpnc
				sudo apt-get -y install network-manager-vpnc-gnome
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install Archive-Manager
function installarchivemanager () {
	echo -e "\e[1;31mThis option will install Archive Manager!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing Archive Manager ======\033[m"
				sleep 2
				sudo apt-get -y install unrar unace rar unrar p7zip zip unzip p7zip-full p7zip-rar file-roller
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install Gdebi
function installgdebi () {
	echo -e "\e[1;31mThis option will install Gdebi!\e[0m"
	echo -e "\e[1;31mgdebi lets you install local deb packages resolving and installing its dependencies. apt does the same, but only for remote (http, ftp) located packages.!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing Gdebi ======\033[m"
				sleep 2
				sudo apt-get -y install gdebi &>/dev/nul
				echo -e "\033[32m====== Done Installing Gdebi ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install bittorrent client
function installbittorrent () {
	echo -e "\e[1;31mThis option will install bittorrent!\e[0m"
	echo -e "\e[1;31mThis is a transitional dummy package to ensure clean upgrades from old releases (the package deluge-torrent is replaced by deluge)!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing bittorrent ======\033[m"
				sleep 2
				sudo apt-get -y install deluge-torrent &>/dev/null
				echo -e "\033[32m====== Done Installing bittorrent ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install Fix Sound Mute
function installfixsoundmute () {
	echo -e "\e[1;31mThis option will fix sound mute on Kali Linux on boot!\e[0m"
	echo -e ""
	echo -e "Do you want to install alsa-utils to fix it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Fixing sound mute ======\033[m"
				sleep 2
				sudo apt-get -y install alsa-utils &>/dev/null
				echo -e "\033[32m====== Done Installing alsa-utils ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install Change ubuntu Login Wallpaper
function installchangelogin () {
	echo -e "\e[1;31mThis option will change ubuntu Login Wallpaper!\e[0m"
	echo -e "\e[1;31mPlace wallpaper that you want to make as ubuntu Login Wallpaper on Desktop\e[0m"
	echo -e "\e[1;31mAfter that, Rename it to "login-background.png" (.png format)\e[0m"
	echo -e ""
	echo -e "Do you want to change it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Changing ubuntu Login Wallpaper ======\033[m"
				sleep 2
				cd /usr/share/images/desktop-base/
				sudo mv login-backgroung.{png,png.bak}
				sudo mv /root/Desktop/login-background.png /usr/share/images/desktop-base/
				echo -e "\033[32m====== Done Changing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install Atom
function installatom () {
	echo -e "\e[1;31mThis option will install Atom!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing Atom ======\033[m"
				sleep 2
				sudo add-apt-repository ppa:webupd8team/atom
        sudo apt-get update && sudo apt-get install atom
				echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install VLC
function installvlc () {
	echo -e "\e[1;31mThis option will install VLC!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing VLC ======\033[m"
				sleep 2
        sudo apt-get install vlc
				echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install google chrome
function installchrome () {
	echo -e "\e[1;31mThis option will install Chrome!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing Chrome ======\033[m"
				sleep 2
        sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
        wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
        sudo apt-get update && sudo apt-get install google-chrome-stable
				echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install Clementine
function installclementine () {
	echo -e "\e[1;31mThis option will install Clementine!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing Clementine ======\033[m"
				sleep 2
        sudo add-apt-repository ppa:otto-kesselgulasch/clementine
        sudo apt-get update && sudo apt-get install clementine
				echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install Midnight Commander
function installmc () {
	echo -e "\e[1;31mThis option will install mc!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing mc ======\033[m"
				sleep 2
        sudo add-apt-repository ppa:eugenesan/ppa
        sudo apt-get update && sudo apt-get install mc
				echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install Telegram Desktop
function installtelegram () {
	echo -e "\e[1;31mThis option will install Telegram!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing Telegram ======\033[m"
				sleep 2
        sudo add-apt-repository ppa:atareao/telegram
        sudo apt-get update && sudo apt-get install telegram
				echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install Device Driver Manager
function installddm () {
	echo -e "\e[1;31mThis option will install Device Driver Manager!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing Device Driver ======\033[m"
				sleep 2
        sudo add-apt-repository ppa:noobslab/apps
        sudo apt-get update && sudo apt-get install ddm
				echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Install Kodi
function installkodi () {
	echo -e "\e[1;31mThis option will install Kodi!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing Kodi ======\033[m"
				sleep 2
        sudo add-apt-repository ppa:team-xbmc/xbmc-nightly
        sudo add-apt-repository ppa:team-xbmc/ppa
        sudo apt-get update && sudo apt-get install kodi
				echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
########Insatll GNS3
function installgns3 () {
	echo -e "\e[1;31mThis option will install gns3!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing gns3 ======\033[m"
				sleep 2
        sudo add-apt-repository ppa:gns3/ppa
        sudo apt-get update
        sudo apt-get install dynamips gns3
				echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
########Insatll Wireshark2
function installwireshark2 () {
	echo -e "\e[1;31mThis option will install Wireshark2!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing Wireshark2! ======\033[m"
				sleep 2
        sudo add-apt-repository ppa:wireshark-dev/stable
        sudo apt-get update &&  sudo apt-get install wireshark
        sudo dpkg-reconfigure wireshark-common
				echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
########Insatll Steam
function installsteam () {
	echo -e "\e[1;31mThis option will install steam!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing steam ======\033[m"
				sleep 2
        sudo apt-get update && sudo apt-get install steam -y
        echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
########Insatll nmap
function installnmap () {
	echo -e "\e[1;31mThis option will install nmap!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing nmap ======\033[m"
				sleep 2
        sudo apt-get update && sudo apt-get install nmap -y
				echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
########Insatll unity tweak tools
function installutt () {
	echo -e "\e[1;31mThis option will install utt!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing utt ======\033[m"
				sleep 2
        sudo apt-get update && sudo apt-get install unity-tweak-tool gnome-tweak-tool
				echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
########Insatll Grub-costomizer
function installgrubcostomizer () {
	echo -e "\e[1;31mThis option will install Grub-costomizer!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing Grub-costomizer ======\033[m"
				sleep 2
        sudo add-apt-repository ppa:danielrichter2007/grub-customizer
        sudo apt-get update && sudo apt-get install grub-customizer
				echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
########Insatll Sublime text
function installsublimetext () {
	echo -e "\e[1;31mThis option will install sublimetext!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing sublimetext ======\033[m"
				sleep 2
        sudo add-apt-repository ppa:webupd8team/sublime-text-3
        sudo apt-get update
        sudo apt-get install sublime-text-installer
				echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
########Insatll calssic menu indicator
function installclassicmenu () {
	echo -e "\e[1;31mThis option will install classic menu indicator!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing classic menu indicator ======\033[m"
				sleep 2
        sudo add-apt-repository ppa:diesch/testing
        sudo apt-get update
        sudo apt-get install classicmenu-indicator
				echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
########Insatll Gimp
function installgimp () {
	echo -e "\e[1;31mThis option will install gimp!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing gimp ======\033[m"
				sleep 2
        sudo add-apt-repository ppa:otto-kesselgulasch/gimp
        sudo apt-get update && sudo apt-get install gimp
				echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
########Insatll Gparted
function installgparted () {
	echo -e "\e[1;31mThis option will install gparted!\e[0m"
	echo -e ""
	echo -e "Do you want to install it ? (Y/N)"
			read install
			if [[ $install = Y || $install = y ]] ; then
				echo -e "\033[31m====== Installing gparted ======\033[m"
				sleep 2
        sudo apt-get update && sudo apt-get install gparted
				echo -e "\033[32m====== Done Installing ======\033[m"
			else
				echo -e "\e[32m[-] Ok,maybe later !\e[0m"
			fi
}
######## Software and System Tools menu
function softwaresandystemtools () {
  clear
  tput bold; echo -e "
\033[32m################################################################################\033[m
                 Ubuntu Desktop Manager, Software and Toolkit script
\033[32m################################################################################\033[m
        \033[1;36mScript by All things to do after installing Ubuntu Version : 1.0\033[m

                          ./+o+-          Host  : \033[32m$HOSTNAME\033[m
                  yyyyy- $c2-yyyyyy+         OS    : \033[32m$OS\033[m
               $c1://+//////$c2-yyyyyy0         Kerne : \033[32m$KERNEL\033[m
           .++ $c1.:/++++++/-$c2.+sss/\`         Uptime: \033[32m$UPTIME\033[m
         .:++o:  $c1/++++++++/:--:/-
        o:+o+:++.$c1\`..\`\`\`.-/oo+++++/
       .:+o:+o/.$c1          \`+sssoo+/       Script Location : \033[32m$0\033[m
  .++/+:$c3+oo+o:\`     I       /sssooo.      Connection Info :---------------------
 /+++//+:$c3\`oo+o     LOVE      /::--:.      Gateway         : \033[32m$DEFAULT_ROUTE\033[m
 \+/+o+++$c3\`o++o    UBUNTU     ++////.      Interface       : \033[32m$IFACE\033[m
  .++.o+$c3++oo+:\`             /dddhhh.      My LAN Ip       : \033[32m$MYIP\033[m
       .+.o+oo:.          \`oddhhhh+       Current User    : \033[32m$DEFAULT_USER\033[m
        \+.++o+o\`$c2\`-\`\`\`\`.:ohdhhhhh+
         \`:o+++ $c2\`ohhhhhhhhyo++os:
           .o:$c2\`.syhhhhhhh/$c3.oo++o\`
               /osyyyyyyo$c3++ooo+++/
                   \`\`\`\`\` $c3+oo+++o\:
                          \`oo++.
\033[31m##################################################################################\033[m
\033[31m#####                       Software and System Tools                        #####\033[m
\033[31m##################################################################################\033[m"
select menusel in "VirtualBox" "Bleachbit" "GoldenDict" "Krita" "ibus" "wpsoffice" "knotes" "Java" "youtube-dl" "VPN-BOOK" "Tor Browser" "VPN" "Archive-Manager" "Gdebi" "bittorrent client" "Fix Sound Mute" "Change ubuntu Login Wallpaper" "Atom" "VLC" "google chrome" "Clementine" "Midnight Commander" "Telegram Desktop" "Device Driver Manager" "Kodi" "Wireshark2" "Nmap" "GNS3" "Steam" "Unity-Tweak-Tool" "Gurb-Customizer" "Sublime-Text" "Classic-Menu-Indicator" "Gimp" "Gparted" "Install All" "Back to Main"; do
case $menusel in
	"VirtualBox")
		installvirtualbox
		pause
		softwaresandystemtools ;;

	"Bleachbit")
		installbleachbit
		pause
		softwaresandystemtools ;;

	"GoldenDict")
		installGoldendict
		pause
		softwaresandystemtools ;;

	"Krita")
		installkrita
		pause
		softwaresandystemtools ;;

	"ibus")
		installibus
		pause
		softwaresandystemtools ;;

	"wpsoffice")
		installwpsoffice
		pause
		softwaresandystemtools ;;

	"knotes")
		installknotes
		pause
		softwaresandystemtools ;;


	"Java")
		installjava
		pause
		softwaresandystemtools ;;

	"youtube-dl")
		installyoutubedl
		pause
		softwaresandystemtools ;;

	"VPN-BOOK")
		installvpnbook
		pause
		softwaresandystemtools ;;

	"Tor Browser")
		installtorbrowser
		pause
		softwareandsystemtools ;;

  "VPN")
		installvpn
		pause
		softwaresandystemtools ;;

  "Archive-Manager")
		installarchivemanager
		pause
		softwaresandystemtools ;;

  "Gdebi")
		installgdebi
		pause
		softwaresandystemtools ;;

  "bittorrent client")
		installbittorrent
    pause
		softwaresandystemtools ;;

	"Fix Sound Mute")
		installfixsoundmute
		pause
		softwaresandystemtools ;;

  "Change ubuntu Login Wallpaper")
		installchangelogin
    pause
		softwaresandystemtools ;;

  "Atom")
		installatom
    pause
		softwaresandystemtools ;;

  "VLC")
		installvlc
		pause
		softwaresandystemtools ;;

	"google chrome")
		installchrome
		pause
		softwaresandystemtools ;;

	"Clementine")
		installclementine
		pause
		softwaresandystemtools ;;

	"Midnight Commander")
		installmc
		pause
		softwaresandystemtools ;;

    "Telegram Desktop")
    installtelegram
    pause
    softwaresandystemtools ;;

    "Device Driver Manager")
    installddm
    pause
    softwaresandystemtools ;;

    "Kodi")
    installkodi
    pause
    softwaresandystemtools ;;

    "Wireshark2")
    installwireshark2
    pause
    softwaresandystemtools;;

    "Nmap")
    installnmap
    pause
    softwaresandystemtools;;

    "GNS3")
    installgns3
    pause
    softwaresandystemtools;;

    "Steam")
    installsteam
    pause
    softwaresandystemtools;;

    "Unity-Tweak-Tool")
    installutt
    pause
    softwaresandystemtools;;

    "Gurb-Customizer")
    installgrubcostomizer
    pause
    softwaresandystemtools;;

    "Sublime-Text")
    installsublimetext
    pause
    softwaresandystemtools;;

    "Classic-Menu-Indicator")
    installclassicmenu
    pause
    softwaresandystemtools;;

    "Gimp")
    installgimp
    pause
    softwaresandystemtools;;

    "Gparted")
    installgparted
    pause
    softwaresandystemtools;;

	"Install All")
		echo -e "\e[36mJava is install seperately choose it from the Software and System Tools menu\e[0m"
		installvirtualbox
		installbleachbit
		installGoldendict
		installkrita
		installibus
		installwpsoffice
		installknotes
    installjava
    installyoutubedl
		installvpnbook
    installtorbrowser
    installvpn
		installarchivemanager
		installgdebi
		installbittorrent
		installfixsoundmute
		installchangelogin
    installatom
    installvlc
    installchrome
    installclementine
    installmc
    installtelegram
    installddm
    installkodi
    installwireshark2
    installnmap
    installgns3
    installsteam
    installutt
    installgrubcostomizer
    installsublimetext
    installclassicmenu
    installgimp
    installgparted
		echo -e "\e[32m[-] Done Installing Software and System Tools\e[0m"
		pause
		softwaresandystemtools ;;

	"Back to Main")
		clear
		mainmenu ;;

	*)
		screwup
		softwaresandystemtools ;;


esac

break

done
}
########################################################
##             Main Menu Section
########################################################
function mainmenu () {
clear
tput bold; echo -e "
\033[32m################################################################################\033[m
               Ubuntu Desktop Manager, Software and Toolkit script
\033[32m################################################################################\033[m
      \033[1;36mScript by All things to do after installing Ubuntu :: Version : 1.0\033[m

                          ./+o+-          Host  : \033[32m$HOSTNAME\033[m
                  yyyyy- $c2-yyyyyy+         OS    : \033[32m$OS\033[m
               $c1://+//////$c2-yyyyyy0         Kerne : \033[32m$KERNEL\033[m
           .++ $c1.:/++++++/-$c2.+sss/\`         Uptime: \033[32m$UPTIME\033[m
         .:++o:  $c1/++++++++/:--:/-
        o:+o+:++.$c1\`..\`\`\`.-/oo+++++/
       .:+o:+o/.$c1          \`+sssoo+/       Script Location : \033[32m$0\033[m
  .++/+:$c3+oo+o:\`     I       /sssooo.      Connection Info :---------------------
 /+++//+:$c3\`oo+o     LOVE      /::--:.      Gateway         : \033[32m$DEFAULT_ROUTE\033[m
 \+/+o+++$c3\`o++o    UBUNTU     ++////.      Interface       : \033[32m$IFACE\033[m
  .++.o+$c3++oo+:\`             /dddhhh.      My LAN Ip       : \033[32m$MYIP\033[m
       .+.o+oo:.          \`oddhhhh+       Current User    : \033[32m$DEFAULT_USER\033[m
        \+.++o+o\`$c2\`-\`\`\`\`.:ohdhhhhh+
         \`:o+++ $c2\`ohhhhhhhhyo++os:
           .o:$c2\`.syhhhhhhh/$c3.oo++o\`
               /osyyyyyyo$c3++ooo+++/
                   \`\`\`\`\` $c3+oo+++o\:
                          \`oo++.
\033[32m################################################################################\033[m"
echo -e "\033[1;36mSelect Your Choice :...........\033[m"
select menusel in "Desktop Manager in ubuntu 16.04 lts" "Software and System Tools" "EXIT PROGRAM"; do
case $menusel in
	"Desktop Manager in ubuntu 16.04 lts")
		Desktopmanager
		clear ;;

	"Software and System Tools")
		softwaresandystemtools
		clear ;;

	"EXIT PROGRAM")
		clear && exit 0 ;;

	* )
		screwup
		clear ;;
esac

break

done
}
while true; do mainmenu; done
