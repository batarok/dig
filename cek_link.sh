#!/bin/bash
if [ -z "$1" ];then
  echo "Cara penggunaan:"
  echo "cek_link.sh file_berisi_list_url.txt"
  exit
fi

CLS='\033c' #clear screen

URL=($(cat $1))
printf "$CLS"
echo ""
echo "                                 HASIL PROSES AKSES URL"
echo "============================================================================="
for u in ${URL[@]}
do
    N=$(curl -m 10 -s -I $1 "$u"|grep HTTP/1.1|awk {'printf "\033[31m \t\t" $2 "\033[0m"'});
    printf $u
    printf "%20s %s\n" "${N}"
done
echo "============================================================================="