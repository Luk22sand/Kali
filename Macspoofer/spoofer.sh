!#bin/bash
echo "######### spoof the MAC ######### "
echo
echo " what NIC use?

[+] 1 = wlan0
[+] 2 = wlan1"

read wlan

case "$wlan" in
"1") w="wlan0";;
"2") w="wlan1";;
esac

echo "provide MAC address to be spoofed: "
read mac

echo "managed mode activation .. "
sudo ifconfig $w down; sleep 0.5;sudo iwconfig $w mode managed; sleep 0.5;sudo ifconfig $w up;sleep 0.5;
echo "activation completed ... ";

echo "starting mac change ... ";
sudo ifconfig $w down;sleep 0.5;sudo ifconfig $w hw ether $mac; sleep 0.5;sudo ifconfig $w up;
echo "mac address has been changed... test AP ;)"
