ORG 0000H
		JMP MAIN
		
		ORG 001BH
		JMP ISR_T1
		
		ORG 0030H
MAIN:	MOV TMOD, #10H
		MOV R0, #0B6H
		MOV R3, #0B3H
		mov r5, #0ffh
		MOV TL1, R0
		MOV TH1, R3
		MOV R1, #00H
		MOV R4, #00H
		MOV IE, #88H
		SETB TR1
BACK:	
		SJMP BACK
		
		
ISR_T1:	CLR TR1
		CLR P1.0
		cjne r7, #001h, HERE
		jmp down
HERE:	DJNZ R2, HERE
		mov a, r4
		jz out
AGAIN:
inloop: djnz r5, inloop
		DJNZ R6, AGAIN	
		mov r5, #0ffh
out:		SETB P1.0
		MOV A, R0
		CLR C
		add A, #076
		MOV R0, A
		MOV A, R3
		addc A, #00H
		MOV R3, A
		
		MOV A, R1
		ADD A, #076
		MOV R1, A
		mov r2, a
		MOV A, R4
		ADDC A, #00H
		MOV R4, A
		mov r6, a
		MOV TL1, R0
		MOV TH1, R3
		mov a, r3
		subb a, #0ffh
		jz switch
back1:		SETB TR1
		jmp finish
		
switch: mov a, r0
		subb a, #0ffh
		jnz back1
		mov r7, #001h
		jmp back1

down:
		cjne r7, #000h, HERE1
		jmp HERE
HERE1:	DJNZ R2, HERE1
		mov a, r4
		jz out2
AGAIN1:
inloop1: djnz r5, inloop1
		DJNZ R6, AGAIN1
		mov r5, #0ffh
out2:		SETB P1.0
		MOV A, R0
		CLR C
		subb A, #076
		MOV R0, A
		MOV A, R3
		subb A, #00H
		MOV R3, A
		
		MOV A, R1
		subb A, #076
		MOV R1, A
		mov r2, a
		MOV A, R4
		subb A, #00H
		MOV R4, A
		mov r6, a
		MOV TL1, R0
		MOV TH1, R3
		mov a, r3
		subb a, #0b3h
		jz switch2
back2:		SETB TR1
		jmp finish

switch2: mov a, r0
		 subb a, #0b6h
		 jnz back2
		 mov r7, #000H
		 jmp back2
		 
finish:		RETI
		END





