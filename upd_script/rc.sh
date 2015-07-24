#!/bin/sh -e
# This Script updates the hostname by reading it from "/boot/hostname" 
echo "  _____            _                                ";
echo " |  __ \          | |                               ";
echo " | |  | | _____  _| |_ ___ _ __                     ";
echo " | |  | |/ _ \ \/ / __/ _ \ '__|                    ";
echo " | |__| |  __/>  <| ||  __/ |                       ";
echo " |_____/ \___/_/\_\\__\___|_| _        _            ";
echo " |_   _|         | |         | |      (_)           ";
echo "   | |  _ __   __| |_   _ ___| |_ _ __ _  ___  ___  ";
echo "   | | | '_ \ / _    | | |   __| __|  | |/ _ \/ __| ";
echo "  _| |_| | | | (_| | |_| \__ \ |_| |  | |  __/\__ \ ";
echo " |_____|_| |_|\__,_|\__,_|___/\__|_|  |_|\___||___/ ";
echo "                                                    ";
echo "                                                    ";
echo " "

# First get the hostname.

THISHOST=$(hostname -f)	# Gets current hostname
echo $THISHOST
read -r NEW_HOST < /boot/hostnames	# Gets hostname in file
echo $NEW_HOST

if [ "$FIRSTLINE" != "$THISHOST" ];	# If the hostname isn't the same as the First line of the filename . . .
	then echo "Host is different name.  Rewriting hosts"
	# Rewrite hosts
	IP="127.0.1.1  		$NEW_HOST"
	sed -i '$ d' /etc/hosts
	echo $IP >> hosts

	echo "Delete hostname."

	sudo rm /etc/hostname
	echo "Deleted hostname.  Create new hostname."
	echo $NEW_HOST >> /etc/hostname
	echo "New hostname file created."
	
	echo "Commit hostname change."
	sudo /etc/init.d/hostname.sh

	sudo reboot
fi
