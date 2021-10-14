; Andrea Hayes
; Homework 4 Problem 1 Calculate Grade

INCLUDE Irvine32.inc

.stack 4096
ExitProcess proto,dwExitCode:dword

.data
gradeA BYTE "A", 0
gradeB BYTE "B", 0
gradeC BYTE "C", 0
gradeD BYTE "D", 0
gradeF BYTE "F", 0
grade BYTE ?, 0
outRange BYTE "The integer is not between 0 and 100.",0
string1 BYTE "The number grade is: ",0
string2 BYTE "The letter grade is: ",0
space BYTE " ",0

.code

main PROC

	call Randomize				;seeds the random number generator
	mov ecx, 10					;set count for 10 integers

	L1:
	mov edx, OFFSET string1		;moves string1 into edx
	call WriteString			;displays string1
	mov eax,51					;set low range
	call RandomRange			;generates integer between range
	add eax, 50					;set high range
	call WriteInt				;displays generated integer
	mov edx, OFFSET space		;moves space into edx
	call WriteString			;displays space
	mov edx, OFFSET string2     ;moves string2 into edx
	call WriteString			;displays string2
	call calcGrade				;calls the calcGrade function
	mov edx,0					;set edx to 0
	mov grade,al				;move what is in al from the calcGrade function into grade
	mov edx, OFFSET grade		;put grade into edx 
	call WriteString			;display letter grade
	call Crlf					;end of line sequence 
	LOOP L1
	
	
	exit
main ENDP

calcGrade PROC
	.IF eax >=0 && eax <=100  ;goes through if and else if statements for various grades
		.IF eax >=90 
			mov al,gradeA
		.ELSEIF eax >=80
			mov al,gradeB
		.ELSEIF eax >=70
			mov al,gradeC
		.ELSEIF eax >=60
			mov al,gradeD
		.ELSE
			mov al,gradeF
		.ENDIF

		.ELSE
		mov edx,OFFSET outRange		;included incase random range is not used
		call WriteString
		call Crlf
		.ENDIF
	
	ret
calcGrade ENDP
END main