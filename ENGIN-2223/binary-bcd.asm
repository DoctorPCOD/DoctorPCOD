	; convert 8-bit binary to BCD (hundreds place)
	LDI r18, -1
BCD1:
	INC r18
	SUBI r20, 100
	BRCC BCD1
	; (tens place)
	LDI r21, 100
	ADD r20, r21
	LDI r17, -1
BCD2:
	INC r17
	SUBI r20, 10
	BRCC BCD2
	; (ones place)
	LDI r21, 10
	ADD r20, r21
	LDI r22, -1
BCD3:
	INC r22
	SUBI r20, 1
	BRCC BCD3
