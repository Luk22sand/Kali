#!bin/bash
echo "######### go deep to net ######### "
echo
echo " what NIC to use?

[+] 1 = wlan0
[+] 2 = wlan1"

read wlan

case "$wlan" in
"1") w="wlan0";;
"2") w="wlan1";;
esac

echo "paste wifi-network MAC address: "
read nm

echo "paste wifi-network channel"
read nc

sudo airodump-ng -c $nc --bssid $nm $w
