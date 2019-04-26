load Larc.hdl,

// function call NOT
set RAM16K[0]  %X8AFA,    // li  R10 1111_1010 or -6(10)
set RAM16K[1]  %X9D08,    // lui R13  <address of function> >> 8  [ 2048(dec) ]
set RAM16K[2]  %XE9D0,    // jal R9 R13  (call NOT function)     R9 <-- 3
set RAM16K[3]  %X0000,    // nop  // R12 <-- 5(dec) 

// function call OR
set RAM16K[4]  %X8AFA,    // li  R10 1111_1010 or -6(10)
set RAM16K[5]  %X8B35,    // li  R11 0011_0101 or 53(dec)
set RAM16K[6]  %X9D09,    // lui R13  <address of function> >> 8  [ 2304(dec) ]
set RAM16K[7]  %XE9D0,    // jal R9 R13  (call OR function)      R9 <-- 8
set RAM16K[8]  %X0000,    // nop  // R12 <-- -1(dec) 

// function call AND
set RAM16K[9]  %X8AFA,    // li  R10 1111_1010 or -6(10)
set RAM16K[10] %X8B35,    // li  R11 0011_0101 or 53(dec)
set RAM16K[11] %X9D0A,    // lui R13  <address of function> >> 8  [ 2560(dec) ]
set RAM16K[12] %XE9D0,    // jal R9 R13  (call AND function)     R9 <-- 13
set RAM16K[13] %X0000,    // nop  // R12 <-- 48(dec) 

// function call MULT
set RAM16K[14] %X8A10,    // li  R10 16(dec)
set RAM16K[15] %X8B0D,    // li  R11 13(dec)
set RAM16K[16] %X9D0B,    // lui R13  <address of function> >> 8  [ 2816(dec) ]
set RAM16K[17] %XE9D0,    // jal R9 R13  (call MULT function)     R9 <-- 18
set RAM16K[18] %X0000,    // nop  // R12 <-- 208(dec) 

set RAM16K[19] %XF000,    // halt

// subroutine NOT:
//       R12 <- NOT(R10)
// address %X0800 or 2048(dec)
set RAM16K[2048] %X6CAA,  // R12 <-- 5 (dec) 
set RAM16K[2049] %XE090,  // jump back to address 3

// subroutine OR:
//       R12 <- OR(R10,R11)
// address %X0900 or 2304(dec)
set RAM16K[2304] %X6CAB,  // R12 <-- NOR(R10,R11) = 0
set RAM16K[2305] %X6CCC,  // R12 <-- NOR(R12,R12) = -1(dec)
set RAM16K[2306] %XE090,  // jump back to address 8

// subroutine AND:
//        R12 <- AND(R10,R11)
// address %X0A00 or 2560(dec)
set RAM16K[2560] %X6AAA,  // R10 <-- NOR(R10,R10) = 5(dec)
set RAM16K[2561] %X6BBB,  // R11 <-- NOR(R11,R11) = -54(dec)
set RAM16K[2562] %X6CAB,  // R12 <-- NOR(R10,R11) = 48
set RAM16K[2563] %XE090,  // jump back to address 13

// subroutine MULT:
//        R12 <- MULT(R10,R11)
// address %X0B00 or 2816(dec)
set RAM16K[2816] %X8C00,
set RAM16K[2817] %X8F00,
set RAM16K[2818] %X8E01,
set RAM16K[2819] %X6EEE,
set RAM16K[2820] %X6BBB,
set RAM16K[2821] %X6DEB,
set RAM16K[2822] %X6EEE,
set RAM16K[2823] %X6BBB,
set RAM16K[2824] %XA01D,
set RAM16K[2825] %X0CCA,
set RAM16K[2826] %X0AAA,
set RAM16K[2827] %X0EEE,
set RAM16K[2828] %X8D01,
set RAM16K[2829] %X0FFD,
set RAM16K[2830] %X8D10,
set RAM16K[2831] %X1DFD,
set RAM16K[2832] %XBF2D,
set RAM16K[2833] %XE090
;

repeat 1200 { tick, tock; }
