FROM debian:jessie
MAINTAINER MOHSEN@IPROPERTY
ENV DEBIAN_FRONTEND noninteractive
RUN mkdir -p /usr/src/app

RUN apt-get update -y \
    && apt-get install -y curl python-pip python-dev libopencv-dev python-opencv \
    && rm -rf /var/lib/apt/lists/*

RUN pip install Flask

#install Tensorflow
ENV TENSORFLOW_VERSION 0.11.0rc0
RUN pip install \
    http://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-${TENSORFLOW_VERSION}-cp27-none-linux_x86_64.whl

COPY entrypoint.sh /entrypoint.sh
COPY wrapper.sh /wrapper.sh
RUN chmod +x /wrapper.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["init"]
