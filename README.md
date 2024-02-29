# Radiance Docker
Dockerfiles for creating a docker container for running a containerised instance of Radiance. 

There two ways to build the image: 
1. Use the pre-compiled binaries which may work in some images.
1. Compile from source, which is currently still broken in some areas due to some missing functions.

## Usage
1. Build the container image from source
```bash
bash build.sh
```
Or from pre-compiled binaries
```bash
bash build-bin.sh
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
