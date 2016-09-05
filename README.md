# Caffe
Simple Docker container with CUDA and Caffe.

This is a simple automated docker build for a Ubuntu 14.04-based container with
CUDA libraries and Theano pre-installed and configured. Note that it requires
nvidia-361 drivers to be installed on the host system.

Usage Note: To run this container, you must use nvidia-docker, like so:
```
sudo nvidia-docker run -ti djpetti:caffe
```

You can pull it from here: djpetti:caffe
