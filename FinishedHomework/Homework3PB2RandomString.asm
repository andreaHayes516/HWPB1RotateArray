; Andrea Hayes
; Homework 3 Problem 2 Random String

INCLUDE Irvine32.inc

.stack 4096
;ExitProcess proto,dwExitCode:dword

alphaSize = 26
asciiA = 65
L = 20
N = 10

.data
words BYTE L DUP(?) 

.code

main PROC
	
	call ClrScr				;Clears screen
	mov esi, OFFSET words   ;offset value of L into esi
	mov ecx,N			;set the counter to 20
	L1:
		push ecx
		mov ecx,L
		call randomString   ;Calls function
		mov edx, OFFSET words
		call WriteString
		call Crlf			;End of line sequence
		pop ecx
	LOOP L1
	
	exit
main ENDP

randomString PROC USES eax ecx esi

    mov edx,0

	L2:
		mov eax,alphaSize			
		call RandomRange		;Generates a random integer
		add eax,asciiA				

		mov [esi + edx * TYPE words],eax			
		inc edx

	LOOP L2
	

	ret
randomString ENDP
END main