#!bin/bash

echo
echo "--- check if target.txt is added to ./targets/  and choose vendor ---"
echo 

echo "
[+] 1 = TP_link
[+] 2 = HUAWEI
[+] 3 = FunBox"

read n
case "$n" in
"1") vendor=./vendor/TP_link;;
"2") vendor=./vendor/Huw;;
"3") vendor=./vendor/FunBox;;
esac


file=$vendor
in_file=./targets/target.txt

if [ $n -eq 1 ]
then
	cat $file | while read line;do grep -i $line $in_file | tee -a ./targets/target_TP.txt;done
elif [ $n -eq 2 ]
then
	cat $file | while read line;do grep -i $line $in_file | tee -a ./targets/target_Huw.txt;done
elif [ $n -eq 3 ]
then
	cat $file | while read line;do grep -i $line $in_file | tee -a ./targets/target_FunB.txt;done
fi

