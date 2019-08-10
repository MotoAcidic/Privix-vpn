#!/bin/bash
# Copyright (c) 2019 Privix. Released under the MIT License.

LOG_FILE="/etc/openvpn/terms_log.txt"
LOGTIME=`date "+%Y-%m-%d %H:%M:%S"`
EXTIP=`curl -s4 icanhazip.com`

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
		echo ${LOGTIME} " : Choice 1 Selected by User on vps ${EXTIP}. Yes Proceed to read Terms of Service" >> ${LOG_FILE}
		cd
		cat privix-vpn/Docs/Temp_Terms_of_Service/Terms.md
        ;;

		2) # Yes move to vpn selection
		echo ${LOGTIME} " : Choice 2 Selected by User on vps ${EXTIP}. Yes Proceed without reading"  >> ${LOG_FILE}
		cd
		bash privix-vpn/VPN/VPN_Selection_Install.sh
		 
        ;;
	    
        3) # No Exit
		echo ${LOGTIME} " : Choice 3 Selected by User on vps ${EXTIP}. No" >> ${LOG_FILE}
		exit 1
		;;


esac