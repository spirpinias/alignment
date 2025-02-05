FROM ubuntu:20.04 
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \ 
    apt-get -y upgrade && \
    apt-get -y install python3 python3-pip

RUN pip install -U --no-cache-dir \
    multiqc