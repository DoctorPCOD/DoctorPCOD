/*
  Lab 2, Circuit 1a
  Using a pushbutton to turn on/off an LED
  (External pull-down resistor used)
  By: Alyssa J. Pasquale, Ph.D.
  Written: May 15, 2017
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
  D7:
  D8:  Pushbutton
  D9:
  D10:
  D11:
  D12:
  D13: LED
*/

#define MCU __AVR_ATmega328P__
#define F_CPU 16000000UL

#include <avr/io.h>

int main(void) {
  // Set DDRB bit 5
  // This causes Arduino pin D13 to be an output
  DDRB = 0x20;

  while (1) {
    //Read value from pushbutton (D8)
    if (PINB & 0x01) {
      //Turn on LED
      PORTB |= 0x20;
    }
    else {
      // Turn off LED
      PORTB &= 0xDF;
    }
  }
}
