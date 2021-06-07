FROM ubuntu:focal

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y make vim-common wget git && \
    mkdir -p /root/tmp && cd /root/tmp && \
    wget https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2 && \
    tar jxf gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2 && \
    mkdir -p /usr/local && \
    cp -R gcc-arm-none-eabi-10-2020-q4-major/* /usr/local && \
    rm -rf gcc-arm-none-eabi-10-2020-q4-major* && \
    useradd -mUs /bin/bash user

USER user
WORKDIR /home/user
