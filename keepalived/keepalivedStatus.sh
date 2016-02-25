#!/usr/bin/env bash
NOTIFYEMAIL="xxxxxxxxx@163.com"

echo "$1 $2 $3" | mutt -s "keepalived notify" $NOTIFYEMAIL