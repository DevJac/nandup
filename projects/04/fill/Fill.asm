// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(BEGIN)
  @24576
  D=M
  @NOT_PRESSED
  D;JEQ
  @PRESSED
  0;JMP
(NOT_PRESSED)
  @R0
  M=0
  @APPLY_R0
  0;JMP
(PRESSED)
  @R0
  M=-1
  @APPLY_R0
  0;JMP
(APPLY_R0)
  @8192
  D=A
  @R1
  M=D
  @16384
  D=A
  @R2
  M=D
(LOOP_APPLY_R0)
  @R0
  D=M
  @R2
  A=M
  M=D
  @R2
  M=M+1
  @R1
  MD=M-1
  @LOOP_APPLY_R0
  D;JGT
  @BEGIN
  0;JMP
