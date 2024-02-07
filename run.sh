#!/bin/sh
# Runs the image in an interactive session and removes the container when exit.
docker run -it --rm --name hdls_rad -v $(pwd)/data:/data headless-radiance:v5r4 /bin/bash

