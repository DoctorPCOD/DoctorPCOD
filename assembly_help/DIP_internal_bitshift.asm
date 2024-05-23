;
; this code sends data from a DIP switch with internal pull-ups to a BCD to 7-segment display PCB
; any value greater than 9 will blank the display out
; bitshift operations are used to move the data from port b into the correct position to output onto port d
;
; Created: 05/22/2024 20:41
; Author : Alyssa J. Pasquale, Ph.D.
;
; I/O pins
; D11: DIP MSB	; internal pull-ups!
; D10: DIP
; D9:  DIP
; D8:  DIP LSB
; D7:  D on 7447 (MSB)
; D6:  C
; D5:  B
; D4:  A on 7447 (LSB)


; configure D-A on 7447 as output pins
LDI r16, 0xF0
OUT DDRD, r16

; enable internal pull-ups on pins D11-D8
IN r16, PORTB
ORI r16, 0x0F
OUT PORTB, r16

loop:
	IN r18, PINB
	COM r18
	ANDI r18, 0x0F

	; if r18 is greater than 9, let's go ahead and send 1111 to the display to blank it out
	CPI r18, 10
	BRSH blank_display

	; we now need to bit shift r18 to the left 4 times
	LSL r18
	LSL r18
	LSL r18
	LSL r18

	; now do a "bitwise OR" between PORTD and the contents of r18
	IN r17, PORTD
	ANDI r17, 0x0F	; first clear out the most significant nibble from PORTD
	OR r18, r17		; bitwise OR the contents of PORTD with the value from the DIP switch (store in r18)
	OUT PORTD, r18

	JMP loop

blank_display:
	IN r16, PORTD
	ORI r16, 0xF0
	OUT PORTD, r16
	; we're done, let's go back to the loop
	JMP loop
