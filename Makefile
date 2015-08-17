
TOOLCHAIN=/usr/local/toolchain-arm_cortex-a9_gcc-4.8-linaro_musl-1.1.5_eabi

CC=$(TOOLCHAIN)/bin/arm-openwrt-linux-muslgnueabi-gcc

EXTLDFLAGS=-static
LDFLAGS=-linkmode external -extldflags "$(EXTLDFLAGS)"

all: hellogo helloc

hellogo: hello.go Makefile
	GOOS=linux GOARCH=arm GOARM=5 CC=$(CC) go build --ldflags='$(LDFLAGS)' -o hellogo hello.go

helloc: hello.c Makefile
	$(CC) -Wall hello.c -o helloc

clean:
	rm -f hellogo helloc
