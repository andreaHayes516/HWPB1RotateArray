; Andrea Hayes
; Homework 3 Problem 1 Rotate Array Left

INCLUDE Irvine32.inc

arrayOffset TEXTEQU	<esi>
arrayLength TEXTEQU <ecx>
temp TEXTEQU <ebx>
temp2 TEXTEQU	<ebp>
i TEXTEQU	<edx>
iPlusOne TEXTEQU	<eax>

.data

arrayA DWORD 1,2,3,4,5
comma BYTE ", ",0

.code

main PROC

	mov arrayOffset, OFFSET arrayA ;put first element in esi  
	mov arrayLength, LENGTHOF arrayA ;set loop count,which is the array size, into ecx
	cld							

	L1:
		lodsd					
		call WriteInt			
		mov i, OFFSET comma
		call Writestring		
		loop L1

	call Crlf

	mov arrayOffset, OFFSET arrayA ;put first element in esi  
	mov arrayLength, LENGTHOF arrayA ;set loop count,which is the array size, into ecx
	cld			
	call rotateLeft         

	mov arrayOffset, OFFSET arrayA ;put first element in esi  
	mov arrayLength, LENGTHOF arrayA ;set loop count,which is the array size, into ecx
	cld							
	
	L2:
		lodsd					
		call WriteInt			
		mov i, OFFSET comma
		call Writestring		
		loop L2
	exit
main ENDP

rotateLeft PROC USES arrayOffset arrayLength

	mov i, 0               
	dec arrayLength					 


L3:

	mov temp, [arrayOffset + i * TYPE arrayA] ;temp=array[i]
	mov iPlusOne, i 
	inc iPlusOne
	mov temp2, [arrayOffset + iPlusOne * TYPE arrayA] ;temp2=array[i+1]
	mov [arrayOffset + i * TYPE arrayA], temp2 ;array[i]=temp
	mov [arrayOffset + iPlusOne * TYPE arrayA], temp ;array[i+1]=temp2
	;i++
	inc i
	;jmp L3
	loop L3

	ret
rotateLeft ENDP
END main