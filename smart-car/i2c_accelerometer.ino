
/*
  I2C Code for MMA8452Q Accelerometer
  Original author: Mike Hord (SparkFun Electronics) on January 21, 2014
  Code developed in Arduino 1.0.5, on an SparkFun Redbot v12
  Adapted by: Alyssa J. Pasquale, Ph.D. on November 7, 2017
*/

// useful & frequently used definitions
#define XL_ADDR     0x1D // I2C address of the MMA8452Q accelerometer
#define I2C_READ    0x01 // I2C read bit set
#define START_COND  0xA4 // (1<<TWINT) | (1<<TWSTA) | (1<<TWEN)
#define STOP_COND   0x94 // (1<<TWINT) | (1<<TWSTO) | (1<<TWEN)
#define CLEAR_TWINT 0x84 // (1<<TWINT) | (1<<TWEN)
#define NEXT_BYTE   0xC4 // (1<<TWINT) | (1<<TWEA) | (1<<TWEN)

volatile int x;
volatile int y;
volatile int z;

void setup()
{
  accel_init();
  Serial.begin(9600);
}


void loop()
{
  readAccel();
  Serial.print(x);
  Serial.print("\t");
  Serial.print(y);
  Serial.print("\t");
  Serial.println(z);
}

void accel_init() {
  char buffer[2];

  // set f_SCL to 100 kHz
  TWBR = 72;

  // reset the accelerometer
  buffer[0] = 0x40;
  xlWriteBytes(0x2B, buffer, 1);

  // dynamic range: maximum 8g
  buffer[0] = 0x02;
  xlWriteBytes(0x0E, buffer, 1);

  // 800 Hz data rate, low noise mode
  buffer[0] = 0x04;

  // active mode
  buffer[1] = 0x02;

  // write and enable
  xlWriteBytes(0x2A, buffer, 2);
  buffer[0] = 0x05;
  xlWriteBytes(0x2A, buffer, 1);
}

void readAccel() {
  // red all values
  char buffer[6];
  xlReadBytes(0x01, buffer, 6);

  // copy the data into the x, y, z variables
  x = buffer[0] << 8 | buffer[1];
  y = buffer[2] << 8 | buffer[3];
  z = buffer[4] << 8 | buffer[5];
}

void xlReadBytes(char addr, char *buffer, char len) {
  TWCR = START_COND;              // Send a start condition
  while (!(TWCR & (1 << TWINT))); // When TWINT is set, start is complete

  TWDR = XL_ADDR << 1;            // Load the slave address
  TWCR = CLEAR_TWINT;             // Clear TWINT to begin transmission
  while (!(TWCR & (1 << TWINT))); // Wait for TWINT again.

  TWDR = addr;                    // Load the slave address
  TWCR = CLEAR_TWINT;             // Clear TWINT to begin transmission
  while (!(TWCR & (1 << TWINT))); // Wait for TWINT again.

  // send a stop condition
  TWCR = STOP_COND;

  TWCR = START_COND;              // Send a start condition
  while (!(TWCR & (1 << TWINT))); // When TWINT is set, start is complete, and we

  TWDR = (XL_ADDR << 1) | I2C_READ;// Load the slave address and set the read bit
  TWCR = CLEAR_TWINT;             // Clear TWINT to begin transmission
  while (!(TWCR & (1 << TWINT))); // Wait for TWINT again.

  // fetch data, wait, read data, repeat
  for (char i = 0; i < len; i++)
  {
    if (i == len - 1) TWCR = CLEAR_TWINT; // Clear TWINT to begin transmission
    else TWCR = NEXT_BYTE;
    while (!(TWCR & (1 << TWINT))); // Wait for TWINT again.
    buffer[i] = TWDR;             // Now our data can be fetched from TWDR.
  }
  // Now that we're done reading our data, we can transmit a stop condition.
  TWCR = STOP_COND;
}


void xlWriteBytes(char addr, char *buffer, char len) {
  TWCR = START_COND;              // Send a start condition
  while (!(TWCR & (1 << TWINT))); // When TWINT is set, start is complete, and we

  TWDR = XL_ADDR << 1;            // Load the slave address
  TWCR = CLEAR_TWINT;             // Clear TWINT to begin transmission
  while (!(TWCR & (1 << TWINT))); // Wait for TWINT again.

  TWDR = addr;                    // Load the slave address
  TWCR |= CLEAR_TWINT;            // Clear TWINT to begin transmission
  while (!(TWCR & (1 << TWINT))); // Wait for TWINT again.

  // send data to slave
  for (char i = 0; i < len; i++)
  {
    TWDR = buffer[i];             // Now our data can be sent to TWDR.
    TWCR |= CLEAR_TWINT;          // Clear TWINT to begin transmission
    while (!(TWCR & (1 << TWINT))); // Wait for TWINT again.
  }

  // transmit a stop condition.
  TWCR = STOP_COND;
}
