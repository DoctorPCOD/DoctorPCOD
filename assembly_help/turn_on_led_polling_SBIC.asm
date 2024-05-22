;
; turn ON/OFF an LED depending on the status of a pushbutton
; this method uses SBIC (skip if bit in I/O register is cleared)
;
; WRITTEN: 05/22/2024 18:17:31
; AUTHOR : Alyssa
;
; I/O pins
; D8: LED
; D7: pushbutton (external pull-down)


; LED pin as output
SBI DDRB, 0

loop:
	; start by turning off the LED
	CBI PORTB, 0

	; conditional logic to possibly turn on the LED
	SBIC PIND, 7	; this will check the status of D7 and skip the following line if it is 0
	SBI PORTB, 0	; this turns on the LED, but only if bit 7 in PIND is set

	JMP loop