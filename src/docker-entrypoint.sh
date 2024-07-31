#!/bin/sh

if [ -d "/pure-ftpd" ];then
	/pure-config.pl /pure-ftpd/pure-ftpd.conf
fi
tail -f /dev/null