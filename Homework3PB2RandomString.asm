; Andrea Hayes
; Homework 3 Problem 2 Random String

INCLUDE Irvine32.inc

.stack 4096
;ExitProcess proto,dwExitCode:dword



.data
words BYTE L DUP(?) 
L=20
.code

main PROC
	
	call ClrScr				;Clears screen
	mov esi, OFFSET words   ;offset value of L into esi
	mov ecx,20				;set the counter to 20
	L1:
		call randomString   ;Calls function
		call Crlf			;End of line sequence
		
	LOOP L1
	
	exit
main ENDP

randomString PROC USES eax ecx esi

    mov ecx, LENGTHOF words		;put the Lengthof array into ecx, making it the counter

	L2:
		mov eax,26				;ASCII code into eax
		call RandomRange		;Generates a random integer
		add eax,65				;ASCII code into eax
		mov [esi],eax			;puts eax into esi
		call WriteChar			;Writes single character to screen
	LOOP L2

	ret
randomString ENDP
END main