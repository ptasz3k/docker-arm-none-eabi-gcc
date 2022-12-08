FROM ubuntu:jammy

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y make wget git bzip2 && \
    mkdir -p /root/tmp && cd /root/tmp && \
    wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 && \
    tar jxf gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 && \
    mkdir -p /usr/local && \
    cp -R gcc-arm-none-eabi-10.3-2021.10/* /usr/local && \
    rm -rf gcc-arm-none-eabi-10.3-2021.10* && \
    useradd -mUs /bin/bash user

USER user
WORKDIR /home/user
