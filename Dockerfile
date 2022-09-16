FROM gcc

WORKDIR /usr/src

RUN \
  apt-get update && apt-get install -y curl \
  && curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
  && apt-get update \
  && apt-get install -y zip unzip tar cmake \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Pospelove/vcpkg.git && \
    cd vcpkg && \
    git fetch origin && \
    git reset --hard 098ee3e7d7a58926dc8cc516aec62abb9bc40e51 && \
    ./bootstrap-vcpkg.sh

RUN cd vcpkg && ./vcpkg install node-api

WORKDIR /usr/src/app

COPY . .

RUN mkdir build && \
    cd build && \
    cmake .. && \
    make