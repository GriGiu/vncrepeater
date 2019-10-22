FROM debian:stretch-slim

MAINTAINER GriGiu <grillo.giuseppe@gmail.com>

RUN apt-get update && apt-get upgrade -y 
RUN apt-get install -y build-essential wget vim
WORKDIR /usr/local/src
RUN wget http://www.wisdomsoftware.gr/download/uvncrep017-ws.tar.gz
RUN tar -xzvf uvncrep017-ws.tar.gz
WORKDIR /usr/local/src/uvncrep017-ws
RUN make 
RUN make install
RUN useradd  -s /sbin/nologin uvncrep
EXPOSE 5500 5901
CMD service uvncrepeater start
