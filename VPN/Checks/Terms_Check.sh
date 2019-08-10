#!/bin/bash
# Copyright (c) 2019 Privix. Released under the MIT License.

LOG_FILE="/etc/openvpn/terms_log.txt"

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=6
BACKTITLE="Terms Check"
TITLE="VPX VPN Terms And Condidtions"
MENU="Do You Accept The Terms and conditions here: privix.io"

OPTIONS=(1 "Yes Proceed to read Terms of Service"
		 2 "Yes Proceed without reading"
		 3 "No"
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
        1) # Yes read the terms of service docoument
		printf "%(%Y-%m-%d %T)T %s\n" -1 "$CHOICE"  >> ${LOG_FILE}
		cd
		cd privix-vpn/Docs/Temp_Terms_of_Service/
		cat Terms.md
        ;;

		2) # Yes move to vpn selection
		printf "%(%Y-%m-%d %T)T %s\n" -1 "$CHOICE"  >> ${LOG_FILE}
		cd
		cd privix-vpn/VPN/
		bash VPN_Selection_Install.sh
        ;;
	    
        3) # No Exit
		printf "%(%Y-%m-%d %T)T %s\n" -1 "$CHOICE"  >> ${LOG_FILE}
		exit 1
		;;


esac