FROM debian:stretch-slim

MAINTAINER Gri Giu <grillo.giuseppe@gmail.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nano x-window-system-core x-window-system libxtst6 psmisc build-essential 
RUN apt-get install -y libx11-6 libx11-dev
RUN cd /usr/local/src
RUN wget http://www.wisdomsoftware.gr/download/uvncrep017-ws.tar.gz
RUN gunzip uvncrep017-ws.tar.gz
RUN tar -xvf uvncrep017-ws.tar
RUN cd uvncrep017-ws
EXPOSE 5900 5901
RUN make && make install
RUN useradd uvncrep
RUN service uvncrepeater start
