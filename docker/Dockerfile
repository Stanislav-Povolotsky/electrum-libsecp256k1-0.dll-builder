FROM ubuntu:18.04
WORKDIR /root

ADD prepare.sh  ./
RUN bash ./prepare.sh && rm -rf /var/lib/apt/lists/*

ADD build.sh ./
CMD bash ./build.sh
