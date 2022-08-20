
#!bin/bash
echo
echo "-------------------- WhatsUp Messenger ------------------------"
echo "
[+] 1 = write a message to a friend
[+] 2 = read the message from a friend
[+] 3 = cancel"
echo
echo "------------------------"
echo "pick a number from above"

read n
case "$n" in
"1") sudo python3 encryptor.py;;
"2") sudo python3 decryptor.py;;
"3") echo "Cancel";;
esac
