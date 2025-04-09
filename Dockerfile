FROM ubuntu:22.04
LABEL \
    org.opencontainers.image.title="Incus 6.11" \
    org.opencontainers.image.vendor="Ubuntu22 build system" \
    org.opencontainers.image.licenses="Apache" \
    org.opencontainers.image.created="2025-04-09" \
    maintainer="slackman.cn"

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Shanghai 

RUN apt-get update && apt-get install -y --no-install-recommends tzdata \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime  \
    && echo $TZ > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata 


# Install build base
WORKDIR /build
COPY build-system.sh .
COPY clone-source.sh .

RUN bash build-system.sh && bash clone-source.sh \
  && apt-get clean && rm -rf /var/lib/apt/lists/*


CMD ["bash"]
