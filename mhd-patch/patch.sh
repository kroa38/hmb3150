#!/bin/sh
# Fichier script permettant de mettre en place
# les modification pour l'ajout de ipkg ainsi
# que les fonctions aria2c,lynx,email,vsftp,ssh.
#  
# PREREQUIS

# Les deux repertoires 'Rebuild' et 'mhdpatch' doivent être dans la meme racine

# INSTALLATION

# Copier le firmware original (C757) dans le répertoire 'Rebuild'
# Se mettre ensuite dans le répertoire 'temp'
# Lancer le script 'decomp' qui permet de decompresser le firmware
# Revenir dans le repertoire 'mhdpatch' ou se trouve le fichier 'patch.sh' celui la meme
# Lancer le script 'patch.sh'
# Revenir ensuite dans le répertoire 'Rebuild/temp'
# Lancer le script 'comp' qui va recomprimer le firmware modifié
# Copier le nouveau firmware modifier sur une clef usb
# Faire l'installation du firmware sur votre HMB media

# Une fois l'installation du firmware faite sur votre box HMB
# il est necessaire de faire l'installation de IPKG
# cela se fait en lancant le script 'ipkg_install.sh'  


# Une fois IPKG installé vous pouvez manuellement rajouter les packages
# que vous voulez en tapant la commande suivante.
# ipkg -force-defaults install aria2  (ceci installera aria2c sur la box)
# ipkg -force-defaults install vsftpd  (ceci installera vsftpd  sur la box) 
# ipkg -force-defaults install msmtp  (ceci installera msmtp sur la box "smtp client")
# ipkg -force-defaults install mutt  (ceci installera mutt sur la box qui permet d'envoyer des email)
# ipkg -force-defaults install stunnel  (ceci installera stunnel pour ssh)

# Pour info les packages IPKG se trouvent a l'adresse web suivante
# http://ipkg.nslu2-linux.org/feeds/optware/oleg/cross/stable/


echo "START......................................................................"

echo "Copy firmware 757 to Rebuild Directory"
cp -f ../fw_C757/install.img  ../Rebuild/.

echo "Change to directory Tmp"
cd ../Rebuild/Tmp/

echo "Uncompress firmware 757"
./decomp.sh

echo "Change to directory mhd_patch"
cd ../../mhd-patch/

echo "Ajout de nouveaux fichiers"

echo "Copie de lynx.cfg  dans yaffs2_1/usr/local/etc "
cp -f lynx.cfg ../Rebuild/install/package2/yaffs2_1/usr/local/etc/

echo "Copie de lynx_bookmarks.html  dans yaffs2_1/usr/local/etc "
cp -f lynx_bookmarks.html ../Rebuild/install/package2/yaffs2_1/usr/local/etc/

echo "Creation de la directory .authenticate dans /usr/local/etc (email)"
mkdir ../Rebuild/install/package2/yaffs2_1/usr/local/etc/.authenticate

echo "Copie de ca.pem  dans /usr/local/etc/.authenticate"
cp -f ca.pem ../Rebuild/install/package2/yaffs2_1/usr/local/etc/.authenticate/

echo "Copie de .msmtprc dans yaffs2_2 (fonction email)"
cp -f .msmtprc ../Rebuild/install/package2/yaffs2_2/

echo "Copie de .muttrc dans yaffs2_2 (fonction email)"
cp -f .muttrc ../Rebuild/install/package2/yaffs2_2/

echo "Copie de start_rcS.sh dans yaffs2_2(script perso)"
cp -f start_rcS.sh ../Rebuild/install/package2/yaffs2_2/

echo "Creation de la directory stunnel dans yaffs2_1/usr/local/etc/"
mkdir ../Rebuild/install/package2/yaffs2_1/usr/local/etc/stunnel

echo "Copie de stunnel.pem dans yaffs2_1/usr/local/etc/stunnel"
cp -f stunnel.pem ../Rebuild/install/package2/yaffs2_1/usr/local/etc/stunnel

echo "Copie de stunnel.conf dans yaffs2_1/usr/local/etc/"
cp -f stunnel.conf ../Rebuild/install/package2/yaffs2_1/usr/local/etc

echo "Copie de stunnel.conf dans yaffs2_2"
cp -f stunnel.conf ../Rebuild/install/package2/yaffs2_2/

echo "Copie de ssh_start.sh dans yaffs2_2"
cp -f ssh_start.sh ../Rebuild/install/package2/yaffs2_2/

echo "Copie de ssh_stop.sh dans yaffs2_2"
cp -f ssh_stop.sh ../Rebuild/install/package2/yaffs2_2/

echo "Copie de ipkg_install.sh  dans yaffs2_2"
cp -f ipkg_install.sh  ../Rebuild/install/package2/yaffs2_2/

echo "Copie de TZ dans yaffs2_2 "
cp -f TZ ../Rebuild/install/package2/yaffs2_2/

echo "Copie de ntpupdate.sh  dans yaffs2_2"
cp -f ntpupdate.sh  ../Rebuild/install/package2/yaffs2_2/

echo "Copie de dtv_channel.txt  dans /usr/local/etc/dvdplayer"
cp -f dtv_channel.txt ../Rebuild/install/package2/yaffs2_1/usr/local/etc/dvdplayer/

echo "Copie de isRTC  dans /usr/local/etc/dvdplayer"
cp -f isRTC ../Rebuild/install/package2/yaffs2_1/usr/local/etc/dvdplayer/

