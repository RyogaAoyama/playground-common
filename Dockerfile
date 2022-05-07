# PythonのDockerイメージを指定
FROM python:3.9

# cfn-lint
RUN pip install cfn-lint

# aws-cli
RUN pip install awscli

# rain
ARG RAIN_VER=1.2.0
ADD https://github.com/aws-cloudformation/rain/releases/download/v${RAIN_VER}/rain-v${RAIN_VER}_linux-amd64.zip /tmp/rain.zip
RUN apt-get install unzip -y \
    && unzip -j /tmp/rain.zip */rain -d /usr/local/bin/ \
    && chmod 755 /usr/local/bin/rain \
    && rm /tmp/rain.zip

# vim
RUN apt-get update
RUN apt-get install vim -y

COPY . /usr/src/

WORKDIR /usr/src/