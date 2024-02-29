#!/bin/sh
# Builds the docker image
docker build -f bin.Dockerfile -t radiance:v5r4 . 
