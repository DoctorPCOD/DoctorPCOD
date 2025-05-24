// much cleaner 4 MHz

// fastest fast PWM
// noisy ~4 MHz signal on scope

#define MCU __AVR_ATmega328P__
#define F_CPU 16000000UL

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

int main(void) {
  cli();
  DDRD = 0x20;
  TCCR0A = 0x21;
  TCCR0B = 0x09;
  OCR0A = 2;
  OCR0B = 1;
  sei();

  while (1) {

  }
}
