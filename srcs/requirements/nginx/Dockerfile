FROM alpine:3.18

RUN apk update && \
    apk add nginx openssl bash

EXPOSE 443
EXPOSE 80

RUN mkdir /app && mkdir /www

WORKDIR /app

COPY tools ./tools
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod +x tools/setup.sh

CMD ["./tools/setup.sh"]
