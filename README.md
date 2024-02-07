# Headless Radiance
Dockerfile for creating a Docker container for running a headless instance of [Radiance](https://github.com/LBNL-ETA/Radiance/tree/master) by the [Lawrence Berkeley National Laboratory](https://github.com/LBNL-ETA). 

## Usage
1. Build the container image
```bash
bash build.sh
```
1. Make a folder to mount
```bash
mkdir data
```
1. Run the container
```
bash run.sh
```

## TODO
1. Run tests
1. Cleanup source code after successful install
