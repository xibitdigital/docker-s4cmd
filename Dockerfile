FROM alpine:3.2

RUN apk --update add python py-pip bash git && \
    git clone https://github.com/bloomreach/s4cmd.git && \
    cd s4cmd && \
    pip install --no-cache-dir -r requirements.txt && \
    mv s4cmd /usr/bin/ && \
    cd .. && \
    rm -rf s4cmd && \
    rm -rf /var/cache/apk/*

RUN chmod +x /usr/bin/s4cmd

WORKDIR /var/www/appliance

ENTRYPOINT ["/usr/bin/s4cmd"]

CMD ["--help"]
