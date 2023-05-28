FROM alpine:3.18

COPY . /app

WORKDIR /app

ENV MYSQL_ROOT_PASSWORD="dufus"
ENV MYSQL_USER="hakim"
ENV MYSQL_PASSWORD="123"

EXPOSE 3306

RUN chmod +x setup.sh

CMD ["sh"]
