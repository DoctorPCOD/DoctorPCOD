;
; lab17_circuit1.asm
; This circuit lights up LEDs according to the DIP switch when a pushbutton is pressed
; Internal pull-ups are activated on PORTD
;
; Created: 6/30/2020 7:30:47 AM
; Edited:  5/20/2025
; Author : Alyssa J. Pasquale, Ph.D.
; port D pins
; D0 - dip (LSB)
; D1 - dip
; D2 - dip
; D3 - dip
; D4 - dip
; D5 - dip
; D6 - dip
; D7 - dip (MSB)
; port B pins
; B0 - led 0 (LSB)
; B1 - led 1
; B2 - led 2
; B3 - led 3
; B4 - led 4
; B5 - led 5
; port C pins
; C0 - led 6
; C1 - led 7 (MSB)
; C5 - pushbutton

.org 0x0000
	RJMP SETUP
.org 0x0008
	RJMP PINCHANGE1

SETUP:
	; configure I/O pins
	LDI r16, 0x3F
	OUT DDRB, r16
	LDI r16, 0x03
	OUT DDRC, r16
	; enable internal pull-ups on PORTD, this means no external resistors need to be used on pins D0--D7
	LDI r17, 0xFF
	OUT PORTD, r17
	; configure pin-change interrupts on pin A5
	CLI
	LDI r17, 0x02
	STS PCICR, r17
	LDI r17, 0x20
	STS PCMSK1, r17
	SEI

LOOP:
	; first write to port c LEDs
	; get bits 7 and 6 into the least significant locations
	LDS r16, 0x100
	SWAP r16
	LSR r16
	LSR r16
	; "bitwise AND" and "bitwise OR" to PORTC
	LDS r17, PORTC
	ANDI r17, 0xFC
	OR r17, r16
	OUT PORTC, r17

	; now write to port b LEDs
	; we want bits 5-0
	LDS r16, 0x100
	ANDI r16, 0x3F
	; "bitwise AND" and "bitwise OR" to PORTB
	LDS r17, PORTB
	ANDI r17, 0xC0
	OR r17, r16
	OUT PORTB, r17

	JMP LOOP

; pin-change interrupt port C
PINCHANGE1:
	; save SREG
	LDS r15, SREG

	; if pin A5 is 0, then this was a falling edge and we don't want to service the ISR
	SBIS PINC, 5
	RETI

	; pin A5 is 1, so let's store the contents of PIND into SRAM
	; it's active-LOW data, so we use the COM instruction
	IN r16, PIND
	COM r16
	STS 0x100, r16
	
	; restore SREG
	STS SREG, r15
	RETI
