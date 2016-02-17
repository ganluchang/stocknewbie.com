#!/bin/bash
#wr by lch.gan@gmail.com
set -e
set -u
set -x
tomcat_error_log_dir="/data/tomcat-search/logs"
tail -f -n 100 ${tomcat_error_log_dir}/catalina.out > /opt/opsys/shell/tm_error.log &
tail_pid=`ps -eaf | grep tail | grep -v grep | awk '{print $2}'`
kill -9 ${tail_pid}
if 
grep "OutOfMemoryError" /opt/opsys/shell/tm_error.log
then 
echo `date`  "tomcat  OutOfMemoryError,restart tomcat"  >> /opt/opsys/shell/restart.log
sh /opt/opsys/shell/restar_search_tm.sh
fi
