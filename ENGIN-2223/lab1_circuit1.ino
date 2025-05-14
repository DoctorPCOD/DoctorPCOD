/*
  Lab 1, Circuit 1
  Blinking an LED
  By: Alyssa J. Pasquale, Ph.D.
  Written: May 13, 2017
  Edited: April 22, 2025
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
  D7:  LED
  D8:
  D9:
  D10:
  D11:
  D12:
  D13:
*/

#define MCU __AVR_ATmega328P__
#define F_CPU 16000000UL

#include <avr/io.h>
#include <util/delay.h>

int main(void) {
  // this section of code will execute once
  // Set DDRD bit 7
  // This causes Arduino pin D7 to be an output
  // This pin is connected to the LED
  DDRD = 0x80;

  while (1) {
    // this section of code will repeat in an infinite loop
    // Set PORTD bit 7, causing pin D7 to have a value of HIGH
    // use a compound operator for better readability
    PORTD |= 0x80;
    //wait for 1000 ms
    _delay_ms(1000);

    // Clear PORTD bit 7, causing pin D7 to have a value of LOW
    PORTD &= 0x7F;
    //wait for 1000 ms
    _delay_ms(1000);
  }
}
