#!/bin/sh
# Runs the image in an interactive session and removes the container when exit.
docker run -it --rm --name rad -v $(pwd)/data:/root/data radiance:v5r4 /bin/bash

