FROM alpine:3.20.1
ENV FTP_USER=foo \
	FTP_PASS=bar \
	GID=1000 \
	UID=1000

RUN apk add --no-cache --update vsftpd db4
 	# db4 \
 	# iproute

COPY [ "/src/vsftpd.conf", "/etc" ]
COPY [ "/src/docker-entrypoint.sh", "/" ]

ENTRYPOINT [ "/docker-entrypoint.sh" ]
EXPOSE 8095-8099/tcp
#HEALTHCHECK CMD netstat -lnt | grep :21 || exit 1
