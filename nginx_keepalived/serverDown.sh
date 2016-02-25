#!/usr/bin/env bash
pkill keepalived
/etc/init.d/networking restart
myip=`LC_ALL=C ifconfig|grep "inet addr:"|grep -v "127.0.0.1"|cut -d: -f2|awk '{print $1}'`
echo "$myip  $1" | mutt -s "keepalived notify" heijueerror@163.com