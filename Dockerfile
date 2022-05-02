FROM java:8
MAINTAINER guzhongtao@middol.com
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
ENV LANG=C.UTF-8 \
    JAVA_OPTS="-server -Xms512m -Xmx512m" \
    SPRING_PROFILES_ACTIVE=prod \
    MYSQL_SERVICE_HOST=10.230.69.183 \
    MYSQL_SERVICE_USER=root \
    MYSQL_SERVICE_PASSWORD=Mypd12345_ \
    MYSQL_SERVICE_PORT=3306 \
    MAIL_HOST=mail.hme-system.com \
    MAIL_PORT=25 \
    MAIL_USER=qms.notice@hme-system.com \
    MAIL_FROM=qms.notice \
    MAIL_SMTP_AUTH=false \
    MAIL_PASSWORD=Qq12345678

ADD target/xxl-job-admin-2.3.0.jar app.jar
ENTRYPOINT exec java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar -Dspring.profiles.active=${SPRING_PROFILES_ACTIVE} /app.jar