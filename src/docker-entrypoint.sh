#!/bin/sh

replaceFile() {
	if [ -f "/etc/$1" ];then
		if [ -z "$(ls -F "/etc/$1" | grep '@')" ];then
			rm -f /etc/$1
			ln -s /pure-ftpd/$1 /etc/$1
		fi
	else
		ln -s /pure-ftpd/$1 /etc/$1
	fi	
}


if [ -d "/pure-ftpd" ];then
	for x in $(ls /pure-ftpd); do
		replaceFile $x
	done
fi

/usr/sbin/pure-ftpd
