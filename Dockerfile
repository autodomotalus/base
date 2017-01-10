FROM ubuntu:14.04

MAINTAINER Autodomotalus <https://github.com/autodomotalus>

RUN apt-get update

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

# Install some utilities: wget bzip2 nano
RUN apt-get install -y wget bzip2 nano unzip maven curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
  
RUN mkdir -p $HOME/workspace

ENV HOME /home/developer
ENV WORK $HOME/workspace


