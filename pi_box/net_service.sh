#!bin/bash
#network serivce manager

echo "
[+] 1 = deactivate netserv
[+] 2 = activate netserv
[+] 3 = Cancel"

read n
case "$n" in
"1") echo `sudo systemctl stop NetworkManager.service && sudo systemctl stop wpa_supplicant.service` && echo "deactivation completed";;
"2") echo `sudo systemctl start NetworkManager.service && sudo systemctl start wpa_supplicant.service` && echo "activation completed";;
"3") echo "Cancel";;
esac
