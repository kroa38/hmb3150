#!/bin/sh
#log les telechargement dans le fichier de log
echo "`date` : Download Complete of : $3" >> /opt/log/aria2.log

#creer le message destine a etre envoye par mail
echo "`date` : Download Complete of : $3" > /opt/log/aria2_mail.log

#envoie un mail de confirmation de fin de telechargement
mutt -s "Download Complete" name@mail.com < /opt/log/aria2_mail.log

