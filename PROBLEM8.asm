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
	XOR ax, ax		; Initialize Ax to 0
	XOR bx, bx		; Initialize Bx to 0
	XOR cx, cx		; Initialize Cx to 0
	
CALC:
	MOV al, [STRING + bx]	; Move in char from string
	CMP al, 0		; See if it is the null char
	JE FINISH		; If so, exit (end of string)
	CMP [KEY], al		; Compare with provided key
	JE INCREMENT		; If equal to key
	JMP PROCEED		; If not equal to key

PROCEED: 
	INC bx			; Increment the offset
	JMP CALC		; Jump back to CALC
	
INCREMENT:
	INC cx			; Increment counter 
	INC bx			; Increment the offset
	JMP CALC		; Jump back to CALC
FINISH:
	MOV [0x154], cx		; Copy result of counter into 0x154
	
	

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