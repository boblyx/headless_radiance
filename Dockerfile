# syntax=docker/dockerfile:1
FROM python:3.10.13-slim-bookworm
ENV RAYPATH="/usr/local/radiance/lib"
WORKDIR /app
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \ 
    apt-get -y install curl tar cmake csh libtiff-dev libx11-dev g++ freeglut3-dev && \
    curl -L -O https://github.com/LBNL-ETA/Radiance/archive/refs/tags/rad5R4.tar.gz && \
    tar -xvzf rad5R4.tar.gz && \
    mkdir /app/Radiance-rad5R4/build
WORKDIR /app/Radiance-rad5R4/build
RUN cmake /app/Radiance-rad5R4 && \ 
    make -i && \ 
    mkdir /usr/local/ray && \ 
    mkdir /usr/local/ray/bin && \ 
    mkdir /usr/local/ray/lib && \
    cp /app/Radiance-rad5R4/build/bin/* /usr/local/radiance/bin && \ 
    cp /app/Radiance-rad5R4/build/lib/* /usr/local/radiance/lib && \
    echo "export PATH=/usr/local/radiance/bin:$PATH" >> $HOME/.bashrc && \
    make clean && \
    rm /app/rad5R4.tar.gz 
WORKDIR /app
# TODO: Implement tests before removing folder and cleaning
#RUN rm -r Radiance-rad5R4
CMD tail -F /dev/null
LABEL name="headless-radiance" \ 
      version="0.1" \
      description="Container for headless Radiance compiled from source."
