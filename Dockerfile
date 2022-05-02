FROM java:8
MAINTAINER xxxx@163.com
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
ENV LANG=C.UTF-8 \
    JAVA_OPTS="-server -Xms512m -Xmx512m" \
    SPRING_PROFILES_ACTIVE=dev \
    MYSQL_SERVICE_HOST=127.0.0.1 \
    MYSQL_SERVICE_USER=root \
    MYSQL_SERVICE_PASSWORD=root123 \
    MYSQL_SERVICE_PORT=3306 \
    MAIL_HOST=mail.xxxx.com \
    MAIL_PORT=25 \
    MAIL_USER=abc@xxxx.com \
    MAIL_FROM=abc \
    MAIL_SMTP_AUTH=false \
    MAIL_PASSWORD=abc123

ADD target/xxl-job-admin-2.3.0.jar app.jar
ENTRYPOINT exec java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar -Dspring.profiles.active=${SPRING_PROFILES_ACTIVE} /app.jar