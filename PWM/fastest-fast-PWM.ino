// fastest fast PWM
// noisy ~4 MHz signal on scope
void setup() {
  cli();
  DDRD = 0x20;
  TCCR0A = 0x23;
  TCCR0B = 0x09;
  OCR0A = 2;
  OCR0B = 1;
  sei();

}

void loop() {
  // put your main code here, to run repeatedly:

}
