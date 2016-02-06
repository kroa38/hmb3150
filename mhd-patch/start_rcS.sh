#!/bin/sh

# on tue bftpd (hardcodé) pour pouvoir utiliser uniquement vsftpd
killall bftpd
killall smbd
killall nmbd

#démmarrage de SSH Serveur (Dropbear)
if [ -f /usr/local/etc/ssh_start.sh ];then
/usr/local/etc/ssh_start.sh
fi;

#création de la directory stunnel si pas présente
if [ ! -d /usr/local/etc/stunnel ];then
mkdir /usr/local/etc/stunnel
mv /usr/local/etc/stunnel.conf /usr/local/etc/stunnel/
chown -R nobody:default /usr/local/etc/stunnel
fi;

#création des directory tmp et log si pas présente
if [ ! -d /opt/tmp ];then
mkdir /opt/tmp
fi;
if [ ! -d /opt/log ];then
mkdir /opt/log
fi;

#reconnexion l'interface reseau si pas présente et remise à l'heure
(
sleep 240;
ping www.google.fr > /opt/log/network_status
grep -q "alive" /opt/log/network_status
if ! [ $? -eq 0 ]; then
ifconfig eth0 down
sleep 15
echo "FAIL : `date`" >> /opt/log/startup.log
ifconfig eth0 up
fi;
grep -q "alive" /opt/log/network_status
if [ $? -eq 0 ]; then
/usr/local/etc/ntpupdate.sh
echo "SUCCESS : `date` :   Date and Time updated " >> /opt/log/startup.log
fi;
rm /opt/log/network_status
sleep 15
ping www.google.fr > /opt/log/network_status
grep -q "alive" /opt/log/network_status
if ! [ $? -eq 0 ]; then
rm /opt/tmp/network_status
echo "REBOOT : `date`" >> /opt/log/startup.log
reboot
fi;
rm /opt/log/network_status
) &

#syslog ou pas ?
if [ -f /opt/log/syslog.log ];then
rm /opt/log/syslog.log
fi;
#syslog -O /opt/log/syslog.log

#on efface le dernier log de stunnel
if [ -f /opt/log/stunnel.log ];then
rm /opt/log/stunnel.log
fi;
exit 0;

