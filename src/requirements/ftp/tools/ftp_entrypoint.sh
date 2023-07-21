#!/bin/sh

adduser	$FTP_USER --disabled-password
echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd
chown -R $FTP_USER:$FTP_USER /wp

/usr/sbin/vsftpd /etc/vsftpd.conf