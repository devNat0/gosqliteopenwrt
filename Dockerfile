FROM docker.io/openwrt/sdk:ramips-mt7621-openwrt-23.05

USER root
RUN wget https://go.dev/dl/go1.23.1.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.23.1.linux-amd64.tar.gz

ENV PATH="${PATH}:/usr/local/go/bin"
ENV PATH="${PATH}:/builder/staging_dir/toolchain-mipsel_24kc_gcc-12.3.0_musl/bin"

USER buildbot
