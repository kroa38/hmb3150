#!/bin/sh
#set -x
update=y
if [ $# -eq 1 ]; then
  if [ x"$1" == x"profile" ]; then
    update=n
  fi
fi

if [ -f /usr/local/etc/TZ ]; then
. /usr/local/etc/TZ
NTPZONE=$(echo $NTPDATA | cut -d '-' -f 5-)
export TZ=`echo $NTPZONE`
if [ x"$update" = x"y" ]; then
LD_PRELOAD=/opt/lib/libgcc_s.so.1 /usr/sbin/ntpdate $NTPSERVER 
if [ $? -eq 0 ];then
touch /opt/log/ntpsync
date=$(date "+%a-%b-%d-%H-%M-%Y")
hwclock=$(hwclock | sed -e 's|\([a-zA-Z]\{3\}\) \([a-zA-Z]\{3\}\)  \([0-9]\) \(.*\)|\1 \2 0\3 \4|' -e 's|\([a-zA-Z]\{3\}\) \([a-zA-Z]\{3\}\) \([0-9]\{2\}\) \([0-9]\{2\}\):\([0-9]\{2\}\):[0-9]\{2\} \([0-9]\{4\}\).*|\1-\2-\3-\4-\5-\6|')
if [ $date != $hwclock ];then
 touch /opt/log/hwclockset     # comment kroa
hwclock -w
fi
fi
fi
fi
