// Delta T = 8.4 seconds

// fastest fast PWM
// noisy ~4 MHz signal on scope

#define MCU __AVR_ATmega328P__
#define F_CPU 16000000UL

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

int main(void) {
  cli();
  DDRB = 0x04;
  TCCR1A = 0x23;
  TCCR1B = 0x15;
  OCR1A = 0xFFFF;
  OCR1B = 32768;
  sei();

  while (1) {

  }
}
