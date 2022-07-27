FROM docker.io/library/ubuntu:20.04

RUN \
    apt-get update  && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y curl gpg lsb-core && \
    rm -rf /var/lib/apt/lists/*.

RUN \
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg  && \
    sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'  && \
    apt-get update  && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y azure-functions-core-tools-4  && \
    rm -rf /var/lib/apt/lists/*.

ENTRYPOINT ["func"]
CMD ["help"]
