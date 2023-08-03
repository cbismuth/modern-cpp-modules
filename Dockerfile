FROM ubuntu:latest

RUN    apt-get    update        \
    && apt-get -y upgrade       \
    && apt-get -y dist-upgrade  \
    && apt-get -y install ca-certificates git cmake make clang-format g++ lcov valgrind

ADD "https://www.random.org/cgi-bin/randbyte?nbytes=1024&format=b" .skipcache

COPY    . /opt/modern-cpp-modules
WORKDIR   /opt/modern-cpp-modules
RUN       /opt/modern-cpp-modules/entrypoint.sh
