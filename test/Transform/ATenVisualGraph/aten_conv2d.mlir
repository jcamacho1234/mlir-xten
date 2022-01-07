//===- aten_conv2d.mlir --------------------------------*- MLIR -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// (c) Copyright 2021 Xilinx Inc.
//
//===----------------------------------------------------------------------===//

// RUN: aten-opt %s -aten-visual-graph='operators-supported-path=%S/../../../lib/Transform/operators_supported.json' | FileCheck %s
// CHECK-LABEL:     "{{.*}}": {
// CHECK-LABEL:     "name": "conv2d0",
// CHECK-LABEL:     "name": "torch.aten.conv2d",
//

module attributes {torch.debug_module_name = "model"}  {
  func @forward(%arg0: !torch.vtensor<[1,2,128,128],f32>) -> !torch.vtensor<[?,?,?,?],f32> {
    %int1 = torch.constant.int 1
    %0 = torch.vtensor.literal(dense<"0x8A2B6ABD11D893BC06D1B53DAEF03EBE093D45BEC1245E3EA2E3A93DF6F2DC3D696ED0BD8AB594BD0FB2423E0823FABD0152823BEB27B9BDFE25ED3D70ED343EAF9E5E3DC0F49ABDCC3F21BEB401323D7B1D0CBE925D253DA8F4493E987549BEA906093EF31C43BE492EADBD99BD293DC02AA7BDCE9BD3BD36E531BE7B56493E8433053BB490E4BDD8FFE7BD536A8EBDB70C583E1BB3CABD1700C33B494F8BBCF80B003DEED81ABEE03B37BD6E9B233E04584B3E228F513D72ADAD3D5B1AB6BD47B25DBB11DE38BE5647E13C80ED2BBE0B0630BE38D5893DCBFA5A3E2B4255BEC97E013DD0AC493E6FFDFEBD04560FBE61EBE63D033BAC3DA7412CBDEAD3453E9FB359BED43C323E3A87963DB538263E079F083E9EE404BEE18071BD96CF5B3EFCABC83D24242C3E30871FBE934D143E159E27BEB0B72FBEA4BC4CBB1DC8D93D8916C13BDD2091BCC85996BDC2023ABEB3AAE93D889119BE2B12B0BCF0ACE8BD89E2063ED5C25C3EC89C473E310AC93DD3F162BE47534EBE61CCBA3D9140C93CD029023E050C143E1A2FEF3D8B45973D08AA0F3E9072F1394E57123E96A37F3D8606AD3C20F5893DF6EDDABD3924F23DB011D53D096D32BDDED968BEBAA35C3E20BD483EAB275C3EFA11EF3D334ADD3D1D6934BE5113BE3C467259BE953227BE05B4EDBC1BC618BD557C7ABC30F4623E113506BE0E0380BDDB5E8CBDB23F3D3E72153ABEF16CB73DBAD4863D2FFD4BBE8A53BB3D57AC1E3DF46D073E6EAFAABB6DB7413E8F6DAEBB91ECE338392323BEF0866CBD8571EC3C12E11ABD9A1F3ABEF8CC473EECD313BE2364503E1DCA68BE32EEF53BBEEE6C3EE6A836BE7DD204BEE306003EE51D5ABEF345453D3D5CA93D4CB3FABDACB5D33D15FE05BEFCA1383E09FB48BE2FAE0A3C9C61513D52B56C3EED6A1B3D432E413EB05E4DBC6088163C7482F7BDBF4B42BDB3635A3E9EEAFDBD6EF453BEA14B84BD51C60FBE790E0ABE4099243E370FECBD94EA023E3B8B67BCCCB1E73D7AD13DBE8D97163D813BF63D5778E5BD4330B5BDF04A27BEDDB75EBE31D355BEFB8069BDB73556BEECB521BC6FF01BBE3198013E9E5C463EF02E453D077A20BEDC984ABE417A613E7FD3033E1F04893DB7B92FBEB157B93D0FC4ECBDA82C153E343E693E092A23BDC4690C3E33751F3E9ACCACBDC6FA62BE007C803DA10C593D668B5FBEF8FDD7BD3D8CEBBDAA5D103ECFC144BE8DF0D9BC296C2EBE33BC0DBE15BE4BBE7583C03C51983F3DF4DF613D1CAB11BE2A932DBE95F59EBCDF5E47BE18000D3DEA5F333E20BBCCBDB15E6B3E1B91443D9E2E513ECFEF723C8447A53DD5775F3EEE5452BE571463BDF58D87BDDDF6083D865170BE19295A3E0929323E71E0083AEE4F4BBE389F283DC5AC07BE48A62EBEC6E4B2BD64872FBEAD8423BE86C644BC5147A73DC0B0863DBAB64F3D46E102BE540A28BEDE0CA43D3A6EB73D834908BE356765BE058C64BEA3D2D4BD6E06503E18A0C63D95FE5B3EEC924CBE14DBCDBCE6A7653E3566DFBDD9DF2FBD50BA8D3DE081A83D7AE8A83D29BA273E5D5E54BE1DFA14BE166A00BEBF0D0C3E1BDB493EB1AC673EC1BD00BEF62A48BE32E7BD3DD9F2DEBD842654BB"> : tensor<16x2x3x3xf32>) : !torch.vtensor<[16,2,3,3],f32>
    %1 = torch.vtensor.literal(dense<[0.132059276, -0.0918224751, -0.118777044, 0.0645219385, 0.134561762, -0.04097775, 0.182373062, -0.113158949, -0.0643238425, -0.0199289974, -0.073821865, -0.202036336, 0.149756551, -0.202734962, 0.169865787, -0.135248795]> : tensor<16xf32>) : !torch.vtensor<[16],f32>
    %2 = torch.prim.ListConstruct %int1, %int1 : (!torch.int, !torch.int) -> !torch.list<!torch.int>
    %3 = torch.prim.ListConstruct %int1, %int1 : (!torch.int, !torch.int) -> !torch.list<!torch.int>
    %4 = torch.prim.ListConstruct %int1, %int1 : (!torch.int, !torch.int) -> !torch.list<!torch.int>
    %5 = torch.aten.conv2d %arg0, %0, %1, %2, %3, %4, %int1 {layer_name = "conv2d0"} : !torch.vtensor<[1,2,128,128],f32>, !torch.vtensor<[16,2,3,3],f32>, !torch.vtensor<[16],f32>, !torch.list<!torch.int>, !torch.list<!torch.int>, !torch.list<!torch.int>, !torch.int -> !torch.vtensor<[?,?,?,?],f32>
    return %5 : !torch.vtensor<[?,?,?,?],f32>
  }
}
