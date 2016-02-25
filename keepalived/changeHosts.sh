#!/usr/bin/env bash
#下面的配置对应keepalived.conf，请对照着修改
echo "192.168.1.131 myip" >> /etc/hosts
echo "192.168.1.129 another" >> /etc/hosts
echo "192.168.1.131 serverip1" >> /etc/hosts
echo "192.168.1.129 serverip2" >> /etc/hosts