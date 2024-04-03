/*
  Lab 1, Circuit 1
  Blinking an LED
  By: Alyssa J. Pasquale, Ph.D.
  Written: May 13, 2017
  Edited: May 1, 2019
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

void setup()
{
  // Set DDRD bit 7
  // This causes Arduino pin D7 to be an output
  // We can use it to turn an LED on and off
  DDRD = 0x80;
}

void loop()
{
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
