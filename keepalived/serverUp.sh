#!/usr/bin/env bash
myip=`LC_ALL=C ifconfig|grep "inet addr:"|grep -v "127.0.0.1"|cut -d: -f2|awk '{print $1}'`
NOTIFYEMAIL="xxxxxxx@163.com"

echo "$myip $1" | mutt -s "keepalived notify"  $NOTIFYEMAIL