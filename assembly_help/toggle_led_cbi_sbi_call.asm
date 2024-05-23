;
; this code toggles an LED ON and OFF at regular intervals
; using SBI and CBI commands and a CALL to a delay
;
; WRITTEN: 05/22/2024 19:21:42
; AUTHOR : Alyssa J. Pasquale, Ph.D.
;
; I/O pins
; D8: LED


; LED needs to be an output pin
SBI DDRB, 0

loop:
	; turn off LED, wait 250 ms
	CBI PORTB, 0
	CALL delay250

	; turn on LED, wait 250 ms
	SBI PORTB, 0
	CALL delay250

	JMP loop

delay250:
	ldi  r18, 21
	ldi  r19, 75
	ldi  r20, 191
L1:     dec  r20
	brne L1
	dec  r19
	brne L1
	dec  r18
	brne L1
	nop

  	RET
