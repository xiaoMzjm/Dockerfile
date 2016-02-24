#!/usr/bin/env bash
pkill keepalived
/etc/init.d/networking restart
echo "$1" | mutt -s "keepalived notify" heijueerror@163.com