#!bin/bash
echo "######### welcome to Creeper_TV ######### "
echo
echo " what NIC to use?

[+] 1 = wlan0
[+] 2 = wlan1"

read wlan

case "$wlan" in
"1") w="wlan0";;
"2") w="wlan1";;
esac

echo "{+} -- Starting to monitor creeper network in the area -- {+}"

echo "paste wifi-network/hidden camera MAC address: "
read nm

echo "paste wifi-network/camera monitoring channel"
read nc
sudo airodump-ng -c $nc --bssid $nm $w


#sudo airodump-ng -c 1 --bssid 00:1E:B5:68:72:7A $w
