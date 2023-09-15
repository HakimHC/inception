FROM alpine:3.18.3

RUN apk update && apk add wget

COPY . .

RUN chmod +x ./tools/setup.sh

CMD ["./tools/setup.sh"]
