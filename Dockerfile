FROM alpine:latest

RUN apk add --no-cache --update \
	pure-ftpd

# COPY [ "/src/vsftpd.conf", "/etc" ]
COPY [ "/src/docker-entrypoint.sh", "/" ]

ENTRYPOINT [ "/docker-entrypoint.sh" ]
# EXPOSE 20/tcp 21/tcp 40000-40009/tcp
# HEALTHCHECK CMD netstat -lnt | grep :21 || exit 1
