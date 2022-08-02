#!bin/bash
#scan

echo " what NIC use to scan? 

[+] 1 = wlan0
[+] 2 = wlan1"

read wlan

case "$wlan" in
"1") w="wlan0";;
"2") w="wlan1";;
esac


echo "
[+] 1 = run scanner in cli
[+] 2 = run scan to file --saved to ./targets/ as target
[+] 3 = filter target file
[+] 4 = Cancel"


read n
case "$n" in
"1") sudo hcxdumptool --do_rcascan -i $w;;
"2") sudo hcxdumptool --do_rcascan -i $w |tee ./targets/targets;;
"3") sudo sort ./targets/targets | uniq -d | tee ./targets/target.txt;;
"4") echo "Cancel";;
esac
