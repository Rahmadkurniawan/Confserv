#!/bin/bash

#######################################################################
#
# Minor Project By Rahmad, Ilham, Agung
# Automatic Hardening Linux Server Based Debian
# Tugas Pengantar Teknologi Informasi
# Dosen Pak. Ahmad Luthfi
# Please do not delete copyright
# Coded by Rahmad
# DO DOT DELETE THE COPYRIGHT
#######################################################################
loading ()
{
    bar="............................................................................."
    barlength=${#bar}
    i=0
    while ((i < 100)); do
        n=$((i*barlength / 100))
        printf "\e[00;34m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.05
    done
}
clear
loading
echo -e ""
clear
ask=Menu
	while [ $ask == "Menu" ]; do
black='\e[0;30m'
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
blue='\e[0;34m'
purple='\e[1;35m'     
lightgreen='\e[0;39m'
echo -e $lightgreen'                          ________
          Welcome to     | ______o|
         _______________ ||__---_||
        |  ___________  || ______ |
        | |           | |||______||
        | |   MINOR   | ||--------|
        | |  PROJECT  | ||      O |
        | |           | ||      | |
        | *-----------* ||      | |
        |_____________0_||      | |
          __/_______\__  |::::::::|
         ________________ -..__
        /:::::::::*:::*::\  _\\ \___
       /::======::: .:.:::\ \ \_)  \
       --------------------- *-----*'

echo -e $red '###################################################'
echo -e $green'  -=[' $purple'        Welcome On Confserv	  ' $green'     -=]'
echo -e $green'  -=[' $blue '  Created By' $lightgreen'Rahmad, Ilham, Agung' $green'       -=]'
echo -e $green'  -=[' $lightgreen'Version' $red 'Aplha | '$lightgreen'Codename' $red : [Confserv]'  '$green '-=]'
echo -e $green'  -=[' $red'Report Bugs :' $lightgreen''$lightgreen'rahmadkrniawan@gmail.com'$lightgreen'"' $green'  -=]'
echo -e $green'  -=[' $lightgreen'  MyBlog : '$yellow'http://rahmadkurniawan.org'$green'     -=]'
echo -e "$purple This program comes with ABSOLUTELY NO WARRANTY; for details type 'show' or type '6'"
echo -e "$purple This is free software, and you are welcome to redistribute it"
echo -e ""
echo -e $lightgreen'Choose From the mainmenu :'
echo -e ""
echo -e "    1) Basic Configuration"
echo -e "    2) Install Server"
echo -e "    3) Hardening Server" 
echo -e "    4) About, License and Thanks"
echo -e ""
echo -e "    0) Exit" 
echo -e ""

