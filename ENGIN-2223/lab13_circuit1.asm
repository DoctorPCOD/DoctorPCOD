;
; This code will turn on an LED if a pushbutton is pressed
; (alternatively, it will turn the LED off if the button is not pressed)
; 
; WRITTEN: 11/15/2017 10:28:58 AM
; EDITED:  05/22/2024
; AUTHOR : Alyssa J. Pasquale, Ph.D.
;
; I/O pins
; D8: LED
; D7: pushbutton (external pull-down)

; any non-repeating tasks should occur before the subroutine
SBI DDRB, 0	; configure D8 as an output pin

; any repeating code will go in this subroutine
loop:
	; start by turning the LED off
	CBI PORTB, 0

	; input data from the PIND register
	IN r16, PIND
	; mask data from the PIND register
	ANDI r16, 0x80

	; compare to 0x80 (if it is equal to 0x80, then the pushbutton is pressed)
	CPI r16, 0x80
	; if r16 = 0x80, turn on the LED
	BREQ turn_on_led	; if r16 = 0x80, the code will branch to the turn_on_led address location

	; otherwise, we can jump back to the start of the loop
	JMP loop

turn_on_led:
	SBI PORTB, 0

	; now that the LED is on, go back to the start of the loop
	JMP loop
