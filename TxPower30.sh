#!/bin/bash
# Script that auto-sets the TxPower of chosen wireless card to 30
# Warning: May be illegal in some countries.
# User agrees to not use this script in any unlawful manner.
# License:"AS-IS"
# Creator: Nikolas Efthimiadis (aka w1n5t0ngr)
# GitHub: https://github.com/w1n5t0ngr

#Color Variables
RED='\033[0;31m'
NC='\033[0m' # No Color
LRED='\033[1;31m'

#Main Script
if [ "$1" == "" ]
then
	echo "Enter wireless adapter:(Default: wlan0) "
	read input
elif [ "$1" == "-h" ] || [ "$1" == "--help" ]
then
	echo -e "\n${LRED}Usage: ${NC}./TxPower.sh${RED} [wireless adapter]\n"
	exit 1
else
	input="$1"
fi
if [ "$input" == "" ]
then
	input="wlan0"
	ifconfig $input down
	iw reg set BO
	ifconfig $input up
	iwconfig $input txpower 30
	echo -e "Done!"
else
	ifconfig $input down
	iw reg set BO
	ifconfig $input up
	iwconfig $input txpower 30
	echo -e "Done!"
fi
