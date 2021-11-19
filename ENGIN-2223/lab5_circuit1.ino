/*
  Lab 5, Circuit 1
  External interrupt rising-edge triggered adder using a keypad, output displays on an LCD screen
  By: Alyssa J. Pasquale, Ph.D.
  Written: June 14, 2017
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
  D2:  Keypad encoder pin 12 (data available)
  D3:
  D4:  Keypad pin A
  D5:  Keypad pin B
  D6:  Keypad pin C
  D7:  Keypad pin D
  D8:  LCD Register Select (RS)
  D9:  LCD Enable (E)
  D10: LCD Data Bit 4 (DB4)
  D11: LCD Data Bit 5 (DB5)
  D12: LCD Data Bit 6 (DB6)
  D13: LCD Data Bit 7 (DB7)
*/

// include the library that contains all of the LCD functions and constants
#include "hd44780.h"

void setup()
{
  // globally disable interrupts while setting up important registers
  cli();
  // configure external interrupt registers
  // rising edge triggered interrupts on pin D2
  EICRA = 0x03;
  // enable interrupt INT0
  EIMSK = 0x01;
  // globally re-enable interrupts
  sei();

  // initialize the LCD screen (sets the screen size, font, etc.)
  lcd_init();
}

volatile unsigned char a = 0;
volatile unsigned char b = 0;

void loop()
{
  // clear the screen
  lcd_clrscr();

  // convert a to a string, can only be 3 characters (0-11 and terminal character), then display
  char aBuffer[3];
  itoa(a, aBuffer, 10);
  lcd_puts(aBuffer);
  lcd_puts("+");

  // convert b to a string, can only be 3 characters (0-11 and terminal character), then display
  char bBuffer[3];
  itoa(b, bBuffer, 10);
  lcd_puts(bBuffer);
  lcd_puts("=");

  unsigned char c = a + b;

  // convert c to a string, can only be 3 characters (0-22 and terminal character), then display
  char cBuffer[3];
  itoa(c, cBuffer, 10);
  lcd_puts(cBuffer);

  // a short delay is used here to eliminate flickering of the LCD screen
  _delay_ms(3);
}

ISR(INT0_vect) {
  static char x = 0;
  if (x) {
    a = PIND >> 4;
  }
  else {
    b = PIND >> 4;
  }
  x ^= 1;
}
