;
; this code toggles an LED on and OFF at regular intervals
; using EOR commands in the TIMER1_COMPA interrupt
;
; WRITTEN: 05/22/2024 19:40:54
; AUTHOR : Alyssa J. Pasquale, Ph.D.
;
; I/O pins
; D8: LED

.org 0x0000
	RJMP setup
.org 0x0016
	RJMP TIMER1_COMPA

setup:
	; LED should be an output pin
	SBI DDRB, 0

	; it is not optional to use CLI and SEI here... if this is interrupted, bad things happen
	CLI
	; configure timer/counter 1 in CTC mode, N = 64
	LDI r16, 0x00
	STS TCCR1A, r16
	LDI r16, 0x0B
	STS TCCR1B, r16
	LDI r16, 0x02
	STS TIMSK1, r16
	; OCR1A = 0xF423, write HIGH byte before LOW byte
	LDI r16, 0xF4
	STS OCR1AH, r16
	LDI r16, 0x23
	STS OCR1AL, r16
	SEI

loop:
	JMP loop

TIMER1_COMPA:
	; it's always good practice to save SREG
	IN r15, SREG

	; load data from PORTB
	IN r17, PORTB
	LDI r18, 0x01
	; exclusive OR with 0x01
	EOR r17, r18
	; put back into PORTB
	OUT PORTB, r17

	; restore SREG
	OUT SREG, r15
	RETI