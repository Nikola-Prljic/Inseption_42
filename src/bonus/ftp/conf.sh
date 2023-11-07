#!/bin/sh
if [ -e /etc/vsftpd/vsftpd.conf.bak ]
then
    NO_FORMAT="\033[0m"
    C_GREEN1="\033[38;5;46m"
    echo -e "${C_GREEN1}FTP server is already set up.${NO_FORMAT}"
else
    mkdir -p /var/www/html
    touch /etc/vsftpd.chroot_list
    cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
    mv /etc/vsftpd.conf /etc/vsftpd/
    adduser -D -h $FTP_REPOSITORY $FTP_USER && echo "FTP user creation [ OK ]"
    passwd -d "$FTP_USER" "$FTP_PASS" && echo "FTP user password configuration [ OK ]"
    chown -R $FTP_USER:$FTP_USER /var/www/html && echo "FTP user directory configuration [ OK ]"
    echo $FTP_USER >> /etc/vsftpd.userlist && echo "add $FTP_USER /etc/vsftpd.userlist [ OK ]"
fi
exec "$@"
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf