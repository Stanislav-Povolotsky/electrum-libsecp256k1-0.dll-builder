#!/bin/bash
# Please, run prepare.sh first
set -e

mkdir ~/build
cd ~/build
git clone https://github.com/spesmilo/electrum.git
cd ./electrum
git submodule update --init

python3 -m pip install --user -e .

GCC_STRIP_BINARIES="1" GCC_TRIPLET_HOST="x86_64-w64-mingw32" ./contrib/make_libsecp256k1.sh
umask 0
mkdir -p ~/build-results/win.x64
cp ./electrum/libsecp256k1-0.dll ~/build-results/win.x64/
umask 0755

GCC_STRIP_BINARIES="1" GCC_TRIPLET_HOST="i686-w64-mingw32" ./contrib/make_libsecp256k1.sh
umask 0
mkdir -p ~/build-results/win.x86
cp ./electrum/libsecp256k1-0.dll ~/build-results/win.x86/
umask 0755

echo Done.
ls -alR  ~/build-results/