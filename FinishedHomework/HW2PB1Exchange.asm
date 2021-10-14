; Andrea Hayes
; exchanges the contents of two 32-bit variables.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
a dword 5
b dword 6

.code
main proc
	
	mov eax,a
	xchg eax,b
	mov a,eax
	

	invoke ExitProcess,0
main endp
end main