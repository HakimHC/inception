FROM alpine:3.18

RUN apk update && apk add redis

COPY tools tools
RUN chmod +x ./tools/setup.sh

CMD ["./tools/setup.sh"]
