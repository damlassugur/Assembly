;divident 000186C8H 0C to 0F
;diviset  23H 0A to 0B
ORG 0000H
START:
MOV 33h, #00H
MOV 32h, #01H
MOV 31h, #086H
MOV 30h, #0C8H

MOV 35H, #02h
MOV 34H, #03h
MOV 1AH, #0
MOV 1BH, #0

DIVID:
MOV R0,#32

LOOP:
CALL Accu_shift
MOV R1,1Ah
MOV R2,1Bh;store the old
CALL a_subm
CLR C
MOV A,1Ah
RLC A
JC clear
JNC setq
clear:
MOV A,30h
ANL A,#0FEH
MOV 30h,A
MOV 01AH,R1
MOV 01BH,R2
JMP escape
setq:
MOV A,30h
ORL A,#01H
MOV 30h,A
escape:
DJNZ R0,LOOP
here:JMP here

Accu_shift;
CLR C
MOV A,30h
RLC A
MOV 30h,A
MOV A,31h
RLC A
MOV 31h,A
MOV A,32h
RLC A
MOV 32h,A
MOV A,33h
RLC A
MOV 33h,A
MOV A,01BH
RLC A
MOV 01BH,A
MOV A,01AH
RLC A
MOV 01AH,A
RET

a_subm;
CLR C
MOV A,1BH
SUBB A,0BH
MOV 01BH,A
MOV A,1AH
SUBB A,0AH
MOV 1AH,A
RET