#!/bin/bash
# Copyright (c) 2019 Privix. Released under the MIT License.


# Ask user if they would like to install the vpn software after node install.
    echo -e "${GREEN}Would you like to install Privix VPN? Y or N${GREEN}"
read USER_INPUT
if $USER_INPUT [[ -z "Y" ]];
    then
	echo "Please read the terms of service document that can located here: Privix.io"
	echo "If you accept and acknowledge the terms Press Y if not Press N."
	read AGREEMENT
		if $AGREEMENT [[ -z "Y"]]
			then
			cd 
			cd /Privix-vpn/VPN/privixvpn/
			bash install.sh
		elif $AGREEMENT[[ -z "N" ]]
			then
			echo Vpx configuration file created successfully. 
			echo Vpx Server Started Successfully using the command ./privixd -daemon
			echo If you get a message asking to rebuild the database, please hit Ctr + C and run ./privixd -daemon -reindex
			echo If you still have further issues please reach out to support in our Discord channel. 
			echo Please use the following Private Key when setting up your wallet: $GENKEY
			exit 0
	elif $USER_INPUT[[ -z "N" ]]
		then
		echo Vpx configuration file created successfully. 
		echo Vpx Server Started Successfully using the command ./privixd -daemon
		echo If you get a message asking to rebuild the database, please hit Ctr + C and run ./privixd -daemon -reindex
		echo If you still have further issues please reach out to support in our Discord channel. 
		echo Please use the following Private Key when setting up your wallet: $GENKEY
	exit 0
fi