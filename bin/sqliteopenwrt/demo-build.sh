CGO_ENABLED=1 \
    CGO_CFLAGS="-D_LARGEFILE64_SOURCE" \
    STAGING_DIR=/builder/staging_dir/toolchain-mipsel_24kc_gcc-12.3.0_musl \
    CC=mipsel-openwrt-linux-musl-gcc \
    LD=mipsel-openwrt-linux-musl-ld \
    GOOS=linux \
    GOARCH=mipsle \
    GOMIPS=softfloat \
    go build -o wrt-sqlite-test
