#!/bin/bash
# Build helper script for the hazelnut microkernel tree.
# Usage: ./build.sh [kernel|apps|all]
# Default is 'all'.
set -e
ROOT_DIR=$(cd "$(dirname "$0")" && pwd)

build_kernel() {
    echo "==> Building kernel"
    (cd "$ROOT_DIR/kernel" && \
        make ARCH=x86 PLATFORM=i686 -k || true)
}

build_apps() {
    echo "==> Building user applications"
    (cd "$ROOT_DIR/apps" && \
        make ARCH=x86 PLATFORM=i686 -k || true)
}

case "$1" in
    kernel)
        build_kernel
        ;;
    apps)
        build_apps
        ;;
    all|"")
        build_kernel
        build_apps
        ;;
    *)
        echo "Usage: $0 [kernel|apps|all]" >&2
        exit 1
        ;;
esac

