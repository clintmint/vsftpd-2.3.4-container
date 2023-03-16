FROM alpine:latest
COPY vsftpd-2.3.4-musl.tar.gz /root
RUN apk update 
RUN apk add libnsl
RUN apk add gcc
RUN apk add make
RUN apk add libc-dev
RUN apk add linux-headers
RUN echo "#include <unistd.h>" > /usr/include/sys/unistd.h
WORKDIR /root
RUN tar xf vsftpd-2.3.4-musl.tar.gz
WORKDIR /root/vsftpd-2.3.4-musl
RUN make
RUN cp vsftpd.conf /etc
RUN mkdir /var/lib/ftp
RUN mkdir /usr/share/empty
CMD /root/vsftpd-2.3.4-musl/vsftpd
EXPOSE 21