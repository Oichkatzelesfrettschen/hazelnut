#!/bin/sh
# Simple build helper for the Hazelnut microkernel.
# Copies the default configuration if none exists and
# builds the kernel and user applications.
set -e

if [ ! -f kernel/xconfig/.config ]; then
  echo "Using default configuration" >&2
  cp kernel/xconfig/defconfig kernel/xconfig/.config
fi

if [ $# -eq 0 ]; then
  make -C kernel
  make -C apps
else
  make -C kernel "$@"
  make -C apps "$@"
fi
