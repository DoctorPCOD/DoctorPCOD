/*
  Lab 3, Circuit 1
  Display digits 0-F on a (common-cathode or common-anode) 7-segment display
  By: Alyssa J. Pasquale, Ph.D.
  Written: June 5, 2017
  Edited: February 10, 2023
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

void setup()
{
  // Configure DDRD using the pins you've chosen to connect to the 7-segment display

}

void loop()
{
  // Define a constant value equal to the number of values in the array. Const must be used with array indexes.
  const unsigned char n = 16;
  // Define an array with display values for each numeral from 0-F
  // This data will come from Activity 4
  unsigned char numArray[n] = {};

  // Writes each segment encoding to PORTD with a half-second delay in between each numeral
  for (unsigned char j = 0; j < n; j++) {
    // you need to insert a line of code here to selectively clear the segment pins
    PORTD |= numArray[j];
    _delay_ms(500);
  }
}
