FROM ubuntu:18.04 AS build

RUN apt update

RUN apt-get -y install gcc-multilib

RUN apt-get install nasm

CMD sleep infinity

