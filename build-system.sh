#!/bin/bash
#
# Ubuntu22 build system @202504

set -ex

GOLANG_TAG="linux-amd64"
NODE_TAG="linux-x64"

# Install dependencies
apt-get install --no-install-recommends --yes \
    acpica-tools \
    asciidoc \
    autoconf \
    automake \
    bison \
    bmake \
    build-essential \
    curl \
    debhelper \
    devscripts \
    dosfstools \
    expect \
    flex \
    gawk \
    gettext \
    git \
    iproute2 \
    libacl1-dev \
    libaio-dev \
    libapparmor-dev \
    libbtrfs-dev \
    libcap-dev \
    libcap-ng-dev \
    libdbus-1-dev \
    libdevmapper-dev \
    libelf-dev \
    libfuse3-dev \
    libglib2.0-dev \
    libgnutls28-dev \
    libgpgme-dev \
    libjson-glib-dev \
    libnet1-dev \
    libnl-3-dev \
    libnuma-dev \
    libpam0g-dev \
    libpixman-1-dev \
    libpng-dev \
    libprotobuf-c-dev \
    libprotobuf-dev \
    librbd-dev \
    libseccomp-dev \
    libselinux1-dev \
    libspice-server-dev \
    libsqlite3-dev \
    libssl-dev \
    libsystemd-dev \
    libtirpc-dev \
    libtool \
    libudev-dev \
    libusb-1.0-0-dev \
    libusbredirhost-dev \
    libuv1-dev \
    lsb-release \
    mtools \
    ninja-build \
    pkg-config \
    protobuf-c-compiler \
    protobuf-compiler \
    python3-cryptography \
    python3-jinja2 \
    python3-pexpect \
    python3-pip \
    python3-setuptools \
    python3-venv \
    rsync \
    socat \
    uuid-dev \
    xmlto \
    xorriso

apt-get install --no-install-recommends --yes systemd-dev || true

pip3 install meson || pip3 install meson --break-system-packages
pip3 install tomli || pip3 install tomli --break-system-packages


# Install Go
curl -sL "https://go.dev/dl/go1.24.2.${GOLANG_TAG}.tar.gz" | tar -C /usr/local/ -zx
go version

# Install Rust
curl -sL https://sh.rustup.rs -o install-rust.sh
bash install-rust.sh -y

# Install Node
mkdir /usr/local/node/
curl -sL "https://nodejs.org/dist/v22.11.0/node-v22.11.0-${NODE_TAG}.tar.xz" | tar -C /usr/local/node/ -Jx --strip-components=1