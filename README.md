# Protobuf clashing

The is a demo on showing how protobuf in mysql-connector-cpp clashs the protobuf installed in system.

# Usage

To run locally, you need to have gcc 9.3.0, cmake 3.18 and protobuf 3.13.0 installed:

```
mkdir build
cd build
cmake ..
make
```

or you can run with docker:


```
# build the docker image
make
# spin up a docker container
docker run -it --rm chanpl/protobufclash:0.0.1 bash

# run the build inside the docker container
mkdir build
cd build
cmdke ..
make
```
