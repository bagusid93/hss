#!/bin/bash
# //====================================================
# //	System Request:Debian 9+/Ubuntu 18.04+/20+
# //	Author:	Julak Bantur
# //	Dscription: Xray MultiPort
# //	email: putrameratus2@gmail.com
# //  telegram: https://t.me/Cibut2d
# //====================================================
# // font color configuration | JULAK BANTUR AUTOSCRIPT
###########- COLOR CODE -##############
colornow=$(cat /etc/julak/theme/color.conf)
VC="\e[0m"
Green="\e[92;1m"
BICyan='\033[1;96m'
BIYellow='\033[1;93m'
COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
y='\033[1;33m' #yellow
l='\033[0;37m'
BGX="\033[42m"
CYAN="\033[96m"
z="\033[96m"
zx="\033[97;1m" # // putih
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[1;32m'
grenbo="\e[92;1m"
purple="\033[1;95m"
YELL='\033[0;33m'
cyan="\033[1;36m"
c="\033[5;33m"
###########- END COLOR CODE -##########
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
