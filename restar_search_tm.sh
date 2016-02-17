#!/bin/bash
#wr by lch.gan@gmail.com
set -u
set -e
set -x
JAVA_HOME=/usr/local/java
CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$JAVA_HOME/bin:$PATH
export JAVA_HOME
export CLASS_PATH
tomcat_home=/data/tomcat-search
pid=$(ps -eaf | grep tomcat-search | grep -v "grep" | awk '{print $2}')
 if [ -z ${pid} ] ;then
	cd ${tomcat_home}/bin
        sh startup.sh
  else
	kill -9 ${pid}
	cd ${tomcat_home}/bin
	sh startup.sh
 fi
