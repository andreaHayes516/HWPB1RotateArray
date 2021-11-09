; Andrea Hayes
; Test Problem 1 Sum of Random Numbers

INCLUDE Irvine32.inc

.stack 4096
ExitProcess proto,dwExitCode:dword
lowRange=10
upperRange=90

.data
orn DWORD ? ;original random number
rNum1 DWORD ?
rNum2 DWORD ?
sum DWORD ?
string1 BYTE "Original Random Number: ",0
string2 BYTE "Guess Attempt for ", 0
arrow BYTE " -> ", 0
plusSign BYTE " + ",0
equalSign BYTE " = ",0

.code

main PROC

	call Clrscr
	call Randomize 

	;generate a random number between 10 and 99 and put in orn
	mov edx, OFFSET string1
	call WriteString
	
	mov eax, upperRange
	call RandomRange
	add eax, lowRange
	mov orn, eax 

	call WriteDec
	call crlf
    
	beginwhile:
		 
		mov edx, OFFSET string2
		call WriteString

		;mov edx, OFFSET string1
		;call WriteString
		mov eax, orn
		call WriteDec

		mov edx, OFFSET arrow
		call WriteString

		;generate a random number between 10 and 99 and put in rNum1
		mov eax, upperRange
		call RandomRange
		add eax, lowRange
		mov rNum1, eax 
		call WriteDec

		;generate a random number between 10 and 99 and put in rNum2
		mov edx, OFFSET plusSign
		call WriteString
		mov eax, upperRange
		call RandomRange
		add eax, lowRange
		mov rNum2, eax 
		call WriteDec

		mov edx, OFFSET equalSign
		call WriteString

		;add rNum1 and rNum2
		mov eax, rNum1
		add eax, rNum2
		mov sum, eax
		call WriteDec

		call crlf

		;see if sum = orn, if yes end while loop
		cmp eax, orn
		je endwhile 

		;if not try again
		jmp beginwhile

	endwhile:

	exit
main ENDP

END main