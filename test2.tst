load Larc.hdl,

set RAM16K[0]  %X8101,   // 1.  li R1 1                
set RAM16K[1]  %X8202,   // 2.  li R2 2 
set RAM16K[2]  %XD512,   // 3.  sw 5(R1) R2     MEM[6] <-- 2  
set RAM16K[3]  %XC324,   // 4.  lw R3 4(R2)     R3     <-- MEM[6]             
set RAM16K[4]  %XF000,    // 5.  halt     
set RAM16K[5]  %X8103      //should not do this        
;
repeat 25 { tick, tock; }
