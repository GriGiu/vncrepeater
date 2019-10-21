FROM debian:stretch-slim

MAINTAINER Gri Giu <grillo.giuseppe@gmail.com>

RUN apt-get update && apt-get upgrade -y
#RUN apt-get install -y nano x-window-system-core x-window-system libxtst6 psmisc build-essential 
#RUN apt-get install -y libx11-6 libx11-dev
RUN apt-get install -y build-essential wget
RUN cd /usr/local/src
RUN wget http://www.wisdomsoftware.gr/download/uvncrep017-ws.tar.gz
#RUN gunzip uvncrep017-ws.tar.gz
RUN tar -xzvf uvncrep017-ws.tar.gz
RUN cd uvncrep017-ws

RUN make && ./install.sh
RUN useradd  -s /sbin/nologin uvncrep
EXPOSE 5900 5901
RUN service uvncrepeater start
