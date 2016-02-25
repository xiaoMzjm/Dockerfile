#!/usr/bin/env bash
#请修改成用来发送邮件的邮箱
FROMEMAIL="xxxxxxxx@qq.com"

#请修改成上面邮箱的密码
EMAILPASSWORD="xxxxxxxxxxxxxxxx"

echo "set sendmail="/usr/bin/msmtp"" >> /etc/Muttrc && \
    echo "set use_from=yes" >> /etc/Muttrc && \
    echo "set realname="myname"" >> /etc/Muttrc && \
    echo "set from=$FROMEMAIL" >> /etc/Muttrc && \
    echo "set envelope_from=yes" >> /etc/Muttrc && \
    touch ~/.msmtprc && \
    touch ~/.msmtprc && \
    echo "account default" >> ~/.msmtprc && \
    echo "host smtp.qq.com" >> ~/.msmtprc && \
    echo "from $FROMEMAIL" >> ~/.msmtprc && \
    echo "auth plain" >> ~/.msmtprc && \
    echo "user $FROMEMAIL" >> ~/.msmtprc && \
    echo "password $EMAILPASSWORD" >> ~/.msmtprc && \
    echo "logfile ~/.msmtp.log" >> ~/.msmtprc