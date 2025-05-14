/*
  Lab 5, Circuit 1
  External interrupt rising-edge triggered adder using a keypad, output displays on an LCD screen
  By: Alyssa J. Pasquale, Ph.D.
  Written: June 14, 2017
  Edited: May 9, 2025
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

#define MCU __AVR_ATmega328P__
#define F_CPU 16000000UL

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "hd44780.h"

volatile unsigned char a = 0;
volatile unsigned char b = 0;

int main(void) {
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

  while (1) {
    // clear the screen
    lcd_clrscr();

    // calculate the sum of a + b
    unsigned char c = a + b;

    // convert a to a string and display
    char variableBuffer[3];
    itoa(a, variableBuffer, 10);
    lcd_puts(variableBuffer);
    lcd_putc('+');

    // convert b to a string and display
    itoa(b, variableBuffer, 10);
    lcd_puts(variableBuffer);
    lcd_putc('=');

    // convert c to a string and display
    itoa(c, variableBuffer, 10);
    lcd_puts(variableBuffer);

    // a short delay is used here to eliminate flickering of the LCD screen
    _delay_ms(20);
  }
}

ISR(INT0_vect) {
  unsigned char sregContents = SREG;
  static unsigned char x = 0;
  if (x) {
    a = PIND >> 4;
  }
  else {
    b = PIND >> 4;
  }
  x ^= 1;
  SREG = sregContents;
}
