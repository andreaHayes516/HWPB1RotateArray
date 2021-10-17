; Andrea Hayes
; Homework 4 Problem 2 Sum Array

INCLUDE Irvine32.inc

.stack 4096
ExitProcess proto,dwExitCode:dword
N= 10
.data
array DWORD N DUP(?)
j DWORD ?
k DWORD ?

sayArray BYTE "Array: ", 0
saySummedArray BYTE "Summed Array: ", 0


.code

main PROC

	call Clrscr
    mov j, -50
    mov k, 50
    mov esi, OFFSET array
    mov ecx, N
    call sumArray

    mov j, 75
    mov k, 950
    mov esi, OFFSET array
    mov ecx, N
    call sumArray

    call WaitMsg
	
	exit
main ENDP

sumArray PROC USES ecx esi
	call Randomize
	mov edx, OFFSET sayArray
	call WriteString
	mov edx, 0
	
	L1:
		mov eax, j
		mov ebx, k
		inc ebx
		sub ebx, eax
		call RandomRange
		neg ebx
		sub eax, ebx
		call WriteInt
		mov [esi],eax
		add edx, [esi]
		add esi, TYPE WORD
	LOOP L1

	call crlf
	xchg edx, eax
	mov edx, OFFSET saySummedArray
	call WriteString 
	call WriteInt
	call crlf

	ret
sumArray ENDP
END main