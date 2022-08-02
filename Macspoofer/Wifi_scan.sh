#!bin/bash
echo "######### Scan the area ######### "
echo
echo " what NIC to use?

[+] 1 = wlan0
[+] 2 = wlan1"

read wlan

case "$wlan" in
"1") w="wlan0";;
"2") w="wlan1";;
esac

sudo ifconfig $w down; sleep 0.5;sudo iwconfig $w mode monitor; sleep 0.5;sudo ifconfig $w up;echo "NIC monitor mode ready";sleep 0.5;
echo "starting wifi scan";sleep 0.5;
sudo airodump-ng $w;
