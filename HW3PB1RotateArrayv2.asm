; Andrea Hayes
; Homework 3 Problem 1 Rotate Array Left

INCLUDE Irvine32.inc

;.386
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

arrayA DWORD 1,2,3,4,5
comma BYTE ", ",0
register TEXTEQU	<eax>

.code

main PROC

	mov esi, OFFSET arrayA   ;put first element in esi
	mov ecx, LENGTHOF arrayA ;set loop count,which is the array size, into ecx
	cld							; clear direction flag

	L1:
		lodsd					;loads [esi] into eax
		call WriteInt			; send eax to output
		mov edx, OFFSET comma
		call Writestring		; display comma
		loop L1

	call Crlf

	call rotateLeft         ;calls the rotateLeft function

	mov esi, OFFSET arrayA   ;put first element in esi
	mov ecx, LENGTHOF arrayA ;set loop count,which is the array size, into ecx
	cld							;clear direction flag
	
	L2:
		lodsd					;loads [esi] into eax
		call WriteInt			;send to output
		mov edx, OFFSET comma
		call Writestring		;display comma
		loop L2
	exit
main ENDP

rotateLeft PROC

	mov esi, OFFSET arrayA   ;put first element in esi
	mov ecx, LENGTHOF arrayA ;set loop count,which is the array size, into ecx
	mov edx, 0               ;set i=0
	dec ecx					 ;subtract 1 from size of array


L3:
	
	;swap(i,i+1)
	;first element + i * data type size
	mov ebx, [esi + edx * TYPE arrayA] ;temp=array[i]
	mov register, edx 
	inc register
	mov ebp, [esi + register * TYPE arrayA] ;temp2=array[i+1]
	mov [esi + edx * TYPE arrayA], ebp ;array[i]=temp
	mov [esi + register * TYPE arrayA], ebx ;array[i+1]=temp2
	;i++
	inc edx
	;jmp L3
	loop L3

	ret
rotateLeft ENDP
END main

