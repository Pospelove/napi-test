FROM gcc

WORKDIR /usr/src

RUN \
  curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor > /usr/share/keyrings/yarnkey.gpg \
  && echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" > /etc/apt/sources.list.d/yarn.list \
  && curl -fsSL https://apt.kitware.com/keys/kitware-archive-latest.asc | gpg --dearmor - > /usr/share/keyrings/kitware-archive-keyring.gpg \
  && echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ focal main' > /etc/apt/sources.list.d/kitware.list \
  && apt-get update \
  && apt-get install -y cmake

RUN \
  apt-get update && apt-get install -y curl \
  && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
  && apt-get update \
  && apt-get install -y nodejs zip unzip tar ninja-build \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Pospelove/vcpkg.git && \
    cd vcpkg && \
    git fetch origin && \
    git reset --hard bb86325b1e5057964518e2fe0455b02308d5a2fd && \
    ./bootstrap-vcpkg.sh

# Environment variable VCPKG_FORCE_SYSTEM_BINARIES must be set on arm, s390x, and ppc64le platforms.
ENV VCPKG_FORCE_SYSTEM_BINARIES=1

RUN cd vcpkg && ./vcpkg install node-api

WORKDIR /usr/src/app

COPY . .

RUN mkdir build && \
    cd build && \
    cmake .. && \
    make

CMD [ "node", "." ]