FROM debian:stretch-slim

MAINTAINER Gri Giu <grillo.giuseppe@gmail.com>

RUN apt-get update && apt-get upgrade -y
#RUN apt-get install -y nano x-window-system-core x-window-system libxtst6 psmisc build-essential 
#RUN apt-get install -y libx11-6 libx11-dev
RUN apt-get install -y build-essential wget vim
WORKDIR /usr/local/src
RUN wget http://www.wisdomsoftware.gr/download/uvncrep017-ws.tar.gz
RUN tar -xzvf uvncrep017-ws.tar.gz
WORKDIR /usr/local/src/uvncrep017-ws
RUN make 
RUN make install
RUN useradd  -s /sbin/nologin uvncrep
EXPOSE 5900 5901
RUN service uvncrepeater start
