; Andrea Hayes
; Homework 4 Problem 2 Sum Array

INCLUDE Irvine32.inc

.stack 4096
ExitProcess proto,dwExitCode:dword

N= 10
j TEXTEQU <ebx>
k TEXTEQU <edx>

.data
array DWORD 10,20,30,40,50,60,70,80,90,100

plus BYTE "+",0
equals BYTE " = ",0

.code

main PROC

	call Clrscr

    mov esi, OFFSET array

    ;sum elements 5 through 9
    ;60+70+80+90+100=400
    mov j, 5
    mov k, 9
    call sumArray
    
   ;sum elements 0 through 5
   ;10+20+30+40+50+60=210

    mov j, 0
    mov k, 5
    mov ecx, N
    call sumArray

    ;j>k no valid response, return 0
    mov j, 9
    mov k, 7
    call sumArray

    ;j>=N no valid response, return 0
    mov j, 10
    mov k, 12
    call sumArray

    ;j=k=7  80
    mov j, 7
    mov k, 7
    call sumArray
   
    call WaitMsg
	
	exit
main ENDP

sumArray PROC USES ecx esi edx

    ;setup return value
	mov eax, 0
    
    ;check j is less than array length
    mov ecx, j
    cmp ecx, N
    jge RETURN
   
    ;set pointer the jth element
    mov ecx, j
    L1:
        add esi, TYPE DWORD
    LOOP L1

    ;set ecx to the difference of k and j
    mov ecx, k
    sub ecx, j
    add ecx, 1

    ;check k is more than j
   cmp ecx, 1
   jnge RETURN

    L2:
		push eax
		mov eax, [esi]
		call WriteInt
		pop eax

		push edx
		mov edx,OFFSET plus
		call WriteString
		pop edx

		; add the current value to the return
		add eax, [esi]
		; move to next value in array
		add esi, TYPE DWORD
        
	LOOP L2

    RETURN: 

	push edx
	mov edx, OFFSET equals
	call WriteString
	pop edx

	call WriteInt
	call CrLf

	ret
sumArray ENDP
END main