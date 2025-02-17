//===- PassDetail.h ---------------------------------------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// (c) Copyright 2021 Xilinx Inc.
//
//===----------------------------------------------------------------------===//

#ifndef XTEN_CONVERSION_PASSDETAIL_H
#define XTEN_CONVERSION_PASSDETAIL_H

#include "mlir/Pass/Pass.h"

namespace xilinx {
namespace xten {

using namespace mlir;

#define GEN_PASS_CLASSES
#include "xten/Conversion/Passes.h.inc"

} // namespace xten
} // namespace xilinx

#endif // XTEN_CONVERSION_PASSDETAIL_H