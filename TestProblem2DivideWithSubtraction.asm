; Andrea Hayes
; Test Problem 2 Divide using subtraction

INCLUDE Irvine32.inc

.stack 4096
ExitProcess proto,dwExitCode:dword

dividendMax = 1000
divisorMax = 100

.data
quotient DWORD 0
remainder DWORD 0
dividend DWORD ? 
divisor DWORD ?
dividendWord BYTE "Dividend: ",0
divisorWord BYTE "Divisor: ", 0
quotientWord BYTE "Quotient: ",0
remainderWord BYTE "Remainder: ",0

.code

main PROC

	call Clrscr
	call Randomize 

	;generate a random number for dividend
	mov eax, dividendMax
	call RandomRange
	mov dividend, eax

	;generate a random number for divisor
	mov eax, divisorMax
	call RandomRange
	mov divisor, eax

	;remainder = dividend
	mov eax, dividend
	mov remainder, eax 

	beginwhile:

		;see if the dividend is greater than the divisor
		mov eax, remainder
		cmp eax, divisor
		jl endwhile

		;subtract the divisor from the dividend. dividend=dividend-divisor
		sub eax, divisor
		mov remainder, eax
	
		;add one to the quotient
		inc quotient

		;start the loop again
		jmp beginwhile

	endwhile:

	;display dividend, divisor, quotient and remainder
	mov edx, OFFSET dividendWord
	call WriteString
	mov eax, dividend
	call WriteDec
	call crlf
	
	mov edx, OFFSET divisorWord
	call WriteString
	mov eax, divisor
	call WriteDec
	call crlf

	mov edx, OFFSET quotientWord
	call WriteString
	mov eax, quotient
	call WriteDec
	call crlf

	mov edx, OFFSET remainderWord
	call WriteString
	mov eax, remainder
	call WriteDec
	call crlf

	exit
main ENDP

END main