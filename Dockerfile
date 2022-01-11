FROM --platform=$BUILDPLATFORM docker.io/node:16.13.1-stretch-slim

ARG SKAFFOLD_GO_GCFLAGS
ARG TARGETOS
ARG TARGETARCH

RUN npm install -g json-server \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y curl \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

LABEL org.opencontainers.image.source=https://github.com/shipperizer/json-mock

RUN uname -a

ADD run.sh default.json /
ENTRYPOINT ["bash", "/run.sh"]
CMD []
