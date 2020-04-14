FROM ubuntu:18.04

RUN    apt-get    update        \
    && apt-get -y upgrade       \
    && apt-get -y dist-upgrade  \
    && apt-get -y install ca-certificates git cmake make clang-format g++ lcov valgrind

COPY . /src

WORKDIR /src

RUN ./build.sh
