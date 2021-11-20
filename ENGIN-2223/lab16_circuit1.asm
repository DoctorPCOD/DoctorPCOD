; Lab 16, Circuit 1
; This circuit lights up an LED when a pushbutton is pressed by using an external interrupt on D2
;
; PIN D2: PUSHBUTTON
; PIN D11: LED
;
; WRITTEN: 6/19/2020 4:42:17 PM
; AUTHOR : Alyssa J. Pasquale, Ph.D.

; this tells the Arduino to go to the setup function after a reset
.org 0x0000
	RJMP setup
; this saves the INT0 vector address into the INT0 vector location
.org 0x0002
	RJMP EXT_INT0

setup:
	CLI
	; D11 is an output pin
	SBI DDRB, 3
	CBI PORTB, 3
	LDI r17, 0x01
	; configure external interrupts on INT0 (D2) with toggle trigger
	OUT EIMSK, r17
	STS EICRA, r17
	SEI

; this is like having an empty loop function
; it will do nothing in an infinite loop
loop:
	JMP loop

; INT0 vector
EXT_INT0:
	; first, save the contents of SREG to a register
	IN r15, SREG
	; start by turning off the LED
	CBI PORTB, 3
	; if the button was pushed (HIGH), then turn on the LED, otherwise skip the next step
	SBIC PIND, 2
	SBI PORTB, 3
	; finally, take the old contents of SREG from r15 and put them back
	OUT SREG, r15
	RETI
