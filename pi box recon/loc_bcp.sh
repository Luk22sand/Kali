#!bin/bash
#location bcp

echo "
[+] 1 = delete recon
[+] 2 = save recon files to location folder
[+] 3 = Cancel"

read p
case "$p" in
"1") echo "deleting gathered recon";sudo rm ./dump/* && sudo rm ./targets/*; echo "recon removed";;
"2") echo "provide location name to save the results: ";read l;echo "files saved as: loc_"$l;sudo mkdir -p ./map/loc_$l;sudo mv ./dump/dumpfile* ./map/loc_$l && sudo mv ./targets/target* ./map/loc_$l;;
"3") echo "Cancel";;
esac

