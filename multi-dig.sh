#!/bin/bash
if [ -z "$1" ];then
  echo "Cara penggunaan:"
  echo "$0 file_berisi_list_domain.txt"
  exit
fi

DOMAINS=($(cat $1))
printf "\n"
printf "                                 HASIL PROSES DIG\n"
printf "=============================================================================\n"
for d in ${DOMAINS[@]}
do
  NS=$(dig ns +short $d)
  IP=$(dig +short $d)
  if [ -z "${IP}" ];then
    continue
  else
    PTR=$(dig +short -x ${IP})
    printf "%-10s %s\n" "Domain :"  "$d"
    printf "%-10s %s\n" "IP :"  "${IP}"
    printf "%-10s %s\n" "PTR :"  "${PTR}"
    printf "%-10s %s\n" "NAME SERVER DOMAIN"
    printf "%-10s %s\n" "${NS}"
    echo "-------------------------------------"
echo " "
echo " "
echo " "
  fi
done
