# Docker Python3-pytorch

A docker version with `python3`, and `pytorch (nightly-devel-cuda10.0-cudnn7)` for compile and test everything pytorch based application

## Execute scripts

The following script will execute the scripts `/script/to/run; /or/set/of/them` as if they were run on your machine.

In order to see what is going inside the docker we need to sync the displays with:

`--env DISPLAY=$DISPLAY --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"` if you use **Linux based systems**.

`-e DISPLAY=${HOST_IP}:0` if you use **OSX systems**.


Also, we will share the source code directories `-v=$(pwd)/..:$(pwd)/..` (this assumes you are doing an out-of-source build and you have a parent directory with the `build` and `src` as children). And we set the current directory as our working directory `-w=$(pwd)`.

GPU version:

    nvidia-docker run -it --rm \
      --env DISPLAY=$DISPLAY --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
      -v=$(pwd)/..:$(pwd)/.. -w=$(pwd) \
      pytorch:latest-gpu \
      /script/to/run; /or/set/of/them

or if you want enter in the image use the   `Makefile` commands:

Enter gpu version

    make run-gpu


## Build the image locally

You can build the image locally by executing the `Makefile`

Creating gpu version

    make build-gpu

Based on this [repo](https://github.com/adinriv/docker-opencv) and this [repo](https://github.com/so77id/docker-tensorflow-opencv3).