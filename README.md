this repo contains code example from [go-sqlite3](https://github.com/mattn/go-sqlite3/blob/master/_example/simple/simple.go)
# Container
Use docker or podman. Untested with docker.
```sh
    podman build -t go_openwrt_builder .
```

## Gotify instructions
Gotify is modified to be "headless" to minimize the binary size and makes it simpler.

**_NOTE:_** gotify-build.sh includes go build arguments that would fail without it. I have not tested running it without "-tags netgo"
```sh
    git clone https://github.com/gotify/server.git bin/server
    cp gotify-files/* bin/server/
    cd bin/server
    mv ui _ui 
    git apply gotify-headless.patch
    # cd back into the root of this repo
    cd ../../
    podman run -u root -v "$(pwd)"/bin/:/builder/bin -it go_openwrt_builder
```

## NTFY instructions
quick look at the code, making ntfy headless isn't as simple
```sh
    git clone https://github.com/binwiederhier/ntfy.git bin/ntfy
    cp ./ntfy-build.sh bin/ntfy
    cd bin/ntfy
    make web docs
    # cd back into the root of this repo
    cd ../../
    podman run -u root -v "$(pwd)"/bin/:/builder/bin -it go_openwrt_builder
```

# While inside the container:
## Gotify
```sh
    cd bin/server
    sh ./gotify-build.sh
    file server
```
## NTFY
```sh
    cd bin/ntfy
    sh ./ntfy-build.sh
    file server
```

`file` command should say your target architecture, i.e. "MIPS"