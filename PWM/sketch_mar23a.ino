void setup() {
  cli();
  DDRB = 0x04;
  TCCR1A = 0x23;
  TCCR1B = 0x11;
  OCR1A = 2;
  OCR1B = 1;
  sei();

}

void loop() {
  // put your main code here, to run repeatedly:

}
