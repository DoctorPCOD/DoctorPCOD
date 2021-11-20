/*
  Lab 9, Circuit 1
  This code uses SPI and a 74595 register to cycle through
    numerals 0-9 on a 7-segment common-cathode display
  By: Alyssa J. Pasquale, Ph.D.
  Written: October 1, 2017
  Edited: November 19, 2021
  I/O Pins
  A0:
  A1:
  A2:
  A3:
  A4:
  A5:
  D0:
  D1:
  D2:
  D3:
  D4:
  D5:
  D6:
  D7:
  D8:
  D9:
  D10: RCLK (pin 12) on 74595
  D11: SER (pin 14) on 74595
  D12:
  D13: SRCLK (pin 11) on 74595
*/

void setup() {
  // configure SCK, MOSI and SS as output pins
  DDRB = 0x2C;
  // write secondary select high (inhibits data transfer)
  PORTB |= 0x04;

  cli();
  // Enable SPI, LSB first, primary mode, default prescaler
  SPCR = 0x70;
  sei();
}

void loop() {
  static unsigned char x = 0;
  unsigned char numArray[10] = {0xFC, 0x60, 0xDA, 0xF2, 0x66, 0xB6, 0xBE, 0xE0, 0xFE, 0xF6};

  writeSPI(numArray[x]);

  x++;
  if (x > 9) x = 0;
  _delay_ms(500);
}

void writeSPI(unsigned char dataToWrite) {
  // SS pin LOW (enable write)
  PORTB &= 0xFB;

  // Data will transfer when SPDR is written to
  SPDR = dataToWrite;

  // Wait until transfer is complete
  while (!(SPSR & (1 << 7)));

  // SS pin HIGH (disable write)
  PORTB |= 0x04;
}
