FROM debian:stretch-slim

MAINTAINER GriGiu <grillo.giuseppe@gmail.com>

RUN apt-get update && apt-get upgrade
RUN apt-get install -y build-essential wget vim procps bash

WORKDIR /usr/local/src
RUN wget http://www.wisdomsoftware.gr/download/uvncrep017-ws.tar.gz
RUN tar -xzvf uvncrep017-ws.tar.gz
WORKDIR /usr/local/src/uvncrep017-ws
RUN make 
RUN make install
RUN useradd  -s /sbin/nologin uvncrep
EXPOSE 5500 5901

RUN /bin/sed -i "s/sh/bash/1" /etc/init.d/uvncrepeater
RUN ["chmod", "+x", "/etc/init.d/uvncrepeater"]

CMD ["/bin/bash"]
WORKDIR /

COPY ./entrypoint.sh entrypoint.sh
RUN chmod 777 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

