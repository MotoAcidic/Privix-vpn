#!/bin/bash
# Copyright (c) 2019 Privix. Released under the MIT License.

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=6
BACKTITLE="VPX VPN Setup Wizard"
TITLE="VPX VPN Setup"
MENU="Choose one of the following options:"

OPTIONS=(1 "ipsec"
		 2 "pptp"
		 3 "privixvpn"
         4 "exit"
)


CHOICE=$(whiptail --clear\
		--backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1) # ipsec
		cd ipsec
		bash install.sh
        ;;
	    
        2) # pptp
		cd pptp
		bash install.sh
		;;

		3) # privixvpn
		cd privixvpn
		bash privixvpn
		;;

		4) # Exit Script
		exit 1
		;;

esac