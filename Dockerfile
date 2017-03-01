FROM ipropertygroup/python-base:latest
MAINTAINER MOHSEN@IPROPERTY

ENV DEBIAN_FRONTEND noninteractive

# Pick up some TF dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        python-opencv \
        libopencv-dev \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade
RUN pip install --allow-unverified tensorflow 
