#!/bin/sh

if [ ! -f /opt/bin/ipkg ]; then

mkdir /opt/tmp
mkdir /opt/tmp/ipkg
cd /opt/tmp

wget http://ipkg.nslu2-linux.org/feeds/optware/oleg/cross/stable/uclibc-opt_0.9.28-13_mipsel.ipk
/usr/local/bin/ipkg-cl install uclibc-opt_0.9.28-13_mipsel.ipk
wget http://ipkg.nslu2-linux.org/feeds/optware/oleg/cross/stable/ipkg-opt_0.99.163-10_mipsel.ipk
/usr/local/bin/ipkg-cl install ipkg-opt_0.99.163-10_mipsel.ipk
/opt/bin/ipkg update

grep -q "/opt/bin" /usr/local/etc/profile
if ! [ $? -eq 0 ]; then
echo "if [ -L /opt ]; then" >> /usr/local/etc/profile
echo "export PATH=\$PATH:/opt/bin:/opt/sbin:/opt/usr/sbin" >> /usr/local/etc/profile
echo "fi" >> /usr/local/etc/profile
fi
echo "IPKG installed..."
else
echo "IPKG is already installed, nothing to do!"
fi
exit 0
