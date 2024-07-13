//
// 256 x 512 starting at SCREEN, its 32 words wide
//
// while (true) {
//   *R0 = 0
//
//   while (*R0 < 32) {
//     if (*KBD != 0) {
//       *R1 = -1
//     } else {
//       *R1 = 0
//     }
//     *R2 = SCREEN + R0
//     **R2 = *R1
//     *R0 = *R0 + 1
//   }
// }
//
(outer)
    // *R0 = 0
    @R0
    M=0

(inner)
    // if ((*R0 - 32) >= 0)  
    //   goto outer
    @R0
    D=M
    @8192
    D=D-A
    @outer
    D;JGE

    // if ((*KBD) == 0) 
    //   goto white
    @KBD
    D=M
    @white
    D;JEQ

    // black case, need to jump over `white`
    D=-1
    @then
    0;JMP

(white)
    // white case, fallthrough to `then`
    D=0

(then)
    // *R1 = 0 or -1 
    @R1
    M=D
    
    // *R2 = SCREEN + R0
    @SCREEN
    D=A
    @R0
    D=D+M
    @R2
    M=D
    
    // **R2 = *R1
    @R1
    D=M
    @R2
    A=M
    M=D

    // *R0 = *R0 + 1
    @R0
    M=M+1

    // goto outer
    @inner
    0;JMP
    


