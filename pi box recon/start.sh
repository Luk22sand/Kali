#!bin/bash

echo
echo "-------------------- #welcome to Wifi harvaster ------------------------"
echo "
[+] 1 = run scanner & filtering
[+] 2 = check vendors
[+] 3 = run harvaster on AP or vendors
[+] 4 = delete recon or save files to location*
[+] 5 = cancel"

echo
echo "------------------------"
echo "pick a number from above"

read n
case "$n" in
"1") sudo bash scan.sh;;
"2") sudo bash loop2.sh;;
"3") sudo bash harvaster.sh;;
"4") sudo bash loc_bcp.sh;;
"5") echo "Cancel";;
esac


