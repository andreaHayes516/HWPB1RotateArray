
; Andrea Hayes
; Homework 3 Problem 1 Rotate Array Left

INCLUDE Irvine32.inc

.386
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

arrayA DWORD 1,2,3,4,5

.code

main PROC

	mov esi,OFFSET arrayA   ;put first element in esi
	mov ecx,LENGTHOF arrayA ;set loop count,which is the array size, into ecx
	call rotateLeft         ;calls the function
	
	exit
main ENDP

rotateLeft PROC
	
	mov edx, 0               ;set i=0
	dec ecx					 ;subtract 1 from size of array

L1:
	
	;swap(i,i+1)
	;first element + i * data type size
	mov ebx,[esi+edx * TYPE arrayA] ;temp=array[i]
	mov eax, edx 
	inc eax
	mov ebp, [esi+eax * TYPE arrayA] ;temp2=array[i+1]
	mov [esi+edx * TYPE arrayA],ebp ;array[i]=temp
	mov [esi+eax * TYPE arrayA],ebx ;array[i+1]=temp2
	;i++
	inc edx
	;jmp L1
	loop L1

	ret
rotateLeft ENDP
END main

