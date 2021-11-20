;
; lab17_circuit1.asm
; This circuit lights up LEDs according to the DIP switch when a pushbutton is pressed
; Internal pull-ups are activated on PORTD
;
; Created: 6/30/2020 7:30:47 AM
; Author : AJP
; D0 -- LSB dip switch
; D1
; D2
; D3
; D4
; D5
; D6
; D7 -- MSB dip switch
; D8 -- LED0 (LSB)
; D9 -- LED1
; D10 - LED2
; D11 - LED3
; D12 - LED4
; D13 - LED5
; A0 -- LED6
; A1 -- LED7 (MSB)
; A2
; A3
; A4
; A5 -- pushbutton
;

.org 0x0000
	RJMP SETUP
.org 0x0008
	RJMP PINCHANGE1

SETUP:
	; configure I/O pins
	LDI r17, 0x00
	LDI r16, 0x3F
	OUT DDRB, r16
	OUT PORTB, r17
	LDI r16, 0x03
	OUT DDRC, r16
	OUT PORTC, r17
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

; do nothing
LOOP:
	JMP LOOP


; pin-change interrupt port C
PINCHANGE1:
	; if pin A5 is 0, then this was a falling edge and we don't want to service the ISR
	SBIS PINC, 5
	RETI
	IN r16, PIND
	; we are inverting the PIND data because it is active LOW (due to using the internal pull-up resistors)
	COM r16
	MOV r17, r16
	ANDI r16, 0x3F
	OUT PORTB, r16
	; shift right 6 times
	LDI r18, 6
	SHIFT_RIGHT:
		CPI r18, 0
		BREQ END_SHIFT
		LSR r17
		DEC r18
		JMP SHIFT_RIGHT
	END_SHIFT:
		OUT PORTC, r17
	RETI