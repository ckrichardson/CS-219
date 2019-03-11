; COUNT
; D. Egbert, Clifford Richardson ver 1.0 2/26/2018
;
org 100h
section .text
; beginning address of code = 0x0100
;*******************************************************
;
; put your code here
;
start:
	XOR ax, ax
	XOR bx, bx
	XOR cx, cx
	
CALC:
	MOV al, [STRING + bx]
	CMP al, 0
	JE FINISH
	CMP [KEY], al
	JE INCREMENT
	JMP PROCEED

PROCEED: 
	INC bx
	JMP CALC
	
INCREMENT:
	INC cx
	INC bx
	JMP CALC
FINISH:
	MOV [0x154], cx
	
	

; end of your code
;		
;*******************************************************		
ILP:	JMP	ILP				;infinite loop
;
TIMES 50H -($-$$) DB 0
section .data
; beginning address of data = 0x0150
;*******************************************************
;
; put your data items here
KEY: db 0x68, 0, 0, 0
COUNT: db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
STRING:  db 0x65, 0x66, 0x67, 0x68, 0x68, 0x68, 0x00
;
; end of your data
;
;*******************************************************