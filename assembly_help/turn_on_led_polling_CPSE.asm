;
; turn ON/OFF an LED depending on the status of a pushbutton
; this method uses CPSE (compare, skip if equal)
; 
; WRITTEN: 05/22/2024
; AUTHOR : Alyssa J. Pasquale, Ph.D.
;
; I/O pins
; D8: LED
; D7: pushbutton (external pull-down)

SBI DDRB, 0	; configure D8 as an output pin

; loop subroutine starts here
loop:
	; start by turning the LED off
	CBI PORTB, 0

	; input data from the PIND register
	IN r16, PIND
	; mask data from the PIND register
	ANDI r16, 0x80

	; load zero to a GP register
	LDI r17, 0x00
	; compare r16 (masked data from PIND) to 0x00
	CPSE r16, r17
	SBI PORTB, 0	; this instruction is skipped if r16 = r17

	; we are now done and can repeat the loop
	JMP loop