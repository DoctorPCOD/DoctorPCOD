void setup() {
  cli();
  DDRD = 0x20;
  TCCR0A = 0x21;
  TCCR0B = 0x09;
  OCR0A = 2;
  OCR0B = 1;
  sei();

}

void loop() {
  // put your main code here, to run repeatedly:

}
