;
; this code toggles an LED ON and OFF at regular intervals
; using EOR commands and a CALL to a delay
;
; WRITTEN: 05/22/2024 19:21:42
; AUTHOR : Alyssa J. Pasquale, Ph.D.
;
; I/O pins
; D8: LED


; LED needs to be an output pin
SBI DDRB, 0

loop:
	; load value from PORTB into GP register
	IN r16, PORTB
	; exclusive OR with 0x01
	LDI r17, 0x01
	EOR r16, r17
	; output back to PORTB
	OUT PORTB, r16

	; wait 250 ms
	CALL delay250

	JMP loop

delay250:
    ldi  r18, 21
    ldi  r19, 75
    ldi  r20, 191
L1: dec  r20
    brne L1
    dec  r19
    brne L1
    dec  r18
    brne L1
    nop

	RET