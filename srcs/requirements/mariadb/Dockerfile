FROM alpine:3.18


COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./tools ./tools

RUN chmod +x ./tools/setup.sh

CMD ["./tools/setup.sh"]
