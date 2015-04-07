#!/bin/sh
SSHPORT=22

if [ ! -f /opt/sbin/dropbear ];then
ln -s /opt/sbin/dropbearmulti /opt/sbin/dropbear
fi;
if [ ! -f /opt/sbin/dbclient ];then
ln -s /opt/sbin/dropbearmulti /opt/sbin/dbclient
fi;
if [ ! -f /opt/sbin/scp ];then
ln -s /opt/sbin/dropbearmulti /opt/sbin/scp
fi;
if [ ! -f /opt/sbin/dropbearkey ];then
ln -s /opt/sbin/dropbearmulti /opt/sbin/dropbearkey
fi;
if [ ! -f /opt/sbin/dropbearconvert ];then
ln -s /opt/sbin/dropbearmulti /opt/sbin/dropbearconvert
fi;
if [ ! -f /opt/sbin/dropbear_rsa_host_key ];then
/opt/sbin/dropbearkey -t rsa -f /opt/sbin/dropbear_rsa_host_key
fi;
if [ ! -f /opt/sbin/dropbear_dss_host_key ];then
/opt/sbin/dropbearkey -t dss -f /opt/sbin/dropbear_dss_host_key
fi;
/opt/sbin/dropbear -d /opt/sbin/dropbear_dss_host_key  -r /opt/sbin/dropbear_rsa_host_key -p $SSHPORT &

exit 0;
