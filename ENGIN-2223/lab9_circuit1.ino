/*
  Lab 9, Circuit 1
  This code uses SPI and a 74595 register to cycle through
    numerals 0-9 on a 7-segment common-cathode display
  By: Alyssa J. Pasquale, Ph.D.
  Written: October 1, 2017
  Edited: May 10, 2025
  I/O Pins
  D10: RCLK (pin 12) on 74595
  D11: SER (pin 14) on 74595
  D13: SRCLK (pin 11) on 74595
*/

#define MCU __AVR_ATmega328P__
#define F_CPU 16000000UL

#include <avr/io.h>
#include <avr/interrupt.h>

volatile unsigned char x = 0;

int main(void) {
  DDRB = 0x2C;   // SCK, MOSI, SS are output pins
  PORTB |= 0x04; // SS high

  cli();
  // Enable SPI, LSB first, primary mode, prescaler of 4
  SPCR = 0x70;

  // Configure timer/counter 1 in CTC mode with T = 0.5 s, enable COMPA interrupts
  TCCR1A = 0x00;
  TCCR1B = 0x0C;
  TIMSK1 = 0x02;
  OCR1A = 31249;
  sei();

  unsigned char numArray[10] = {0xFC, 0x60, 0xDA, 0xF2, 0x66, 0xB6, 0xBE, 0xE0, 0xFE, 0xF6};

  while (1) {
    writeToSPI(numArray[x]);
  }
}

void writeToSPI(unsigned char dataToWrite) {
  PORTB &= 0xFB; // enable SPI write
  SPDR = dataToWrite;

  // Wait until transfer is complete
  while (!(SPSR & (1 << SPIF)));

  PORTB |= 0x04; // disable SPI write
}

ISR (TIMER1_COMPA_vect) {
  unsigned char sregValue = SREG;
  x++;
  if (x == 10) x = 0;
  SREG = sregValue;
}
