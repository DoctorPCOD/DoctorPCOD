void setup() {
  cli();
  DDRD = 0x20;
  TCCR0A = 0x23;
  TCCR0B = 0x0D;
  OCR0A = 255;
  OCR0B = 127;
  sei();

}

void loop() {
  // put your main code here, to run repeatedly:

}
