#!/bin/bash

sudo docker run -ti --device /dev/nvidia0:/dev/nvidia0 --device \
    /dev/nvidiactl:/dev/nvidiactl --device /dev/nvidia-uvm:/dev/nvidia-uvm \
    --net=host -v `cd "$1"; pwd`:/caffe/ djpetti/caffe /bin/bash


