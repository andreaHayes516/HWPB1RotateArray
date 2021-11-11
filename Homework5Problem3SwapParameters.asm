; Andrea Hayes
; Homework 5 Problem 3 Swap Parameters

INCLUDE Irvine32.inc

.stack 4096
ExitProcess proto, dwExitCode:dword

N=10

.data
array DWORD N DUP(?)

.code

main PROC

	call Clrscr
	mov esi, OFFSET array
	mov ecx, N
	mov ebx, -20
	mov edx, 30
	call Randomize
	add edx, 1
	L1: 
	mov eax, edx
	sub eax, ebx
	call RandomRange
	add eax, ebx
	mov [esi],eax
	add esi, 4
	
	mov eax, [esi]
	call WriteInt
	call crlf
	add esi, 4

	LOOP L1
	


exit
main ENDP


;Swap PROC USES 

   ;swap(a, b)
   ;temp := a
   ;a = b
   ;b := temp
   ;end swap

   ;mov esi, OFFSET arrayA ;a=esi
   ;mov ebx, OFFSET arrayB ;b=ebx
   ;mov edi, esi ;temp=edi =a, 
   ;mov esi, ebx ;a=b
   ;mov ebx, edi ;b=temp

	


;ret
;Swap ENDP

END main
