FROM ubuntu:18.04 AS build

RUN apt update && \
    apt -y install gcc

RUN apt-get install nasm

CMD sleep infinity

