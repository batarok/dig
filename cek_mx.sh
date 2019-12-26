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

PT=$(dig mx $1|awk 'p{print $5}/^;; ANSWER SECTION:$/{p=1}/^$/{p=0}')
pr=$BLD$PT$NC
ND=$(dig mx $1|awk 'p{print $6}/^;; ANSWER SECTION:$/{p=1}/^$/{p=0}')
nm=$BLD$ND$NC
IP=$(dig +short ${ND})
ips=$BLD$IP$NC
PTR=$(dig +short -x ${IP})
ptr=$BLD$PTR$NC
NS=( $(dig ns +short $1) )
ttl="HASIL DIG MX "$1

printf "$CLS"
printf '%*s\n' $(((${#ls}+$col)/3))| tr ' ' $ls
printf "%*s\n" $(((${#ttl}+$col)/5)) "$ttl"
printf '%*s\n' $(((${#ls}+$col)/3))| tr ' ' $ls
echo " "
#Priority MX
printf "%7s${LG}${BLD}PRIORITY MX %2s:${NC}"
for a in ${pr[@]};
do
printf "%1s"$BLD$a$NC"\n %21s"; done
printf "\n"
#MX domain
printf "%7s${LG}${BLD}DOMAIN MX %4s:${NC}"
for b in ${nm[@]};
do
printf "%1s"$BLD$b$NC"\n %21s"; done
printf "\n"
#IP DOMAIN
printf "%7s${LG}${BLD}IP\t%5s:${NC}"
for c in ${ips[@]};
do
printf "%1s"$BLD$c$NC"\n%22s"; done
printf "\n"
#NAMA SERVER
printf "%7s${LG}${BLD}SERVER%8s:${NC} $ptr"
printf "\n\n"
#NAMESERVER DOMAIN
printf "%7s${LG}${BLD}NS DOMAIN%5s:${NC}"
for e in ${NS[@]};
do
printf "%1s"$BLD$e$NC"\n %21s"; done
printf "\n"
printf '%*s' $(((${#ls}+$col)/3))| tr ' ' $ls
printf "\n"