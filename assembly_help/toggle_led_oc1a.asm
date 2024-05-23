;
; this code toggles an LED on and OFF at regular intervals
; using EOR commands in the TIMER1_COMPA interrupt
;
; WRITTEN: 05/22/2024 19:40:54
; AUTHOR : Alyssa J. Pasquale, Ph.D.
;
; I/O pins
; D9: LED


setup:
	; it is not optional to use CLI and SEI here... if this is interrupted, bad things happen
	CLI
	; configure timer/counter 1 in CTC mode, N = 64
	LDI r16, 0x40
	STS TCCR1A, r16
	LDI r16, 0x0B
	STS TCCR1B, r16
	; OCR1A = 0xF423, write HIGH byte before LOW byte
	LDI r16, 0xF4
	STS OCR1AH, r16
	LDI r16, 0x23
	STS OCR1AL, r16
	SEI

	; OC1A should be an output pin
	; as per data sheet, this should occur after configuring the timer/counter unit
	SBI DDRB, 1

loop:
	JMP loop