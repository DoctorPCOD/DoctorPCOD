	; convert to BCD (thousands place)
	; MSB of data is in register r25
	; LSB of data is in register r24
	; r19 = 1000s
	; r20 =  100s
	; r21 =   10s
	; r22 =    1s
	LDI r19, -1
BCD1:
	INC r19
	SUBI r24, 0xE8
	SBCI r25, 0x03
	BRBC 4, BCD1	; has not overflown, go back and subtract again
	; has overflown, add 1000 back and go do 100s place
	LDI r16, 0xE8
	LDI r17, 0x03
	ADD r24, r16
	ADC r25, r17
	; (hundreds place)
	LDI r20, -1
BCD2:
	INC r20
	SUBI r24, 100
	SBCI r25, 0
	BRBC 4, BCD2	; has not overflown, go back and subtract again
	; has overflown, add 100 back and go do 10s place
	LDI r16, 100
	CLR r17
	ADD r24, r16
	ADC r25, r17
	; (tens place)
	LDI r21, -1
BCD3:
	INC r21
	SUBI r24, 10
	BRCC BCD3	; has not overflown, go back and subtract again
	; has overflown, add 10 back and go do 1s place
	LDI r16, 10
	ADD r24, r16
	; (ones place)
	LDI r22, -1
BCD4:
	INC r22
	SUBI r24, 1
	BRCC BCD4	; has not overflown, go back and subtract again
	; has overflown, add 1 back and finish
	INC r24
