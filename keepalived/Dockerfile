#step 1：更新软件源并安装相关软件
FROM index.alauda.cn/library/ubuntu:14.04

MAINTAINER zjm "383248689@qq.com"

RUN sourcesPath="/etc/apt/sources.list" && \
    mv $sourcesPath $sourcesPath.backup && \
    touch $sourcesPath && \
    echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" >> $sourcesPath && \
    echo "deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >> $sourcesPath && \
    echo "deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >> $sourcesPath && \
    echo "deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> $sourcesPath && \
    echo "deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >> $sourcesPath && \
    echo "deb-src http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" >> $sourcesPath && \
    echo "deb-src http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >> $sourcesPath && \
    echo "deb-src http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >> $sourcesPath && \
    echo "deb-src http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> $sourcesPath && \
    echo "deb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >> $sourcesPath && \
    apt-get update && \
    apt-get install -y wget && apt-get install -y gcc && apt-get install -y openssl && apt-get install -y libssl-dev && apt-get install -y libpopt-dev && apt-get install -y make && apt-get install -y daemon && apt-get install -y mutt msmtp

#step 2：下载并编译安装keepalived
RUN mkdir -p /usr/local/src/keepalived/ && \
    wget http://120.52.72.41/www.keepalived.org/c3pr90ntcsf0/software/keepalived-1.2.19.tar.gz -O /usr/local/src/keepalived/keepalived-1.2.19.tar.gz && \
    cd /usr/local/src/keepalived/ && \
    tar -zxvf keepalived-1.2.19.tar.gz && \
    cd keepalived-1.2.19 && \
    mkdir -p /usr/local/keepalived && \
    ./configure --prefix=/usr/local/keepalived && \
    make && \
    make install && \
    rm -rf /usr/local/src/keepalived/

#step 3：添加keepalived称为服务
RUN cp /usr/local/keepalived/sbin/keepalived /usr/sbin/ && \
    cp /usr/local/keepalived/etc/rc.d/init.d/keepalived /etc/init.d/ && \
    mkdir -p /etc/sysconfig/ && \
    cp /usr/local/keepalived/etc/sysconfig/keepalived /etc/sysconfig/ && \
    mkdir -p /etc/rc.d/init.d && \
    cp /usr/share/initramfs-tools/scripts/functions /etc/rc.d/init.d/ && \
    sed -i 's/daemon keepalived/#daemon keepalived/' /etc/init.d/keepalived && \
    sed -i '/#daemon keepalived/a\daemon keepalived start' /etc/init.d/keepalived && \
    mkdir /var/lock/subsys

#step 4：复制配置文件和脚本
RUN mkdir -p /home/keepalived_sh
COPY keepalived.conf /etc/keepalived/
COPY keepalivedStatus.sh /home/keepalived_sh/
COPY serverDown.sh /home/keepalived_sh/
COPY serverUp.sh /home/keepalived_sh/
COPY changeHosts.sh /home/keepalived_sh/
COPY changeMail.sh /home/keepalived_sh/
RUN chmod +x /home/keepalived_sh/keepalivedStatus.sh && \
        chmod +x /home/keepalived_sh/serverDown.sh && \
        chmod +x /home/keepalived_sh/serverUp.sh