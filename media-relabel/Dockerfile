FROM alpine:3.20
RUN apk add --no-cache bash rsync e2fsprogs util-linux coreutils
COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
