FROM alpine:3.18

RUN apk update && \
    apk add nginx openssl

EXPOSE 443
EXPOSE 80

RUN mkdir /app && mkdir /www && mkdir /etc/nginx/ssl

WORKDIR /app

COPY ./index.html /www

COPY tools ./tools
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod +x tools/setup.sh

EXPOSE 443

CMD ["./tools/setup.sh"]
