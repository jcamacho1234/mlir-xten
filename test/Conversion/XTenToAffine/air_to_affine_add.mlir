// RUN: aten-opt %s --xten-to-affine -cse | FileCheck %s
// NOTE: Assertions have been autogenerated by utils/generate-test-checks.py


// CHECK-LABEL:   func @task(
// CHECK-SAME:               %[[VAL_0:.*]]: tensor<3x4x5xf32>,
// CHECK-SAME:               %[[VAL_1:.*]]: tensor<3x4x5xf32>) -> tensor<3x4x5xf32> {
// CHECK:           %[[VAL_2:.*]] = memref.alloc() : memref<3x4x5xf32>
// CHECK:           %[[VAL_3:.*]] = memref.buffer_cast %[[VAL_0]] : memref<3x4x5xf32>
// CHECK:           %[[VAL_4:.*]] = memref.buffer_cast %[[VAL_1]] : memref<3x4x5xf32>
// CHECK:           affine.for %[[VAL_5:.*]] = 0 to 3 {
// CHECK:             affine.for %[[VAL_6:.*]] = 0 to 4 {
// CHECK:               affine.for %[[VAL_7:.*]] = 0 to 5 {
// CHECK:                 %[[VAL_8:.*]] = affine.load %[[VAL_3]]{{\[}}%[[VAL_5]], %[[VAL_6]], %[[VAL_7]]] : memref<3x4x5xf32>
// CHECK:                 %[[VAL_9:.*]] = affine.load %[[VAL_4]]{{\[}}%[[VAL_5]], %[[VAL_6]], %[[VAL_7]]] : memref<3x4x5xf32>
// CHECK:                 %[[VAL_10:.*]] = addf %[[VAL_8]], %[[VAL_9]] : f32
// CHECK:                 affine.store %[[VAL_10]], %[[VAL_2]]{{\[}}%[[VAL_5]], %[[VAL_6]], %[[VAL_7]]] : memref<3x4x5xf32>
// CHECK:               }
// CHECK:             }
// CHECK:           } {affine_opt_label = "{{.*}}"}
// CHECK:           %[[VAL_11:.*]] = memref.tensor_load %[[VAL_2]] : memref<3x4x5xf32>
// CHECK:           return %[[VAL_11]] : tensor<3x4x5xf32>
// CHECK:         }

module  {
  func @task(%arg0: tensor<3x4x5xf32>, %arg1: tensor<3x4x5xf32>) -> tensor<3x4x5xf32> {
    %0 = "xten.add"(%arg0, %arg1) : (tensor<3x4x5xf32>, tensor<3x4x5xf32>) -> tensor<3x4x5xf32>
    return %0 : tensor<3x4x5xf32>
  }
}