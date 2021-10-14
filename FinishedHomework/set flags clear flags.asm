; Andrea Hayes
; Status Flags

TITLE Set Flags, Clear Flags

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

R0 EQU al
;MAX EQU umaxbyte
;MIN EQU uminbyte
.data
	smaxbyte sbyte 07Fh  ; 127
	sminbyte sbyte 080h ; -128
	umaxbyte byte 0FFh   ; 255 = 127 + 128
	uminbyte byte 0
	smaxword sword 07FFFh ; 32767
	sminword sword 08000h ; -32768
	umaxword word 0FFFFh  ; 65535 = 32767 + 32768
	uminword word 0
	smaxdword sdword 07FFFFFFFh ; 2147483647
	smindword sdword 080000000h ; -2147483648
	umaxdword dword 0FFFFFFFFh  ; 4294967295 = 2147483647 + 2147483648
	umindword dword 0
.code
main proc

	; Overflow Flag
	mov R0,smaxbyte
	add R0,1		; OV = 1
	sub R0,1
	neg R0			; OV = 0

	;  Sign Flag
	mov R0,0
	sub R0,4		; PL = 1
	add R0,5		; PL = 0

	; Zero Flag
	mov R0,3
	sub R0,3		; ZF = 1
	add R0,3		; ZF = 0

	; Auxiliary Carry Flag
	mov R0,smaxbyte
	add R0,1		; AC = 1
	add R0,2		; AC = 0

	; Parity Flag
	mov R0,2
	add R0,1		; PE = 1
	sub R0,1		; PE = 0

	; Carry Flag
	mov R0,umaxbyte
	add R0,1		; CY = 1
	mov R0,smaxbyte
	add R0,1		; CY = 0

	; Clear all flags
	mov R0,0
	add R0,1

	invoke ExitProcess,0
main endp
end main