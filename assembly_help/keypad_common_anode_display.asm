;
; this code sends data from a DIP switch with external pull-downs OR a keypad to a common-anode 7-segment display
; any value greater than 9 will blank the display out
; this uses data stored to data memory and uses the X pointer register
;
; Created: 05/29/2024 12:16
; Author : Alyssa J. Pasquale, Ph.D.
;
; I/O pins
; D11: DIP MSB	; either a DIP with external pull-downs or a keypad
; D10: DIP
; D9:  DIP
; D8:  DIP LSB
; D7:  segment a
; D6:  b
; D5:  c
; D4:  d
; D3:  e
; D2:  f
; D1:  g

; pins D7-D1 are output pins
LDI r16, 0xFE
OUT DDRD, r16

; store numeral encodings in data memory
; this is active-HIGH and will be bitwise-NOTed later
LDI r16, 0xFC
STS 0x100, r16
LDI r16, 0x60
STS 0x101, r16
LDI r16, 0xDA
STS 0x102, r16
LDI r16, 0xF2
STS 0x103, r16
LDI r16, 0x66
STS 0x104, r16
LDI r16, 0xB6
STS 0x105, r16
LDI r16, 0xBE
STS 0x106, r16
LDI r16, 0xE0
STS 0x107, r16
LDI r16, 0xFE
STS 0x108, r16
LDI r16, 0xF6
STS 0x109, r16
LDI r16, 0x00
STS 0x10A, r16
LDI r16, 0x00
STS 0x10B, r16
LDI r16, 0x00
STS 0x10C, r16
LDI r16, 0x00
STS 0x10D, r16
LDI r16, 0x00
STS 0x10E, r16
LDI r16, 0x00
STS 0x10F, r16

; set X high byte
LDI r27, 0x01

loop:
	; read data from PINB and mask
	IN r26, PINB
	ANDI r26, 0x0F

	LD r16, X
	COM r16 ; bitwise NOT for active-LOW display
	ANDI r16, 0xFE ; get rid of LSB, shouldn't be setting D0 accidentally
	IN r17, PORTD
	ANDI r17, 0x01 ; be sure that we're clearing out any initial value stored in PORTD
	OR r16, r17 ; bitwise OR so as not to mess with pin D0
	OUT PORTD, r16

	JMP loop