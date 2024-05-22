;
; turn ON/OFF an LED depending on the status of a pushbutton
; this method uses external interrupt INT0 and CPSE (compare, skip if equal)
;
; WRITTEN: 05/22/2024 18:37:05
; AUTHOR : Alyssa J. Pasquale, Ph.D.
;
; I/O pins
; D8: LED
; D2: pushbutton (external pull-down)


; tell the MCU locations of each interrupt vector
.org 0x0000
	RJMP setup
.org 0x0002
	RJMP EXT_INT0

setup:
	SBI DDRB, 0 ; LED pin should be an output

	; configure INT0 with toggle trigger
	CLI
	LDI r17, 0x01
	OUT EIMSK, r17	; this is an I/O register so you can use OUT
	STS EICRA, r17	; this is an extended I/O register so you must use STS
	SEI

loop:
	JMP loop


EXT_INT0:
	; even though the loop is empty, it's good practice to save SREG
	IN r15, SREG

	; start by turning off the LED
	CBI PORTB, 0

	; load data from PIND
	IN r16, PIND
	ANDI r16, 0x04

	; load zero into a GP register
	LDI r17, 0x00

	; compare r16 and r17, skip next instruction if they are equal
	CPSE r16, r17
	SBI PORTB, 0

	; restore SREG
	OUT SREG, r15

	RETI
