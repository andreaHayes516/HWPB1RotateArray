; Andrea Hayes
; Homework 5 Problem 1 Encyrtption WITH Conditional Control Flow Directives

INCLUDE Irvine32.inc

.stack 4096
ExitProcess proto, dwExitCode:dword


.data
key BYTE - 2, 4, 1, 0, -3, 5, 2 - 4, -4, 6
string1 BYTE "The body is buried in the backyard.", 0
string2 BYTE "Under the old oak tree.", 0
.code

main PROC

	call Clrscr
	; Display string
	mov edx, OFFSET string1
	call WriteString
	call crlf

	; Move string to esi
	mov esi, OFFSET string1
	mov edi, OFFSET key
	mov ecx, LENGTHOF string1
	call Encryption
	mov edx, OFFSET string1
	call WriteString
	call crlf

	; Display string
	mov edx, OFFSET string2
	call WriteString
	call crlf

	; Move string to esi
	mov esi, OFFSET string2
	mov ecx, LENGTHOF string2
	mov edi, OFFSET key
	call Encryption
	mov edx, OFFSET string2
	call WriteString


exit
main ENDP


Encryption PROC USES eax

	; mov eax, [edi]
	; call WriteInt
	; call CrLf

	; counter for loop

	; mov ebx, 0; set counter to 0

	L1:
	;push ecx
	; get nth key value modulus key length
	; mov cl, [edi]
	; movzx eax, cl
	; call WriteInt
	; call CrLf


	; get nth character
	; mov eax, [esi]
	; call WriteInt
	mov cl, [edi]
	
	.IF cl < 0
		
		rol BYTE PTR[esi], cl ; if less than zero rotate left

	.ELSEIF cl > 0
		
		ror BYTE PTR[esi], cl ; positive value so rotate string right
		
	.ELSE
		
		jmp ENDOFLOOP ; no rotation if equal to zero
	.ENDIF

	; call WriteChar
	; call crlf

	; modify nth character by key in nth position
	; write character back to nth position in string
	

	inc esi
	inc edi

	pop ecx
	ENDOFLOOP:

	LOOP L1


ret
Encryption ENDP

END main
