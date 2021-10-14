;Andrea Hayes
; defines symbolic names for several string literals (characters between quotes). 

INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4096

ExitProcess proto,dwExitCode:dword
;string1 TEXTEQU <"Programming is great">
;string2 TEXTEQU <"I love programming so much">
;string3 TEXTEQU <"I also love my dog">
;string4 TEXTEQU <"I love my cat more, she has extra toes">

.data
prompt1  BYTE "Words and stuff",0
;prompt2  BYTE string2
;prompt3  BYTE string3
;prompt4  BYTE string4

.code
main proc

		mov edx, OFFSET prompt1
		call WriteString 

	invoke ExitProcess,0
main endp
end main