echo -e "Confserv ($blue'MAINMENU'$lightgreen): \c"
	read MAINMENU
	if [ $MAINMENU = "1" ]; then
		ask=pertama
		while [ $ask == "pertama" ]; do
		echo -e ""
		echo -e "[$red*$lightgreen] Select Basic Configuration :"
		echo -e ""
		echo -e	"1. Configuration ip address"
		echo -e "2. Configuration dns"
		echo -e "3. Add Repository"
		echo -e ""
		echo -e "0. Back"
		echo -e ""
		echo -e "Basic Configuration ($blue'Basic'$lightgreen) Select Number : \c"
		read basic
			if [ $basic == "1" ]; then
				echo -e ""
				echo -e "Enter interface (ex. eth0) : \c"
				read ifce
				echo -e "Enter ip you want (ex:192.168.1.1): \c"
				read ip
				echo -e "Enter netmask you want (ex:255.255.255.0): \c"
				read nmask
				echo -e "auto $ifce\niface $ifce inet static\n   address $ip\n   netmask $nmask" > /etc/network/interfaces
				loading
				/etc/init.d/networking restart
				clear
				echo -e "Konfigurasi IP telah selesai"
				echo -e ""
				ask=pertama
			elif [ $basic == "2" ]; then
				echo -e ""
				echo -e "Enter dns: \c"
				read dns
				echo -e "$dns" > /etc/resolv.conf
				loading
				echo -e ""
				echo -e "DNS Telah di tambahkan"
				echo -e "" 
				clear
				echo -e "DNS telah Ditambahkan"
				echo -e ""
				ask=pertama
			elif [ $basic == "3" ]; then
				echo -e ""
				echo -e "deb http://security.debian.org/ wheezy/updates main contrib non-free\ndeb-src http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list
				apt-get update
				echo -e ""
				loading
				echo -e ""
				echo -e "Repository Telah Ditambahkan"
				echo -e "" 
				echo -e "Silahkan tunggu proses update Repository"
				ask=pertama
			elif [ $basic = "0" ]; then
				clear
				ask=Menu
			fi
		done

 
	elif [ $MAINMENU = "2" ]; then
		ask=kedua
		while [ $ask == "kedua" ]; do
		echo -e ""
		echo -e "[*] Install dan Configuration Server You Want :"
		echo -e ""
		echo -e "1. DNS Server"
		echo -e "2. Web Server"
		echo -e "3. FTP Server"
		echo -e "4. E-mail Server"
		echo -e "5. Proxy Server"
		echo -e "6. DHCP Server"
		echo -e "7. NTP Server"
		echo -e "8. Samba Server"
		echo -e "9. Database Server "
		echo -e ""
		echo -e "0. Back to Mainmenu"
		echo -e ""
		echo -e "Confserv ($blue'Configuration'$lightgreen): \c"
		read configuration
			if [ $configuration == "1" ]; then
				clear
				loading
				echo -e ""
				echo -e "[*] Install and Configuration DNS Server :"
				echo -e ""
				echo -e "1. Install DNS Server"
				echo -e "2. Configuration DNS Server"
				echo -e ""
				echo -e "0. Back To Mainmenu"
				echo -e ""
				echo -e "Confserv ($blue'DNS Server'$lightgreen): \c"
				read dnsserver
					if [ $dnsserver == "1" ]; then
						echo -e ""
						clear
						echo -e "[*] Installing DNS Server Process"
						loading
						echo -e ""
						sudo apt-get install bind9 
					elif [ $dnsserver == "2" ]; then
						clear
						echo -e ""
						echo -e "[*]Configuration DNS Server"
						loading
						echo -e ""
						echo -e "1. Config file /etc/bind/named.conf"
						echo -e "2. Config file forward"
						echo -e "3. Config file Reverse"
						echo -e "4. Add DNS to file resolv.conf"
						echo -e ""
						echo -e "0. Back to Mainmenu"
						echo -e "Confserv ($blue'Configuration'$lightgreen): \c"
						read configdns
						if [ $configdns == "1" ]; then
							clear
							echo -e "[*] Opening file named.conf"
							nano /etc/bind/named.conf 
							clear
							ask=kedua
						elif [ $configdns == "2" ]; then
							clear
							echo -e "[*] Copying db.local to db.debian"
							cp /etc/bind/db.local /etc/cache/bind/db.debian 
							loading
							echo -e "Copying file done and open file db.debian"
							nano /var/cache/bind/db.debian
							ask=kedua
						elif [ $configdns == "0" ]; then
							clear
							ask=Menu
						fi
					elif [ $dnsserver == "0" ]; then
						clear
						ask=Menu
					fi

			elif [ $configuration == "2" ]; then
				clear
				loading
				echo -e ""
				echo -e "[*] Install and Configuration DNS Server :"
				echo -e ""
				echo -e "1. Install Web Server"
				echo -e "2. Edit Index.html"
				echo -e ""
				echo -e "0. Back To Mainmenu"
				echo -e ""
				echo -e "Confserv ($blue'Web Server'$lightgreen): \c"
				read webserver
					if [ $webserver == "1" ]; then
						echo -e ""
						echo -e "[*]Installing Web server"
						loading
						sudo apt-get install apache2
						clear
						ask=Menu
					elif [ $webserver == "2" ]; then
						echo -e ""
						echo -e "[*] Editing file index.html"
						loading
						nano /var/www/index.html
						clear
						ask=Menu
					elif [ $webserver == "0" ]; then
						clear
						ask=Menu
					fi
			elif [ $configuration == "3" ]; then
				clear
				loading
				echo -e ""
				echo -e "[*] Install and Configuration FTP Server"
				echo -e ""
				echo -e "1. Install Proftpd"
				echo -e "2. Configuration Proftpd"
				echo -e ""
				echo -e "0. Back to Menu"
				echo -e "Confserv ($blue'FTP Server'$lightgreen): \c"
				read ftpserver
					if [ $ftpserver == "1" ]; then
						echo ""
						echo -e "[*] Installing Proftpd Server"
						sudo apt-get install Proftpd
						clear
						ask=Menu
					elif [ $ftpserver == "2" ]; then
						echo "[*] Configuration Proftpd"
						nano /etc/proftpd/proftpd.conf
						clear
						ask=Menu
					elif [ $webserver == "0" ]; then
						clear
						ask=Menu
					fi
			elif [ $configuration == "4" ]; then
				clear
				loading
				echo -e ""
				echo -e "[*] Install and Configuration E-mail Server"
				echo -e ""
				echo -e "1. Install mail Server"
				echo -e "2. Configuration Mail server"
				echo -e ""
				echo -e "0. Back to Menu"
				echo -e "Confserv ($blue'Mail Server'$lightgreen): \c"
				read mailserver
					if [ $mailserver == "1" ]; then
						echo -e ""
						echo -e "[*] Installing mail server"
						apt-get install postfix courier-imap courier-pop
						clear
						ask=Menu
					elif [ $mailserver == "1" ]; then
						echo -e "[*]Configuration mail server"
						echo -e "1. Add user mail address"
						echo -e "2. Configuration postfix"
						echo -e ""
						echo -e "0. Back to Menu"
						echo -e "Confserv ($blue'Mail Server'$lightgreen): \c"
						read confmail
							if [ $confmail == "1" ]; then
								echo -e ""
								echo -e "[*] Adduser for email"
								echo -e "Masukkan nama user yang kamu mau: \c"
								read namauser
								sudo adduser $namauser
								clear
								ask=Menu
							elif [ $confmail == "2" ]; then
								echo -e ""
								echo -e "[*]Configurasion Postfix"
								echo -e "home_mailbox = Maildir/" > /etc/postfix/main.cf
								dpkg-reconfigure postfix
								/etc/init.d/postfix restart
								/etc/init.d/courier-imap restart
								loading
								clear
								ask=Menu
								echo -e "[*] Proses Konfigurasi Postfix Selesai"
							elif [ $webserver == "0" ]; then
								clear
								ask=Menu
							fi
					elif [ $mailserver == "0" ]; then
						clear
						ask=Menu
					fi
							

			elif [ $configuration == "5" ]; then
				clear
				loading
				echo -e ""
				echo -e "[*] Install and Configuration Proxy Server"
				echo -e ""
				echo -e "1. Install SQUID"
				echo -e "2. Configuration SQUID"
				echo -e ""
				echo -e "0. Back to Menu"
				echo -e "Confserv ($blue'Proxy Server'$lightgreen): \c"
				read ftpserver
					if [ $ftpserver == "1" ]; then
						echo ""
						echo -e "[*] Installing Proxy Server"
						sudo apt-get install Proftpd
						clear
						ask=Menu
					elif [ $ftpserver == "2" ]; then
						echo "[*] Configuration Proxy Server"
						nano /etc/proftpd/proftpd.conf
						clear
						ask=Menu
					elif [ $webserver == "0" ]; then
						clear
						ask=Menu
					fi


			elif [ $configuration == "6" ]; then
				clear
				loading
				echo -e ""
				echo -e "[*] Install and Configuration DHCP Server"
				echo -e ""
				echo -e "1. Install DHCP Server"
				echo -e "2. Configuration DHCP Server"
				echo -e ""
				echo -e "0. Back to Menu"
				echo -e "Confserv ($blue'DHCP Server'$lightgreen): \c"
				read ftpserver
					if [ $ftpserver == "1" ]; then
						echo ""
						echo -e "[*] Installing DHCP Server"
						sudo apt-get install Proftpd
						clear
						ask=Menu
					elif [ $ftpserver == "2" ]; then
						echo "[*] Configuration DHCP Server"
						nano /etc/proftpd/proftpd.conf
						clear
						ask=Menu
					elif [ $webserver == "0" ]; then
						clear
						ask=Menu
					fi

			elif [ $configuration == "7" ]; then
				clear
				loading
				echo -e ""
				echo -e "[*] Install and Configuration NTP Server"
				echo -e ""
				echo -e "1. Install NTP Server"
				echo -e "2. Configuration NTP Server"
				echo -e ""
				echo -e "0. Back to Menu"
				echo -e "Confserv ($blue'NTP Server'$lightgreen): \c"
				read ftpserver
					if [ $ftpserver == "1" ]; then
						echo ""
						echo -e "[*] Installing NTP Server"
						sudo apt-get install Proftpd
						clear
						ask=Menu
					elif [ $ftpserver == "2" ]; then
						echo "[*] Configuration NTP Server"
						nano /etc/proftpd/proftpd.conf
						clear
						ask=Menu
					elif [ $webserver == "0" ]; then
						clear
						ask=Menu
					fi

			elif [ $configuration == "8" ]; then
				clear
				loading
				echo -e ""
				echo -e "[*] Install and Configuration Samba Server"
				echo -e ""
				echo -e "1. Install Samba Server"
				echo -e "2. Configuration Samba Server"
				echo -e ""
				echo -e "0. Back to Menu"
				echo -e "Confserv ($blue'Samba Server'$lightgreen): \c"
				read ftpserver
					if [ $ftpserver == "1" ]; then
						echo ""
						echo -e "[*] Installing Samba Server"
						sudo apt-get install Proftpd
						clear
						ask=Menu
					elif [ $ftpserver == "2" ]; then
						echo "[*] Configuration Samba Server"
						nano /etc/proftpd/proftpd.conf
						clear
						ask=Menu
					elif [ $webserver == "0" ]; then
						clear
						ask=Menu
					fi

			elif [ $configuration == "9" ]; then
				clear
				loading
				echo -e ""
				echo -e "[*] Install and Configuration Database Server"
				echo -e ""
				echo -e "1. Install Database Server"
				echo -e "2. Configuration Database Server"
				echo -e ""
				echo -e "0. Back to Menu"
				echo -e "Confserv ($blue'Database Server'$lightgreen): \c"
				read ftpserver
					if [ $ftpserver == "1" ]; then
						echo ""
						echo -e "[*] Installing Database Server"
						sudo apt-get install Proftpd
						clear
						ask=Menu
					elif [ $ftpserver == "2" ]; then
						echo "[*] Configuration Database Server"
						nano /etc/proftpd/proftpd.conf
						clear
						ask=Menu
					elif [ $webserver == "0" ]; then
						clear
						ask=Menu
					fi
			elif [ $configuration = "0" ]; then
				clear
				ask=Menu
				fi
		done
	elif [ $MAINMENU = "3" ]; then
		clear
		loading
		echo -e ""
		echo -e "[*] Setting up your Server Security"
		echo -e "1. Firewall"
		echo -e "2. Iptables"
		echo -e "3. Web server"
		echo -e "4. FTP Server"
		echo -e ""
		echo -e "0. Back to Menu"
		echo -e "Confserv ($blue'Security'$lightgreen): \c"
		read security
			if [ $security == "1" ]; then
				clear
				loading
				echo -e ""
				echo -e "[*] Setting up your Firewall"
				echo -e "1. Block Incoming Packet"
				echo -e "2. Block Outgoing Packet"
				echo -e "3. Block Specified Port"
				echo -e "4. Create Logging file"
				echo -e ""
				echo -e "0. Back to Menu"
				echo -e "Confserv ($blue'firewall'$lightgreen): \c"
				read firewall
					if [ $firewall == "1" ]; then
						echo -e ""
						echo -e "[*] Block Incoming Packet"
						echo -e "[*] Tunggu Sebentar"
						loading
						echo -e ""
						echo -e "Block Incoming Packet Success"
					elif [ $firewall == "2" ];then
						echo -e ""
						echo -e "[*] Block Outgoing Packet"
						echo -e "[*] Tunggu Sebentar"
						loading
						echo -e "Block Outgoing Packet Success"
						ask = Menu
					elif [ $firewall == "3" ]; then
						echo -e ""
						echo -e "[*] Block Specified Port"
						echo -e "Masukkan port yang mau di block: \c"
						read portblock
						echo -e "[*] Tunggu Sebentar"
						loading
						echo -e "Port $portblock telah di Block"
						ask = Menu
					elif [ $firewall == "4" ]; then
						echo -e ""
						echo -e "[*] Create Logging file"
						echo -e "[*] Tunggu Sebentar"
						loading
						echo -e "Logging file success created"
						ask = Menu
					elif [ $firewall == "5" ]; then
						clear
						ask=Menu
					fi
			elif [ $security == "2" ]; then
				echo -e "[*] Setting up your Iptables"
				echo -e ""
				echo -e "1. Block Incoming Packet"
				echo -e "2. Block Outgoing Packet"
				echo -e ""
				echo -e "0. Back to Menu"
				echo -e " Masukkan pilihan : \c"
				read packet
					if [ $packet == "1" ]; then
						echo -e ""
						echo -e "1. Block ip spesifik"
						echo -e "2. Block satu network"
						echo -e ""
						echo -e "0. Back to Menu"
						echo -e "Pilih : \c"
						read pilihblock
							if [ $pilihblock == "1" ]; then
								echo -e "[*] Block incoming packet spesifik IP"
								echo -e "Masukkan IP spesifik: \c"
								read ipspesifik
								iptables -A INPUT -s $ipspesifik -j DROP
								loading
								echo -e "[*Block incoming packet spesifik IP selesai]"
								clear
								ask=Menu
							elif [ $pilihblock == "2" ]; then
								echo -e "[*] Block incoming packet satu network"
								echo -e "Masukkan ip dan network : \c"
								read ipnetwork
								iptables -A INPUT -s $ipnetwork -j DROP
								clear
								ask=Menu
							elif [ $pilihblock == "0" ]; then
								clear
								ask=Menu
							fi
					elif [ $packet == "2" ]; then
						echo -e ""
						echo -e "1. Block spesifik ip"
						echo -e "2. Block satu network"
						echo -e ""
						echo -e "0. Back to Menu"
						echo -e ""
						echo -e "Pilih : \c"
						read outgoing
							if [ $outgoing == "1" ]; then
								echo -e ""
								echo -e "[*]Block Outgoing Packet spesifik IP"
								echo -e ""
								echo -e "Masukkan IP : \c"
								read ipblock
								iptables -A OUTPUT -s $ipblock -j DROP
								loading
								echo -e "Block outgoing packet spesifik ip selesai"
								clear
								ask=Menu
							elif [ $outgoing == "2" ]; then
								echo -e ""
								echo -e "[*]Block Outgoing Packet spesifik IP"
								echo -e ""
								echo -e "Masukkan IP : \c"
								read ipblocknetwork
								iptables -A OUTPUT -s $ipblocknetwork -j DROP
								loading
								echo -e "Block outgoing packet spesifik ip selesai"
								clear
								ask=Menu 
							elif [ $outgoing == "0" ]; then
								clear
								ask=Menu
							fi
					elif [ $packet == "0" ]; then
						clear
						ask=Menu
					fi
			elif [ $security == "3" ]; then
				echo -e ""
				echo -e "[*] Update security Webserver"
				echo -e "1. Setting up .htaccess"
				echo -e "2. Setting up permission files"
				echo -e "3. Using HTTPS"
				echo -e ""
				echo -e "0. Back to Menu"
				echo -e ""
				echo -e "Confserv ($blue'Webserver'$lightgreen): \c"
				read websecurity
					if [ $websecurity == "1" ]; then
						echo -e "[*] Setting up your htaccess"
						echo -e " Pilih CMS yang kamu pakai"
						echo -e "1. Wordpress"
						echo -e "2. Joomla"
						echo -e "3. Htaccess default"
						echo -e ""
						echo -e "0. Back to menu"
						echo -e "Confserv ($blue'htaccess'$lightgreen: \c"
						read cms
							if [ $cms == "1" ]; then
								clear
								loading
								echo -e "Masukkan path public_html : \c"
								read pathwordpress
								echo -e "[*] htaccess telah ditambahkan"
								clear
								ask=Menu
							elif [ $cms == "2" ]; then
								clear
								loading
								echo -e ""
								echo -e "Masukkan path public_html: \c"
								read pathjoomla
								echo -e "[*] Htaccess joomla default telah ditambahkan"
								clear
								ask=Menu
							elif [ $cms == "3" ]; then
								clear
								loading
								echo -e "Masukkan path public_html : \c"
								read pathdefault
								echo -e "[*]htaccess telah ditambahkan"
							elif [ $cms == "0" ]; then
								clear
								ask=Menu
							fi
						echo -e "Masukkan folder yang mau kamu beri htaccess ex: /var/www/html : \c"
						read htaccess
						echo -e ""
						touch .htaccess

						clear
						ask=Menu
					elif [ $websecurity == "2" ]; then
						echo -e "[*] Setting up permission files"
						echo -e "Ketik lokasi file ex : /etc/www/index.html : \c"
						read permissionfile
						echo -e "Ketik permission yang kamu inginkan ex. 775 : \c"
						read permissionkode
						echo -e ""
						Loading
						chmod $permissionkode $permissionfile
						clear
						ask=Menu
					elif [ $websecurity == "3" ]; then
						loading
						echo -e ""
						echo -e "Installing HTTPS"
						clear
						ask=Menu
					elif [ $websecurity == "0" ]; then
						clear
						ask=Menu
					fi
			elif [ $security == "4" ]; then
				echo -e ""
				loading
				clear
				echo -e "[*] Setting up FTP Server Security"
				echo -e "[*] Installing FTPS"
				sudo apt-get install ftps
				loading
				clear
				ask=Menu
			elif [ $security == "0" ];then
				clear
				ask=Menu
			fi


	elif [ $MAINMENU = "4" ] || [ $MAINMENU = "show" ]; then
