FROM djpetti/ubuntu-cuda:14.04
MAINTAINER Daniel Petti

# Install CuDNN
COPY cudnn-7.0-linux-x64-v4.0-prod.tgz /
RUN tar -xvf /cudnn-7.0-linux-x64-v4.0-prod.tgz
RUN mv /cuda/include/* /usr/local/cuda/include/
RUN mv /cuda/lib64/* /usr/local/cuda/lib64/
RUN rm -rf /cuda/
RUN rm /cudnn-7.0-linux-x64-v4.0-prod.tgz

# Install caffe dependencies.
RUN apt-get install -y python-numpy libboost-system-dev \
    libboost-thread-dev libboost-filesystem-dev cmake libhdf5-dev liblmdb-dev \
    libleveldb-dev libsnappy-dev libopencv-dev libatlas-base-dev python-dev \
    libboost-python-dev libgoogle-glog-dev protobuf-compiler libprotobuf-dev git

# Download and install caffe.
RUN git clone https://github.com/BVLC/caffe.git
RUN cd caffe && mkdir build
RUN cd caffe/build && cmake ..
RUN cd caffe/build && make -j8
RUN cd caffe/build && make install

RUN mv caffe/ caffe_built/
