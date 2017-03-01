FROM ipropertygroup/python-base:latest
MAINTAINER MOHSEN@IPROPERTY

ENV DEBIAN_FRONTEND noninteractive

# Pick up some TF dependencies
RUN apt-get update && apt-get install -y --no-install-recommends python-opencv libopencv-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && curl -o pip_installer.py https://bootstrap.pypa.io/get-pip.py \
 && python pip_installer.py \
 && /usr/local/bin/pip -V \
 && /usr/local/bin/pip install tensorflow
