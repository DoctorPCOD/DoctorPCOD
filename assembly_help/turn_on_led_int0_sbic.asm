;
; turn ON/OFF an LED depending on the status of a pushbutton
; this method uses external interrupt INT0 and SBIC (skip if bit in I/O register is clear)
;
; WRITTEN: 05/22/2024 19:01:42
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

	; skip the following instruction if D2 is clear
	SBIC PIND, 2
	SBI PORTB, 0

	; restore SREG
	OUT SREG, r15

	RETI