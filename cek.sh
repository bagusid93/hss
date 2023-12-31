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

clear
if [ -e "/var/log/auth.log" ]; then
    LOG="/var/log/auth.log"
fi
if [ -e "/var/log/secure" ]; then
    LOG="/var/log/secure"
fi
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$COLBG1           OpenSSH User Login            \E[0m"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo "ID  |  Username  |  IP Address"

cat $LOG | grep -i sshd | grep -i "Accepted password for" >/tmp/login-db.txt
data=($(ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'))

for PID in "${data[@]}"; do
    cat /tmp/login-db.txt | grep "sshd\[$PID\]" >/tmp/login-db-pid.txt
    NUM=$(cat /tmp/login-db-pid.txt | wc -l)
    USER=$(cat /tmp/login-db-pid.txt | awk '{print $9}')
    IP=$(cat /tmp/login-db-pid.txt | awk '{print $11}')
    if [ $NUM -eq 1 ]; then
        echo "$PID - $USER - $IP"
    fi
done
echo " "
data=($(ps aux | grep -i dropbear | awk '{print $2}'))
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$COLBG1          Dropbear User Login            \E[0m"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo "ID  |  Username  |  IP Address"

cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" >/tmp/login-db.txt
for PID in "${data[@]}"; do
    cat /tmp/login-db.txt | grep "dropbear\[$PID\]" >/tmp/login-db-pid.txt
    NUM=$(cat /tmp/login-db-pid.txt | wc -l)
    USER=$(cat /tmp/login-db-pid.txt | awk '{print $10}')
    IP=$(cat /tmp/login-db-pid.txt | awk '{print $12}')
    if [ $NUM -eq 1 ]; then
        echo "$PID - $USER - $IP"
    fi
done
echo " "

if [ -f "/etc/openvpn/server/openvpn-tcp.log" ]; then
    echo ""
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
    echo -e "$COLBG1         OpenVPN TCP User Login          \E[0m"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
    echo "Username  |  IP Address  |  Connected"
    
    cat /etc/openvpn/server/openvpn-tcp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' >/tmp/vpn-login-tcp.txt
    cat /tmp/vpn-login-tcp.txt
fi


if [ -f "/etc/openvpn/server/openvpn-udp.log" ]; then
    echo " "
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
    echo -e "$COLBG1         OpenVPN UDP User Login          \E[0m"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
    echo "Username  |  IP Address  |  Connected"
    
    cat /etc/openvpn/server/openvpn-udp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' >/tmp/vpn-login-udp.txt
    cat /tmp/vpn-login-udp.txt
fi
echo ""
echo ""
