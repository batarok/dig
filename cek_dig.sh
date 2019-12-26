#!/bin/bash

if [ -z "$1" ];then
  echo "Cara penggunaan:"
  echo "$0 namadomain.com"
  exit
fi
LG='\033[0;32m' #color light green
NC='\033[0m' #no color
BLD='\e[1m' #font bold
CLS='\033c' #clear screen
col=$(tput cols) #column screen
ls="="

IP=$(dig +short $1)
ips=$BLD$IP$NC
PTR=$(dig +short -x $IP)
pt=$BLD$PTR$NC
NS=( $(dig ns +short $1) )
ttl="HASIL DIG "$1

printf "$CLS"
printf '%*s\n' $(((${#ls}+$col)/3))| tr ' ' $ls
printf "%*s\n" $(((${#ttl}+$col)/5)) "$ttl"
printf '%*s\n' $(((${#ls}+$col)/3))| tr ' ' $ls
echo " "
#IP DOMAIN
printf "%7s${LG}${BLD}IP\t%5s:${NC}"
for c in ${ips[@]};
do
printf "%1s"$BLD$c$NC"\n %21s"; done
printf "\n"
#NAMA SERVER
printf "%7s${LG}${BLD}SERVER%8s:${NC} $pt"
printf "\n\n"
#NAMESERVER DOMAIN
printf "%7s${LG}${BLD}NS DOMAIN%5s:${NC}"
for n in ${NS[@]};
do
printf "%1s"$BLD$n$NC"\n %21s"; done
printf "\n"
printf '%*s' $(((${#ls}+$col)/3))| tr ' ' $ls
printf "\n"