license ()
{
		echo -e "$red"
		echo -e " Confserv Alpha Version "
		echo -e " Copyright$yellow(c)$red 2015  $blue'Rahmad Kurniawan'$red"
		echo -e " Original Source by By Rahmad Kurniawan"
		echo -e "$red Codename	: $blue[CS]$red"
		echo -e " Facebook	: /rahmadkrniawan"
		echo -e " Twitter	: @rahmadkrniawan"
		echo -e " Contact	: root@rahmadkurniawan.org"
		echo -e " Website 	: rahmadkurniawan.org"
		echo -e ""
		echo -e " $purple Tested on Kali 1.1.0 i386"
		echo -e "$blue"
		echo -e "	This program is free software: you can redistribute it and/or modify"
		echo -e "	it under the terms of the GNU General Public License as published by"
		echo -e "	the Free Software Foundation, either version 3 of the License, or"
		echo -e "	(at your option) any later version."
		echo -e ""
		echo -e "	This program is distributed in the hope that it will be useful,"
		echo -e "	but $yellow WITHOUT ANY WARRANTY $blue; without even the implied warranty of"
		echo -e "	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
		echo -e "	GNU General Public License for more details."
		echo -e ""
		echo -e "You should have received a copy of the GNU General Public License"
		echo -e "along with this program.  If not, see $red <http://www.gnu.org/licenses/>"
		echo -e ""
		echo -e "$red NOTE:$yellow if you want to modify the script is hope you do not change the name of its author"
		echo -e "$white"
		echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++"
		echo -e "[*] SPECIAL THANKS [*]"
		echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++"
		echo -e "$red"
		echo -e "	* To Pak Ahmad Luthfi Yang telah memberi tugas Minor Project"
		echo -e "	* To KALI LINUX (http://www.kali.org/)"
		echo -e "	* To Editor Sublime Text (http://www.Sublimetext.com/)"
		echo -e "	* To Ebook Debian server final karya Pudja Mansyurin"
		echo -e "	* To ShellCheck Error online who helping even my program got error (http://www.shellcheck.net/)"
		echo -e "	* To My parents who always support me"
		echo -e "	* To Hidemichi-Hiroyuki dan xsanlahci"
}
	license | more
		echo -e "[$red'ENTER'$blue] $white back to Main Menu"
		read maju
		clear
		ask=Menu

	elif [ $MAINMENU = "0" ]; then
		clear
		echo -e "Thanks For Use Confserv :)"
		echo -e "bye bye ^_^ ..."
		exit 0
	fi
done
