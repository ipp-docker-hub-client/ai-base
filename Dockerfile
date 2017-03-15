FROM ipropertygroup/python-base:latest
MAINTAINER MOHSEN@IPROPERTY

ENV DEBIAN_FRONTEND noninteractive

# Pick up some TF dependencies
RUN apt-get update \
 && apt-get install -y --no-install-recommends python-opencv libopencv-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && /usr/local/bin/pip install tensorflow

# Adding Bazel from custom APT repository
RUN apt-get update \
 && apt-get install -y software-properties-common \
 && add-apt-repository -y ppa:webupd8team/java \
 && apt-get update \
 && apt-get install -y oracle-java8-installer \
 && echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list \
 && curl https://bazel.build/bazel-release.pub.gpg | apt-key add - \
 && apt-get update \
 && apt-get install -y bazel \
 && apt-get upgrade -y bazel \
 && bazel version 
 
