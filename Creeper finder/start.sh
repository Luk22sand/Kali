#!bin/bash

echo
echo "-------------------- #welcome to Creeper_TV ------------------------"
echo "
[+] 0 = change network service status
[+] 1 = run creeper network monitoring
[+] 2 = run wireSHark
[+] 3 = cancel"

echo
echo "------------------------"
echo "pick a number from above"

read n
case "$n" in
"0") sudo bash net_service.sh;;
"1") sudo bash creep_tv.sh;;
"2") sudo bash wireshark.sh;;
"3") echo "Cancel";;
esac
