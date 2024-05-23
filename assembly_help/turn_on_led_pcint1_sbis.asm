;
; turn ON/OFF an LED depending on the status of a pushbutton
; this method uses pin-change interrupt PCINT1 and SBIS (skip if bit in I/O register is set)
;
; WRITTEN: 05/22/2024 19:15
; AUTHOR : Alyssa J. Pasquale, Ph.D.
;
; I/O pins
; D8: LED
; A5: pushbutton (internal pull-up)


; tell the MCU locations of each interrupt vector
.org 0x0000
	RJMP setup
.org 0x0008
	RJMP EXT_PCINT1

setup:
	SBI DDRB, 0		; LED pin should be an output
	SBI PORTC, 5	; enable internal pull-up on A5

	; configure PCINT1 on pin A5
	CLI
	LDI r17, 0x02
	STS PCICR, r17
	LDI r17, 0x20
	STS PCMSK1, r17
	SEI

loop:
	JMP loop


EXT_PCINT1:
	; even though the loop is empty, it's good practice to save SREG
	IN r15, SREG

	; start by turning off the LED
	CBI PORTB, 0

	; skip the following instruction if A5 is set (opposite logic due to internal pull-up)
	SBIS PINC, 5
	SBI PORTB, 0

	; restore SREG
	OUT SREG, r15

	RETI