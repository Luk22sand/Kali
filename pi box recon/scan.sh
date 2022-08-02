#!bin/bash
#scan&filterting

echo "kiling wpa_suplicant"
sudo ps -aux | grep -i wpa | sudo awk '{print $2}' | while read line;do sudo kill $line;done

echo "
[+] 1 = run scanner only in cli
[+] 2 = run scanner and save to file --saved to ./targets/ as target
[+] 3 = filter target file
[+] 4 = Cancel"


read n
case "$n" in
"1") sudo hcxdumptool --do_rcascan -i wlan1;;
"2") sudo hcxdumptool --do_rcascan -i wlan1 |tee ./targets/targets;;
"3") sudo sort ./targets/targets | uniq -d | tee ./targets/target.txt;;
"4") echo "Cancel";;
esac
