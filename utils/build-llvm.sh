#!/usr/bin/env bash
##===- utils/build-llvm.sh - Build LLVM for github workflow --*- Script -*-===##
# 
# This file licensed under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
# 
##===----------------------------------------------------------------------===##
#
# This script build LLVM with the standard options. Intended to be called from 
# the github workflows.
#
##===----------------------------------------------------------------------===##

BUILD_DIR=${1:-"build"}
INSTALL_DIR=${2:-"install"}

mkdir -p $BUILD_DIR
mkdir -p $INSTALL_DIR
pushd $BUILD_DIR
cmake ../llvm/llvm \
  -DLLVM_BUILD_EXAMPLES=OFF \
  -DLLVM_TARGETS_TO_BUILD="host" \
  -DCMAKE_INSTALL_PREFIX=../$INSTALL_DIR \
  -DLLVM_ENABLE_PROJECTS='mlir' \
  -DLLVM_OPTIMIZED_TABLEGEN=OFF \
  -DLLVM_ENABLE_OCAMLDOC=OFF \
  -DLLVM_ENABLE_BINDINGS=ON \
  -DMLIR_ENABLE_BINDINGS_PYTHON=ON \
  -DLLVM_INSTALL_UTILS=ON \
  -DCMAKE_C_COMPILER=clang-8 \
  -DCMAKE_CXX_COMPILER=clang++-8 \
  -DLLVM_ENABLE_LLD=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_ENABLE_ASSERTIONS=ON

cmake --build . --target install -- -j$(nproc)
