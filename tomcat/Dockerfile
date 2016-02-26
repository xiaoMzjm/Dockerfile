#step1
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
    apt-get install -y wget

#step2
RUN mkdir -p /usr/local/jre8 && \
        wget 'https://allall01.baidupcs.com/file/eebf0876561b0291e7573cc34e640237?bkt=p3-1400eebf0876561b0291e7573cc34e640237e939274c00000390c29e&fid=2885809650-250528-56145497134710&time=1456475768&sign=FDTAXGERLBH-DCb740ccc5511e5e8fedcff06b081203-0yGzgjrweKJZZ03DD4EwMhxJOcg%3D&to=wb&fm=Nan,B,G,tt&sta_dx=57&sta_cs=0&sta_ft=gz&sta_ct=2&fm2=Nanjing02,B,G,tt&newver=1&newfm=1&secfm=1&flow_ver=3&pkey=1400eebf0876561b0291e7573cc34e640237e939274c00000390c29e&sl=75694158&expires=8h&rt=pr&r=224937899&mlogid=1314842172772907556&vuk=2885809650&vbdid=199829187&fin=server-jre-8u73-linux-x64.gz&fn=server-jre-8u73-linux-x64.gz&slt=pm&uta=0&rtype=1&iv=0&isw=0&dp-logid=1314842172772907556&dp-callid=0.1.1' -O /usr/local/jre8/server-jre-8u73-linux-x64.gz && \
        cd /usr/local/jre8 && \
        tar -zxvf server-jre-8u73-linux-x64.gz && \
        rm server-jre-8u73-linux-x64.gz

#step3
ENV JAVA_HOME /usr/local/jre8/jdk1.8.0_73
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH $JAVA_HOME/lib:$JAVA_HOME/jre/lib:$CLASSPATH
ENV PATH $JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH

#step4
RUN mkdir -p /usr/local/tomcat && \
        wget 'http://mirrors.cnnic.cn/apache/tomcat/tomcat-8/v8.0.32/bin/apache-tomcat-8.0.32.tar.gz' -O /usr/local/tomcat/apache-tomcat-8.0.32.tar.gz && \
        cd /usr/local/tomcat && \
        tar -zxvf apache-tomcat-8.0.32.tar.gz && \
        rm apache-tomcat-8.0.32.tar.gz && \
        cp /usr/local/tomcat/apache-tomcat-8.0.32/bin/catalina.sh /etc/init.d && \
        mv /etc/init.d/catalina.sh /etc/init.d/tomcat && \
        sed -i '/#!\/bin\/sh/a\CATALINA_HOME=\/usr\/local\/tomcat\/apache-tomcat-8.0.32' /etc/init.d/tomcat && \
        sed -i '/#!\/bin\/sh/a\JAVA_HOME=\/usr\/local\/jre8\/jdk1.8.0_73' /etc/init.d/tomcat

#step5
ENV CATALINA_HOME /usr/local/tomcat/apache-tomcat-8.0.32
EXPOSE 8080