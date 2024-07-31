#!/bin/sh

# addgroup \
# 	-g $GID \
# 	-S \
# 	$FTP_USER

# adduser \
# 	-D \
# 	-G $FTP_USER \
# 	-h /home/$FTP_USER \
# 	-s /bin/false \
# 	-u $UID \
# 	$FTP_USER

# mkdir -p /home/$FTP_USER
# chown -R $FTP_USER:$FTP_USER /home/$FTP_USER
# echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd

# touch /var/log/vsftpd.log
# tail -f /var/log/vsftpd.log | tee /dev/stdout &
# touch /var/log/xferlog
# tail -f /var/log/xferlog | tee /dev/stdout &

replaceFile() {
	if [ -f "/etc/$1" -a -z "$(ls -F "/etc/$1" | grep '@')" ];then
		rm -f /etc/$1
		ln -s /pure-ftpd/$1 /etc/$1
	fi	
}


if [ -d "/pure-ftpd" ];then
	for x in $(ls /pure-ftpd); do
		replaceFile $x
	done
fi

/usr/sbin/pure-ftpd
