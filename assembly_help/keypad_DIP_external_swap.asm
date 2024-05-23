;
; this code sends data from a DIP switch with external pull-downs OR a keypad to a BCD to 7-segment display PCB
; any value greater than 9 will blank the display out
; due to the location of the DIP on the least significant nibble of port b and the display on the most significant nibble of port d, we can use SWAP
;
; Created: 05/22/2024 20:41
; Author : Alyssa J. Pasquale, Ph.D.
;
; I/O pins
; D11: DIP MSB	; DIP with external pull-downs or a keypad
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
	ANDI r18, 0x0F

	; if r18 is greater than 9, let's go ahead and send 1111 to the display to blank it out
	CPI r18, 10
	BRSH blank_display

	SWAP r18 ; swap is perfect in this case because our nibbles for ports B and D are swapped

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
