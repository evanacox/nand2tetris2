    @R2
    M=0
    @R3
    M=0

    //
    // R2 = output
    // R3 = counter
    //
    //   while (R3 != R1)
    //     R2 += R0
    //     R3 += 1
    //
(LOOP)
    // if ((R3 - R1) == 0), equivalent to if (R3 == R1)
    //   goto end
    @R3
    D=M
    @R1
    D=M-D
    @END
    D;JEQ

    // R2 += R0
    @R0
    D=M
    @R2
    M=D+M

    // R3 += 1
    @R3
    M=M+1 

    // goto loop
    @LOOP
    0;JMP

(END)
    @END
    0;JMP
