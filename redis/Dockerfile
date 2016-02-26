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
    apt-get install -y wget && \
    apt-get install -y make && \
    apt-get install -y gcc && \
    apt-get install -y tcl
    
#step2 下载安装redis
RUN mkdir -p /usr/local/redis && \
    wget 'http://120.52.72.46/download.redis.io/c3pr90ntcsf0/releases/redis-3.0.7.tar.gz' -O /usr/local/redis/redis-3.0.7.tar.gz && \
    cd /usr/local/redis && \
    tar -zxvf redis-3.0.7.tar.gz && \
    rm redis-3.0.7.tar.gz && \
    cd redis-3.0.7 && \
    make && \
    make test && \
    cd src && \
    make install

#step3  开放端口
EXPOSE 6379