FROM alpine:3.18

COPY . /app

WORKDIR /app

EXPOSE 3306

RUN chmod +x ./tools/setup.sh

CMD ["./tools/setup.sh"]
