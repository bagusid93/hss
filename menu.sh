#!/bin/bash
#Script By Julak Bantur
#Hss-Punya
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/julak/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########

BURIQ () {
    curl -sS https://raw.githubusercontent.com/bagusid93/hss/main/sc3 > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/bagusid93/hss/main/sc3 | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/bagusid93/hss/main/sc3 | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://raw.githubusercontent.com/bagusid93/hss/main/sc3 | grep $MYIP | awk '{print $3}')
fi
clear
# =========================================
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
# TOTAL ACC CREATE  VLESS WS
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
# TOTAL ACC CREATE  TROJAN
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
# TOTAL ACC CREATE OVPN SSH
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"

# // Exporting Language to UTF-8
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'
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

# // Exporting Language to UTF-8

export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'


# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# TOTAL RAM
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))

persenmemori="$(echo "scale=2; $usmem*100/$tomem" | bc)"
#persencpu=
persencpu="$(echo "scale=2; $cpu1+$cpu2" | bc)"

# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"

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
today=$(date -d "0 days" +"%Y-%m-%d")
Exp1=$(curl https://raw.githubusercontent.com/bagusid93/hss/main/sc3 | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
    sts="${Info}"
else
    sts="${Error}"
fi
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

today=`date -d "0 days" +"%Y-%m-%d"`

# CERTIFICATE STATUS
d1=$(date -d "$exp" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))
export sem=$( curl -s https://raw.githubusercontent.com/bagusid93/sc3/main/versi)
IPVPS=$(curl -s ipinfo.io/ip )

# IBAM
ISP=$(curl -s ipinfo.io/org)
CITY=$(curl -s ipinfo.io/city)
WKT=$(curl -s ipinfo.io/timezone)

data_ip="https://raw.githubusercontent.com/bagusid93/hss/main/sc3"
d2=$(date -d "$date_list" +"+%s")
d1=$(date -d "$Exp" +"+%s")
dayleft=$(( ($d1 - $d2) / 86400 ))

clear
echo -e " "
figlet  Julak Bantur
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "🔰${CYAN} Server Uptime       👉 ${COLOR1}$( uptime -p  | cut -d " " -f 2-10000 ) ${NC}"
echo -e "🔰${CYAN} Current Time        👉 ${COLOR1}$( date -d "0 days" +"%d-%m-%Y | %X" )${NC}"
echo -e "🔰${CYAN} Operating System    👉 ${COLOR1}$( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' ) ( $( uname -m) )${NC}"
echo -e "🔰${CYAN} Isp                 👉 ${COLOR1}$ISP ${NC}"
echo -e "🔰${CYAN} City                👉 ${COLOR1}$CITY ${NC}"
echo -e "🔰${CYAN} Ip Vps              👉 ${COLOR1}$IPVPS ${NC}"
echo -e "🔰${CYAN} Current Domain      👉 ${COLOR1}$( cat /etc/xray/domain )${NC}"
echo -e "🔰${CYAN} Jumlah Ram          👉 ${COLOR1}${totalram} MB"
echo -e "🔰${CYAN} CPU Usage           👉 ${COLOR1}$cpu_usage"
echo -e "🔰${CYAN} Whatsapp            👉 ${COLOR1}081250851741${NC}"
echo -e "🔰${CYAN} AutoScript By       👉 ${COLOR1}PAPADA'AN STORE${NC}"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "     ${BICyan} SSH ${NC}: $ressh"" ${BICyan} NGINX ${NC}: $resngx"" ${BICyan}  XRAY ${NC}: $resv2r"" ${BICyan} SSH-UDP ${NC}: $resudc"
echo -e "   ${BICyan}     HAPROXY ${NC}: $resst" "${BICyan} DROPBEAR ${NC}: $resdbr" "${BICyan} SSH-WS ${NC}: $ressshws"
echo -e " $COLOR1┌─────────────────────────────────────────────────────┐${NC}" 
echo -e "       ${BICyan}SSH${NC} : ${green}$ssh1${NC} |"   "${BICyan}VMESS${NC} : ${green}$vmc${NC} |"   "${BICyan}VLESS${NC} : ${green}$vlx${NC} |"   "${BICyan}TROJAN${NC} : ${green}$trx${NC}"
echo -e " $COLOR1└─────────────────────────────────────────────────────┘${NC}"
echo -e " $COLBG1                      🔥Main Menu🔥                    $NC"
echo -e "$COLOR1 ┌─────────────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1│$NC    ${BICyan}[${WH}01${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 SSH     ${NC}" "     ${BICyan}[${WH}06${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 RUNNING     ${NC}" "${COLOR1}│${NC}"
echo -e " $COLOR1│$NC    ${BICyan}[${WH}02${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 VMESS   ${NC}" "     ${BICyan}[${WH}07${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 THEME       ${NC}" "${COLOR1}│${NC}"
echo -e " $COLOR1│$NC    ${BICyan}[${WH}03${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 VLESS   ${NC}" "     ${BICyan}[${WH}08${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 BACKUP      ${NC}" "${COLOR1}│${NC}"
echo -e " $COLOR1│$NC    ${BICyan}[${WH}04${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 TROJAN  ${NC}" "     ${BICyan}[${WH}09${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 UPDATE      ${NC}" "${COLOR1}│${NC}"
echo -e " $COLOR1│$NC    ${BICyan}[${WH}05${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 SETTING ${NC}" "     ${BICyan}[${WH}10${BICyan}]${BICyan}[${BIYellow}Menu${BICyan}]$COLOR1 BOT         ${NC}" "${COLOR1}│${NC}"
echo -e " $COLOR1└─────────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1 ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${COLOR1} ${NC}  ${BICyan}HARI ini${NC}: ${green}$ttoday$NC ${BICyan}KEMARIN${NC}: ${green}$tyest$NC ${BICyan}BULAN${NC}: ${green}$tmon$NC $NC"
echo -e "$COLOR1 └─────────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌─────────────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1│$NC  ${WH}Version      ${NC} :${BICyan} JB-04 LITE ${NC}"
echo -e " $COLOR1│$NC  ${WH}User         ${NC} :${BIYellow} ${Name} ${NC}"
echo -e " $COLOR1│$NC  ${WH}Expired      ${NC} :${Blue} ${Exp1}${NC} [${red}$dayleft${NC} ${COLOR1}Days${NC}] ${NC}"
echo -e " $COLOR1└─────────────────────────────────────────────────────┘${NC}"
echo ""
echo -e   " [$COLOR1 Tekan x Untuk Exit Script ${NC}]"
echo ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; menu-ssh ;;
2) clear ; menu-vmess ;;
3) clear ; menu-vless ;;
4) clear ; menu-trojan ;;
5) clear ; menu-set ;;
6) clear ; running ;;
7) clear ; menu-theme ;;
8) clear ; menu-backup ;;
9) clear ; rm -rf update.sh && wget -q https://raw.githubusercontent.com/bagusid93/hss/main/update.sh && chmod +x update.sh && ./update.sh ;;
10) clear ; bot ;;
0) clear ; menu ;;
x) exit ;;
*) echo "salah tekan sayang" ; sleep 1 ; menu ;;
esac
