FROM centos
ARG STAR_VERSION=2.7.0e
RUN set -x && yum update -y && yum install -y \
    wget \
    make \
    zlib-devel* \
    gcc \
    gcc-c++ \
    && yum clean all && \
    cd /tmp && \
    wget https://github.com/alexdobin/STAR/archive/${STAR_VERSION}.tar.gz && \
    tar -xzf ${STAR_VERSION}.tar.gz && \
    cd STAR-${STAR_VERSION}/source && \
    make STAR && \
    cp ./STAR /usr/bin/STAR && \
    cd /tmp && \
    rm -rf ${STAR_VERSION}.tar.gz && \
    rm -rf ./STAR-${STAR_VERSION}
