FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -y upgrade && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        autoconf \
        automake \
        zlib1g-dev \
        libbz2-dev \
        liblzma-dev \
        libcurl4-gnutls-dev \
        libssl-dev \
        libdeflate-dev \
        git \
        cmake \
        make \
        gcc \
        perl \
        g++ \
        wget \
        bzip2 \
        patch \
    && rm -rf /var/lib/apt/lists/* 

RUN wget https://github.com/samtools/htslib/releases/download/1.21/htslib-1.21.tar.bz2 -O htslib-1.21.tar.bz2
RUN tar -xvjf htslib-1.21.tar.bz2
RUN cd htslib-1.21
RUN make /htslib-1.21
RUN cd /htslib-1.21 && make install 

RUN git clone https://github.com/TileDB-Inc/TileDB-VCF.git
RUN cd TileDB-VCF/libtiledbvcf

RUN mkdir build && cd build
RUN cmake TileDB-VCF/libtiledbvcf/ && make -j8
RUN make install-libtiledbvcf

RUN PATH=$PATH:/libtiledbvcf/src