#!/bin/bash
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
# Getting
export CHATID="2118266757"
export KEY="6718133374:AAHPRa6ftNJshlkLctQuBMM0L82JibFrnWw"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Valid Script
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://reg.scvps.biz.id/ip"
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          JULAK BANTUR AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/Cibut2d"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6281250851741"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
echo -e "\e[32mloading...\e[0m"
clear
#Domain
domain=$(cat /etc/xray/domain)

echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC${COLOR1}                     Premium Autoscript                   $NC${z}│$NC"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC [${zx}01${NC}] ${COLOR1}ADD SSH$NC" 
echo -e " ${z}│$NC [${zx}02${NC}] ${COLOR1}RENEW SSH$NC" 
echo -e " ${z}│$NC [${zx}03${NC}] ${COLOR1}DELETE SSH$NC" 
echo -e " ${z}│$NC [${zx}04${NC}] ${COLOR1}CHECK USER LOGIN$NC" 
echo -e " ${z}│$NC [${zx}05${NC}] ${COLOR1}MEMBER SSH$NC" 
echo -e " ${z}│$NC [${zx}06${NC}] ${COLOR1}TRIAL SSH$NC" 
echo -e " ${z}│$NC [${zx}07${NC}] ${COLOR1}CHANGE LIMIT IP$NC" 
echo -e " ${z}│$NC [${zx}08${NC}] ${COLOR1}CHECK ACCOUNT$NC" 
echo -e " ${z}│$NC [${zx}09${NC}] ${COLOR1}AUTO KILLS$NC" 
echo -e " ${z}│$NC [${zx}00${NC}] ${COLOR1}BACK TO MENU$NC" 
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
read -p "Select From Options [ 0 - 9 ] : " menu
echo -e ""
case $menu in
1)
    addssh
    ;;
2)
    renewssh
    ;;
3)
    delssh
    ;;
4)
    cekssh
    ;;
5)
    member
    ;;
6)
    trial
    ;;
7)
    limsh
    ;;
8)
    user-ssh
    ;;
9)
    autokill
    ;;
0)
    menu
    ;;
*)
    m-sshws
    ;;
esac
