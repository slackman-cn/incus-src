#!/bin/bash
#
# Incus source code @202504

set -ex

# Configure git
git config --global user.email "slackman@disroot.org"
git config --global user.name "slackman"
git config --global --add advice.detachedHead false
git config --global core.autocrlf false

# Linux Containers projects
DISTROBUILDER_TAG="distrobuilder-3.1"
INCUS_TAG="main"
INCUS_UI_CANONICAL_TAG="incus-0.15.1"
LXCFS_TAG="v6.0.3"
LXC_TAG="v6.0.3"
# External dependencies
COWSQL_TAG="v1.15.8"
CRIU_TAG="v4.1"
EDK2_TAG="edk2-stable202411"
LEGO_TAG="v4.22.2"
LIBTPMS_TAG="v0.10.0"
LIBURING_TAG="liburing-2.9"
MINIO_MC_TAG="RELEASE.2025-03-12T17-29-24Z"
MINIO_TAG="RELEASE.2025-03-12T18-04-18Z"
NASM_TAG="nasm-2.16.03"
NVIDIA_CONTAINER_TAG="v1.17.5"
QEMU_TAG="v9.2.3"
RAFT_TAG="v0.22.1"
SEABIOS_TAG="rel-1.16.3"
SKOPEO_TAG="v1.18.0"
SWTPM_TAG="v0.10.0"
UMOCI_TAG="v0.4.7"
VIRTIOFSD_TAG="v1.13.1"


git clone https://github.com/lxc/distrobuilder /build/distrobuilder --depth 1 -b "${DISTROBUILDER_TAG}"
git clone https://github.com/lxc/lxc /build/lxc --depth 1 -b "${LXC_TAG}"
git clone https://github.com/lxc/lxcfs /build/lxcfs --depth 1 -b "${LXCFS_TAG}"
git clone https://github.com/lxc/incus /build/incus -b "${INCUS_TAG}"
git clone https://github.com/zabbly/incus-ui-canonical /build/incus-ui-canonical --depth 1 -b "${INCUS_UI_CANONICAL_TAG}"

git clone https://github.com/axboe/liburing /build/liburing --depth 1 -b "${LIBURING_TAG}"
git clone https://github.com/checkpoint-restore/criu /build/criu --depth 1 -b "${CRIU_TAG}"
git clone https://github.com/containers/skopeo /build/skopeo --depth 1 -b "${SKOPEO_TAG}"
git clone https://github.com/cowsql/cowsql /build/cowsql --depth 1 -b "${COWSQL_TAG}"
git clone https://github.com/cowsql/raft /build/raft --depth 1 -b "${RAFT_TAG}"
git clone https://github.com/go-acme/lego /build/lego --depth 1 -b "${LEGO_TAG}"
git clone https://github.com/minio/mc /build/mc --depth 1 -b "${MINIO_MC_TAG}"
git clone https://github.com/minio/minio /build/minio --depth 1 -b "${MINIO_TAG}"
git clone https://github.com/NVIDIA/libnvidia-container /build/libnvidia-container --depth 1 -b "${NVIDIA_CONTAINER_TAG}"
git clone https://github.com/opencontainers/umoci /build/umoci --depth 1 -b "${UMOCI_TAG}"
git clone https://github.com/stefanberger/libtpms /build/libtpms --depth 1 -b "${LIBTPMS_TAG}"
git clone https://github.com/stefanberger/swtpm /build/swtpm --depth 1 -b "${SWTPM_TAG}"
git clone https://github.com/tianocore/edk2 /build/edk2 --recurse-submodules --shallow-submodules --depth 1 -b "${EDK2_TAG}"
git clone https://gitlab.com/qemu-project/qemu /build/qemu --depth 1 -b "${QEMU_TAG}"
git clone https://gitlab.com/qemu-project/seabios /build/seabios --depth 1 -b "${SEABIOS_TAG}"
git clone https://gitlab.com/virtio-fs/virtiofsd /build/virtiofsd --depth 1 -b "${VIRTIOFSD_TAG}"

mkdir /build/nasm/
# www.nasm.us is down @202504
#curl -sL "https://www.nasm.us/pub/nasm/releasebuilds/$(echo ${NASM_TAG} | cut -d- -f2)/${NASM_TAG}.tar.gz" | tar -C /build/nasm/ -zx --strip-components=1
