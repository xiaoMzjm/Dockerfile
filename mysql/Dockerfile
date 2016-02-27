#step1 更新软件源 & 安装依赖
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
    echo "deb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >> $sourcesPath

RUN apt-get update && \   
    apt-get install -y libaio1 libaio-dev && \
    apt-get install -y libmecab2 && \
    apt-get install -y wget && \
    apt-get install -y apparmor && \
    apt-get install -y psmisc

#step2 下载mysql
RUN mkdir -p /usr/local/src/mysql && \
    cd /usr/local/src/mysql && \
    wget -O /usr/local/src/mysql/mysql-server_5.7.11-1ubuntu14.04_amd64.deb-bundle.tar 'http://120.52.72.41/cdn.mysql.com/c3pr90ntcsf0//Downloads/MySQL-5.7/mysql-server_5.7.11-1ubuntu14.04_amd64.deb-bundle.tar'

#step3 安装mysql
RUN  cd /usr/local/src/mysql && \
    tar -xvf mysql-server_5.7.11-1ubuntu14.04_amd64.deb-bundle.tar && \
    dpkg -i mysql-common_5.7.11-1ubuntu14.04_amd64.deb && \
    dpkg -i libmysqlclient20_5.7.11-1ubuntu14.04_amd64.deb && \
    dpkg -i libmysqlclient-dev_5.7.11-1ubuntu14.04_amd64.deb && \    
    dpkg -i libmysqld-dev_5.7.11-1ubuntu14.04_amd64.deb && \
    dpkg -i mysql-community-client_5.7.11-1ubuntu14.04_amd64.deb && \
    dpkg -i mysql-client_5.7.11-1ubuntu14.04_amd64.deb && \
    dpkg -i mysql-community-source_5.7.11-1ubuntu14.04_amd64.deb && \ 
    dpkg -i mysql-community-server_5.7.11-1ubuntu14.04_amd64.deb && \
    rm -rf /usr/local/src/mysql && \
    ln -s /etc/apparmor.d/usr.sbin.mysqld /etc/apparmor.d/disable/

#step4 设置账户
RUN mpath="/etc/mysql/my.cnf" && \
    sed -i 's/bind-address/# bind-address/g' $mpath && \
    sed -i '/\[mysqld\]/a\server-id=1' $mpath && \
    service mysql start && \
    mysql -uroot -p -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('123456');" && \
    mysql -uroot -p123456 -e "grant all privileges on *.* to 'test'@'%' identified by '123456';" && \
    mysql -uroot -p123456 -e "flush privileges;"

#step5 lvs设置脚本的复制
COPY lvsdr.sh /etc/init.d/
RUN  chmod +x /etc/init.d/lvsdr.sh

#step6 开放端口
EXPOSE 3306