#!bin/bash
echo
echo "-------------------- #welcome to Mac Spoofer ------------------------"
echo "
[+] 1 = run wifi area scanner
[+] 2 = go inside Wifi network
[+] 3 = spoof the MAC
[+] 4 = cancel"
echo
echo "------------------------"
echo "pick a number from above"

read n
case "$n" in
"1") sudo bash Wifi_scan.sh;;
"2") sudo bash net_dev_scan.sh;;
"3") sudo bash spoofer.sh;;
"4") echo "Cancel";;
esac
