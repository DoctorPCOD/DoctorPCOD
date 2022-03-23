//delta t = 4.20 seconds

void setup() {
  cli();
  DDRB = 0x04;
  TCCR1A = 0x23;
  TCCR1B = 0x1D;
  OCR1A = 0xFFFF;
  OCR1B = 32768;
  sei();

}

void loop() {
  // put your main code here, to run repeatedly:

}
