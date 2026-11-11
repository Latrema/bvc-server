FROM ubuntu:22.04

RUN apt-get update && apt-get install -y wget unzip ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN wget https://github.com && \
    unzip bvc-server-linux-x64.zip && \
    chmod +x server && \
    rm bvc-server-linux-x64.zip

EXPOSE 8080

CMD ["./server", "-config", "config.htcl"]
