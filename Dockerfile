FROM ubuntu:bionic

MAINTAINER Autodomotalus <https://github.com/autodomotalus>

RUN apt-get update

# Install some utilities: wget bzip2 nano
RUN apt-get install -y wget bzip2 nano unzip maven curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
  
RUN mkdir -p $HOME/workspace

ENV WORK $HOME/workspace


