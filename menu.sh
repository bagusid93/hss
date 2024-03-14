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

# // Gettings Info
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
#########################
# // USERNAME IZIN
rm -f /usr/bin/user
username=$(curl -sS https://raw.githubusercontent.com/bagusid93/hss/main/sc3 | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user

# // VALIDITY
rm -f /usr/bin/e
valid=$(curl -sS https://raw.githubusercontent.com/bagusid93/hss/main/sc3 | grep $MYIP | awk '{print $3}')
echo "$valid" > /usr/bin/e

# // DETAIL ORDER IZIN IP
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)

clear
# // DAYS LEFT
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))

# // VPS INFORMATION
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

# Status ExpiRED Active | Geo Project

# // AKTIVATED & EXPIRED
Info="${green}Activated${NC}"
Error="${RED}Expired ${NC}"
#//
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl -sS https://reg.scvps.biz.id/ip | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
clear

# // GETTINGS SYSTEM
uptime="$(uptime -p | cut -d " " -f 2-10)"
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${coREDiilik:-1}))"
cpu_usage+=" %"
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
# // Clear
clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}ON${NC}"
else
ressh="${red}OFF${NC}"
fi
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [ "$haproxy_service" = "running" ]; then
resst="${green}ON${NC}"
else
resst="${red}OFF${NC}"
fi
sshws=$( systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [ "$sshws" = "running" ]; then
ressshws="${green}ON${NC}"
else
ressshws="${red}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ON${NC}"
else
resngx="${red}OFF${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${green}ON${NC}"
else
resdbr="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ON${NC}"
else
resv2r="${red}OFF${NC}"
fi
udc=$(service udp-custom status | grep active | cut -d ' ' $stat)
if [ "$udc" = "active" ]; then
resudc="${green}ON${NC}"
else
resudc="${red}OFF${NC}"
fi
# // UPDATE / REVISI all menu
julak="https://raw.githubusercontent.com/bagusid93/hss/main"

# // INFO CREATE ACCOUNT
# \\ Vless account //
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx
# \\ Vmess account //
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc
# \\ Trojan account //
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let trb=$trx
########### // JULAK // BANTUR
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
clear
# // JULAK--BANTUR
echo -e " "
figlet  Julak Bantur
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "🔰${CYAN} Server Uptime       👉 ${COLOR1}$( uptime -p  | cut -d " " -f 2-10000 ) ${NC}"
echo -e "🔰${CYAN} Operating System    👉 ${COLOR1}$( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' ) ( $( uname -m) )${NC}"
echo -e "🔰${CYAN} Isp                 👉 ${COLOR1}$( cat /etc/xray/isp ) ${NC}"
echo -e "🔰${CYAN} City                👉 ${COLOR1}$( cat /etc/xray/city ) ${NC}"
echo -e "🔰${CYAN} Ip Vps              👉 ${COLOR1}$IPVPS ${NC}"
echo -e "🔰${CYAN} Current Domain      👉 ${COLOR1}$( cat /etc/xray/domain )${NC}"
echo -e "🔰${CYAN} Jumlah Ram          👉 ${COLOR1}$RAM MB $(NC}"
echo -e "🔰${CYAN} CPU Usage           👉 ${COLOR1}$CORE ${NC}"
echo -e "🔰${CYAN} Whatsapp            👉 ${COLOR1}081250851741${NC}"
echo -e "🔰${CYAN} AutoScript By       👉 ${COLOR1}PAPADA'AN STORE${NC}"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "     ${BICyan} SSH ${NC}: $ressh"" ${BICyan} NGINX ${NC}: $resngx"" ${BICyan}  XRAY ${NC}: $resv2r"" ${BICyan} SSH-UDP ${NC}: $resudc"
echo -e "   ${BICyan}     HAPROXY ${NC}: $resst" "${BICyan} DROPBEAR ${NC}: $resdbr" "${BICyan} SSH-WS ${NC}: $ressshws"
echo -e " $COLOR1┌─────────────────────────────────────────────────────┐${NC}" 
echo -e "  ${BICyan}SSH${NC} : ${green}$ssh1${NC} |"   "${BICyan}VMESS${NC} : ${green}$vmc${NC} |"   "${BICyan}VLESS${NC} : ${green}$vlx${NC} |"   "${BICyan}TROJAN${NC} : ${green}$trx${NC} "
echo -e " $COLOR1└─────────────────────────────────────────────────────┘${NC}"
echo -e " $COLBG1                      🔥Main Menu🔥                    $NC"
echo -e "$COLOR1 ┌─────────────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1│$NC    ${BICyan}[${WH}01${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 SSH     ${NC}" "     ${BICyan}[${WH}06${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 RUNNING     ${NC}" "${COLOR1}│${NC}"
echo -e " $COLOR1│$NC    ${BICyan}[${WH}02${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 VMESS   ${NC}" "     ${BICyan}[${WH}07${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 THEME       ${NC}" "${COLOR1}│${NC}"
echo -e " $COLOR1│$NC    ${BICyan}[${WH}03${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 VLESS   ${NC}" "     ${BICyan}[${WH}08${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 BACKUP      ${NC}" "${COLOR1}│${NC}"
echo -e " $COLOR1│$NC    ${BICyan}[${WH}04${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 TROJAN  ${NC}" "     ${BICyan}[${WH}09${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 UPDATE      ${NC}" "${COLOR1}│${NC}"
echo -e " $COLOR1│$NC    ${BICyan}[${WH}05${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 SETTING ${NC}" "     ${BICyan}[${WH}10${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 REBOOT      ${NC}" "${COLOR1}│${NC}"
echo -e " $COLOR1└─────────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1 ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${COLOR1} ${NC}  ${BICyan}HARI ini${NC}: ${green}$ttoday$NC ${BICyan}KEMARIN${NC}: ${green}$tyest$NC ${BICyan}BULAN${NC}: ${green}$tmon$NC $NC"
echo -e "$COLOR1 └─────────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌─────────────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1│$NC  ${COLOR1}Version      ${NC} :${WH} JB-04 LITE ${NC}"
echo -e " $COLOR1│$NC  ${COLOR1}User         ${NC} :${BIYellow} $username ${NC}"
echo -e " $COLOR1│$NC  ${COLOR1}Expired      ${NC} :${WH} $exp${NC} [${WH}$certifacate${NC} ${COLOR1}Days${NC}] ${NC}"
echo -e " $COLOR1└─────────────────────────────────────────────────────┘${NC}"
echo ""
echo -e   " [$COLOR1 Tekan x Untuk Exit Script ${NC}]"
echo ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1)
clear
menu-ssh
;;
2)
clear
menu-vmess
;;
3)
clear
menu-vless
;;
4)
clear
menu-trojan
;;
5)
clear
menu-set
;;
6)
clear
running
;;
7)
clear
menu-theme
;;
8)
clear
menu-backup
;;
9)
clear
rm -rf update.sh && wget -q https://raw.githubusercontent.com/bagusid93/hss/main/update.sh && chmod +x update.sh && ./update.sh
;;
10)
clear
autoreboot
;;
00)
clear
menu
;;
x)
clear
exit
;;
*)
clear
menu
;;
esac 
