; Andrea Hayes
; Homework 5 Problem 2 Encyrtption WITHOUT Conditional Control Flow Directives

INCLUDE Irvine32.inc

.stack 4096
ExitProcess proto, dwExitCode:dword


.data
key BYTE -2, 4, 1, 0, -3, 5, 2 -4, -4, 6
string1 BYTE "The body is buried in the backyard.",0

.code

main PROC

	call Clrscr
	;Display string 
	mov edx, OFFSET string1
	call WriteString
	call crlf
	;Move string to esi
	mov esi, OFFSET string1

;L1: 
	;put length of key in ecx
	;mov ecx, LENGTHOF key
	;put key in edi 
	;mov edi, OFFSET key 
	;call encryption procedure and jump if not 0
	;call Encryption
	;jnz L1

	;display new string
	;mov edx, OFFSET string1
	;call WriteString
	;call crlf

;LOOP L1

exit
main ENDP


Encryption PROC USES edx, esi, edi

L1:		
	push ecx
	;compare first element of string to 0
	cmp BYTE PTR[esi],0 
	;jump if equal to L4?
	je L4

	;put first element of edi in cl and compare to 0
	mov cl, [edi]
	cmp cl, 0
	;jump to L2 if greater than or equal to 0
	jge L2
	;rotate string left if not, then jump to loop 3
	rol BYTE PTR[esi],cl
	jmp L3

L2: 
	;rotate string right
	ror BYTE PTR [esi], cl

L3: 
	inc esi
	inc edi
	pop ecx

LOOP L1

ret
Encryption ENDP



