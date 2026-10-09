FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y bind9 dnsutils && \
    rm -rf /var/lib/apt/lists/*

COPY bind-config /etc/bind

EXPOSE 53/udp
EXPOSE 53/tcp

CMD ["named", "-f", "-g"]