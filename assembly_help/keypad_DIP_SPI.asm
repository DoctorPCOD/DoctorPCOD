;
; this code sends data from a DIP switch with external pull-downs OR a keypad to a 7-segment display using SPI and the 74595 chip
; any value greater than 9 will blank the display out
; this uses the SPI protocol and X pointer register
;
; Created: 05/22/2024 21:00:28
; Author : Alyssa J. Pasquale, Ph.D.
;
; I/O pins
; D13	SCK (SRCLK)
; D12	--
; D11	MOSI (SER)
; D10	SS (RCLK)
; D9	--
; D8	--
; D7	DIP or keypad MSB
; D6	DIP or keypad
; D5	DIP or keypad
; D4	DIP or keypad LSB


; first, configure output pins
LDI r16, 0x2C
OUT DDRB, r16

; enable SPI
; SPI registers are in I/O space, so you can use IN and OUT
LDI r16, 0x70
OUT SPCR, r16

; store numeral encodings to data space
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
LDI r16, 0x00 ; blank screen
STS 0x10A, r16

; initialize X at 0x0100
LDI r27, 0x01
LDI r26, 0x00

loop:
	; read data from the DIP switch or keypad, save it into the pointer register
	; swap nibbles to put it in the least-significant place
	IN r26, PIND
	ANDI r26, 0xF0	; bitwise AND to mask
	SWAP r26

	; if it's 10 or greater, just point it to 0x010A
	CPI r26, 10		; compares r26 with the value 10
	IN r15, SREG	; store SREG into r15, SREG contains info from the compare operation
	SBRS r15, 0		; the carry flag will be set if it's smaller than 10, so skip going to blank if that's true
	LDI r26, 0x0A

	; assert SS (bitwise AND)
	IN r17, PORTB
	ANDI r17, 0xFB
	OUT PORTB, r17

	; go to the sendSPI function
	CALL sendSPI

	; de-assert SS (bitwise OR)
	IN r17, PORTB
	ORI r17, 0x04
	OUT PORTB, r17

	JMP loop


sendSPI:
	; numeral to send to SPDR is pointed to by X
	LD r20, X
	OUT SPDR, r20

	; wait for SPIF to set
	wait: 
		IN r16, SPSR
		SBRS r16, 7
		JMP wait

	RET