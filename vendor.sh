#!/usr/bin/env bash

set -euo pipefail

GIT_ROOT=$(git rev-parse --show-toplevel)

cd $GIT_ROOT
mkdir -p external

# Git clone lodepng & setup structure
cd $GIT_ROOT/external
git clone https://github.com/lvandeve/lodepng.git
cd lodepng && git checkout 5601b8272a6850b7c5d693dd0c0e16da50be8d8d
rm -rf .git
mkdir -p include
mv lodepng.h include

# Git clone tinyxml2 & setup structure
cd $GIT_ROOT/external
git clone https://github.com/leethomason/tinyxml2.git
cd tinyxml2 && git checkout e45d9d16d430a3f5d3eee9fe40d5e194e1e5e63a
rm -rf .git
mkdir -p include
mv tinyxml2.h include

# Git clone tinyobjloader & setup structure
cd $GIT_ROOT/external
git clone https://github.com/tinyobjloader/tinyobjloader.git
cd tinyobjloader && git checkout 8322e00ae685ea623ab6ac5a6cebcfa2d22fbf93
rm -rf .git
mkdir -p include
mv tiny_obj_loader.h include

# Git clone ccd & setup structure
cd $GIT_ROOT/external
git clone https://github.com/danfis/libccd.git
cd libccd && git checkout 7931e764a19ef6b21b443376c699bbc9c6d4fba8
rm -rf .git
echo "#define CCD_DOUBLE" > src/ccd/config.h
mkdir -p src/include
mv src/ccd src/include
rm -rf src/testsuites

# Git clone qhull & setup structure
cd $GIT_ROOT/external
git clone https://github.com/qhull/qhull.git
cd qhull && git checkout 3df027b91202cf179f3fba3c46eebe65bbac3790
rm -rf .git

