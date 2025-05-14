/*
  Lab 3, Circuit 1
  Display digits 0-F on a (common-cathode) 7-segment display
  By: Alyssa J. Pasquale, Ph.D.
  Written: June 5, 2017
  Edited: May 14, 2025
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
  // Configure DDRD using the pins you've chosen to connect to the 7-segment display

  // Define a constant value equal to the number of values in the array. Const must be used with array indexes.
  const unsigned char n = 16;

  // Define an array with display values for each numeral from 0-F
  // This data will come from Activity 4
  unsigned char numeralArray[n] = {};

  while (1) {
    for (unsigned char i = 0; i < n; i++) {
      // you need to insert a line of code here to selectively clear the segment pins
      
      PORTD |= numeralArray[i];
      _delay_ms(500);
    }
  }
}