echo "Creation de la directory .aria2 dans /usr/local/etc"
mkdir ../Rebuild/install/package2/yaffs2_1/usr/local/etc/.aria2

echo "Copie de aria2.conf  dans /usr/local/etc/.aria2"
cp -f aria2.conf ../Rebuild/install/package2/yaffs2_1/usr/local/etc/.aria2/

echo "Copie de hook.sh  dans /usr/local/etc/.aria2"
cp -f hook.sh ../Rebuild/install/package2/yaffs2_1/usr/local/etc/.aria2/

echo "Fin ajout de nouveaux fichiers............................................"
echo "  "
echo "DÃ©placement des anciens scripts et fichiers de config pour accÃ¨s RW......."

echo "Copie de profile dans /yaffs2_1/usr/local/etc"
cp -f profile ../Rebuild/install/package2/yaffs2_1/usr/local/etc/
echo "Copie de profile  dans /yaffs2_2"
cp -f profile ../Rebuild/install/package2/yaffs2_2/

echo "Copie de rcS dans /usr/local/etc pour demarrage de dropbear a partir de rcS"
cp -f rcS ../Rebuild/install/package2/yaffs2_1/usr/local/etc/
echo "Copie de rcS dans yaffs2_2/ pour demarrage de dropbear a partir de rcS"
cp -f rcS ../Rebuild/install/package2/yaffs2_2/

echo "Copie de ipkg-cl dans /usr/local/bin"
cp -f ipkg-cl ../Rebuild/install/package2/yaffs2_1/usr/local/bin/

echo "Copie de ntpdate dans /usr/sbin"
cp -f ntpdate ../Rebuild/install/package2/yaffs2_1/usr/sbin/

echo "Remplacement de passwd dans  yaffs2_2"
cp -f passwd ../Rebuild/install/package2/yaffs2_2/
echo "Remplacement de passwd dans yaffs2_1/usr/local/etc"
cp -f passwd ../Rebuild/install/package2/yaffs2_1/usr/local/etc/

echo "Suppression de inetd.conf dans /etc"
rm -f ../Rebuild/install/package2/yaffs2_1/etc/inetd.conf
echo "Copie de inetd.conf dans /usr/local/etc/"
cp -f inetd.conf ../Rebuild/install/package2/yaffs2_1/usr/local/etc/
echo "Copie de inetd.conf dans yaffs_2_2"
cp -f inetd.conf ../Rebuild/install/package2/yaffs2_2/

echo "Suppression de httpd.conf dans /etc"
rm -f ../Rebuild/install/package2/yaffs2_1/etc/httpd.conf

echo "Copie de httpd.conf dans /usr/local/etc/"
cp -f httpd.conf ../Rebuild/install/package2/yaffs2_1/usr/local/etc/

echo "Copie de httpd.conf dans yaffs2_2"
cp -f httpd.conf ../Rebuild/install/package2/yaffs2_2/

echo "Creation des liens symbolique pour inetd.conf et httpd.conf"
cd ../Rebuild/install/package2/yaffs2_1/etc/
ln -sf /usr/local/etc/inetd.conf inetd.conf
ln -sf /usr/local/etc/httpd.conf httpd.conf
cd ../../../../../mhd-patch/

echo "Creation du lien symbolique pour /opt vers /tmp/hdd/root/opt"
cd ../Rebuild/install/package2/yaffs2_1/
ln -sf /tmp/hdd/root/opt opt
cd ../../../../mhd-patch/

echo "Suppression de hostname dans yaffs2_1/etc"
rm -f ../Rebuild/install/package2/yaffs2_1/etc/hostname
echo "Copie de hostname dans yaffs2_2 "
cp -f hostname ../Rebuild/install/package2/yaffs2_2/
echo "Creation du lien symbolique pour hostname dans yaffs2_1/etc"
cd ../Rebuild/install/package2/yaffs2_1/etc/
ln -sf /usr/local/etc/hostname  hostname
cd ../../../../../mhd-patch/

echo "Suppression de hosts dans yaffs2_2"
rm -f ../Rebuild/install/package2/yaffs2_2/hosts
echo "Suppression de hosts dans yaffs2_1/usr/local/etc/"
rm -f ../Rebuild/install/package2/yaffs2_1/usr/local/etc/hosts
echo "Suppression de hosts dans yaffs2_1/etc/"
rm -f ../Rebuild/install/package2/yaffs2_1/etc/hosts
echo "Copie de hosts dans yaffs2_1/usr/local/etc/"
cp -f hosts ../Rebuild/install/package2/yaffs2_1/usr/local/etc/
echo "Copie de hosts dans yaffs2_2/usr/local/etc/"
cp -f hosts ../Rebuild/install/package2/yaffs2_2/
echo "Creation du lien symbolique pour hosts dans yaffs2_1/etc"
cd ../Rebuild/install/package2/yaffs2_1/etc/
ln -sf ../usr/local/etc/hosts  hosts
cd ../../../../../mhd-patch/

echo "Changement d'utilisateur de tous les fichiers en 500:500"
chown -R 500:500 .*
chown -R 500:500 *
echo "Changement des droits de tous les fichiers en 777"
chmod -R 777 .*
chmod -R 777 *

echo "Change to directory Tmp"
cd ../Rebuild/Tmp/

echo "Compress firmware 757"
./comp.sh

echo "END........................................................................"

exit 0;



