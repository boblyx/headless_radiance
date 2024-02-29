# syntax=docker/dockerfile:1
FROM python:3.10.13-slim-bookworm
ENV RAYPATH="/usr/local/radiance/lib"
WORKDIR /app
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \ 
    apt-get -y install curl tar unzip && \
    curl -L -O https://github.com/LBNL-ETA/Radiance/releases/download/rad5R4/Radiance_4ee32974_Linux.zip && \
    unzip Radiance_4ee32974_Linux.zip -d . && \
    tar -xvzf radiance-5.4.4ee32974b1-Linux.tar.gz && \
    mkdir -p /usr/local/radiance/bin && \
    mkdir -p /usr/local/radiance/lib && \
    cp radiance-5.4.4ee32974b1-Linux/usr/local/radiance/bin/* /usr/local/radiance/bin && \ 
    cp radiance-5.4.4ee32974b1-Linux/usr/local/radiance/lib/* /usr/local/radiance/lib && \
    echo "export PATH=/usr/local/radiance/bin:$PATH" >> $HOME/.bashrc && \
    rm -r ./* 
WORKDIR /root
# CMD tail -F /dev/null
LABEL name="radiance" \ 
      version="0.1" \
      description="Container for headless Radiance compiled from source."
