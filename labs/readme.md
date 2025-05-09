# Lab Information

- [Lab manual [PDF]](https://doctor-pasquale.com/wp-content/uploads/2023/05/ENGIN-2223-Lab-Manual.pdf)

# Starter Code

- This is available at [DoctorPCOD/ENGIN-2223](../ENGIN-2223)

# Lab Reports

- [Read an example lab report to understand how I like things formatted.](example_lab_report.md)
- In your hardware section **be specific about how pushbuttons, DIP switches, toggle switches, or other digital input devices requiring a pull-up/down resistor are wired!**
  - External pull-down or pull-up. Note that we DO NOT USE 220 ohm pull-downs anymore. The ATmega328P requires less current than the TTL chips in digital, hence we use 10k ohm pull-downs now.
  - Internal pull-up. I should see this reflected in your code with the setting of the pull-up in the associated PORTx register.
  - Debounced pushbutton PCB.

## Reading Lab Feedback

After I finish grading your lab and lab report, be sure to read all of the feedback that I leave! 

It's possible to read the feedback on your code all in one place. This is a slightly tricky process to follow, so [I've made a YouTube video with a click-through of the process](https://youtu.be/eTR8f5genEE). (It's also possible to get to the feedback page by clicking on a link at the bottom of the comment e-mail that you'll get if you're subscribed.)

# Schematics

- Approved software (must use schematics view)
  - KiCad
  - Eagle
  - If you have something else in mind, ask for my permission
- Symbols for special parts and additional information about components to use in KiCAD is available at [DoctorPCOD/KiCAD](../KiCAD)
  - I can add additional symbols on request, but I need advance notice!
- In your schematics **be clear about how pushbuttons, DIP switches, toggle switches, or other digital input devices requiring a pull-up/down resistor are wired!**
  - External pull-down or pull-up. The signal pin (input) to the microcontroller connects between the pushbutton and the pull-down/pull-up. The input never connects directly to VCC or GND, which would give you a constant 1 or 0 value on the PINx register.
  - Internal pull-up. The signal pin (input) connects directly to one pushbutton pin, and the other pushbutton pin connects to ground.
  - Debounced pushbutton PCB. Either use the KiCad symbol available at [DoctorPCOD/KiCAD](../KiCAD) or include the correct wiring in your schematic. The schematic below shows how the debounced pushbutton is wired. (If you use one button, you would only need to show the wiring for one pushbutton.)
 
<img src="https://i0.wp.com/doctor-pasquale.com/wp-content/uploads/2022/12/debounced-button-schematic.png">

# Using the Serial Monitor

Note that if you have completed the USART lab, I will expect you to use C code (instead of "cheater functions") to write to the serial monitor.

Also note that the serial monitor, because it uses the USART, will modify pins `D1` (transmit) and `D0` (receive). This can affect your hardware if, for example, you have a 7-segment display connected to pins `D7` through `D1`!

```
void setup() {
  Serial.begin(9600); // this piece of cheater code initializes the serial monitor and sets the baud rate (note the use of uppercase S in Serial!)
}

void loop() {
  unsigned char varName = 108;
  Serial.print(varName); // this will print the variable value in base 10 on the serial monitor
  Serial.print(varName,BIN); // this will print the variable value in binary
  Serial.print(varName,HEX); // this will print the variable value in hexadecimal
  Serial.println(varName); // use this when you want a line break after printing the variable
}
```

To open up the serial monitor, to go tools > serial monitor in the Arduino IDE.

# Resources

Following are resources for each of the microcontrollers labs. Each page contains a link to the lab manual, a list of related equipment videos, helpful links, any known errata, and other tools that will help you to be successful when doing the labs.

Note: Labs 14-17 were written for the duration of the spring 2020 semester in which we were required to work off-campus. They may not be required work in a typical semester.

## Lab 1: Introduction to Arduino Uno and ATmega328P
- Code
  - [Circuit 1: Blinking an LED](../ENGIN-2223/lab1_circuit1.ino)
- Textbook
  - Chapter 10
  - Section 18.4
- Infographics
  - [Resistor color codes](../infographics/Resistor%20color%20codes.pdf)

## Lab 2: Digital and Analog Input Devices
- Code
  - [Circuit Ia: Pushbutton input with external pull-down resistor](../ENGIN-2223/lab2_circuit1.ino)
- Textbook
  - Chapter 10
  - Section 11.5
- Infographics
  - [Potentiometer and variable resistor wiring](../infographics/Pot%20vs%20Variable%20Resistor.pdf)

## Lab 3: Displays
- Spring 2025 lab manual errata ⚠️
  - Page 36 says `lcd_puts("Hello!"); // note the use of single quotes` and should say `lcd_puts("Hello!"); // note the use of double quotes`
- Code
  - [Circuit I: Single 7-segment display](../ENGIN-2223/lab3_circuit1.ino)
  - [hd44780_settings.h](../ENGIN-2223/hd44780_settings.h)
  - [hd44780.h](../ENGIN-2223/hd44780.h)
  - [hd44780.cpp](../ENGIN-2223/hd44780.cpp)
- Textbook
  - Section 18.3
  - Section 18.6
  - Section 18.8
- Infographics
  - [Using current-limiting resistors with segmented displays and RGB LEDs](../infographics/Current-Limiting%20Resistors.pdf)
- Websites
  - [HD44780 character codes](https://github.com/DoctorPCOD/DoctorPCOD/blob/main/labs/HD44780_character_codes.pdf) This document has the character codes used on the LCD screen. (It's similar to, but not the same as, ASCII.)
- Videos
  - [Current-limiting resistors](https://youtu.be/EN3FPsV-pFg)

## Lab 4: Sensors and Sensor Calibration
- Textbook
  - Chapter 12
  - Section 18.2

## Lab 5: External Interrupts
- Code
  - [Circuit I: Keypad adder](../ENGIN-2223/lab5_circuit1.ino)
- Textbook
  - Chapter 13
  - Section 14.5
- Websites
  - [AVR Libc <avr/wdt.h> defines](https://onlinedocs.microchip.com/oxy/GUID-317042D4-BCCE-4065-BB05-AC4312DBC2C4-en-US-2/GUID-2B361770-F19D-4FA6-9287-C4933235B8CE.html) This lists all of the arguments that can be used with the `wdt_enable()` function to configure each watchdog timer prescaler.
- Videos
  - [How does the WDT circuit (circuit 3) work and why?](https://youtu.be/JgnG2JJMU9Q) Note that this video uses terminology that is now deprecated in this class. `setup()` refers to code in the `main` function before the `while` loop and `loop()` refers to code in the `main` function `while` loop. When I have time, I will make an updated video and link it here.

## Lab 6: Timer/Counters and Timed Interrupts
- Textbook
  - Chapter 14

## Lab 7: Pulse-Width Modulation and Motors
- Textbook
  - Section 14.4

## Lab 8: Proportional and Integral Control
- Code
  - [Circuit 1 workbook](../ENGIN-2223/lab8_workbook.xlsx)
- Textbook
  - Chapter 17
- Videos
  - [P and PI control of LED](https://youtu.be/UVFDm5bBDs0) - this video demonstrates the difference between an underdamped and over/critically damped response.

Here is how to write data to the serial plotter. The `\t` delimiter is a tab that differentiates between the two pieces of data being plotted.

```
Serial.print(pV);
Serial.print('\t');
Serial.println(sP);
```

## Lab 9: SPI: Serial Peripheral Interface
- Spring 2025 lab manual change ⚠️
  - The flowchart for circuit 1 is shown below:
<img src="https://github.com/DoctorPCOD/DoctorPCOD/blob/main/labs/lab9_circuit1_newflowchart.png">

- Code
  - [Circuit I: SPI control of 7-segment display](../ENGIN-2223/lab9_circuit1.ino)
- Textbook
  - Section 15.5
- Websites
  - [This article from Boston University](https://www.bu.edu/articles/2020/striking-out-racist-terminology-in-engineering/) discusses the racism used in many electrical engineering concepts, which is why the terminology used in this lab differs from the terminology used in official AVR documentation and many other websites. This lab, and the lab appendix, have been rewritten to use the terms primary and secondary when referring to SPI devices.

## Lab 10: Power Consumption and ATmega328P without Arduino
- Textbook
  - Chapter 9
  - Chapter 16
- Websites
  - [AVR fuse calculator](https://www.engbedded.com/fusecalc/)
  - [Arduino boards.txt file](https://github.com/arduino/ArduinoCore-avr/blob/master/boards.txt) includes fuse details of the Arduino programmed ATmega328P
  - [How to use AVR fuses](http://www.crash-bang.com/programme-avr-fuse/)

### Fuse Bytes
- Use the Config tab in the Xgpro programming software to configure the fuse bytes (see screenshot below)
- Under "Others" in the bottom right will be the HEX value of each byte, which is useful for comparing to a fuse byte calculator

![screen shot of Xgpro software in the Config tab](https://github.com/DoctorPCOD/DoctorPCOD/blob/main/labs/xgpro-config.png?raw=true)

### Clarification
Here are some details to make the circuits more clear.
- Dr. P needs to see that your LED is visibly ON in all three circuits.
- External interrupts triggered by a pushbutton must always work (be sure this doesn't stop functioning if you decrease VCC).
- Circuit 1 is a baseline to determine where you've started from. Do no optimizations at all on this circuit.
- Circuits 1 and 2 must have a VCC of 5 V.
- Circuits 3 and 4 can have a VCC down to 2.7 V, but **only** if the LED is visibly ON **and** external interrupts still work. (In circuit 3, the LED must be visibly ON with the USB cable disconnected from the Arduino Uno.)

### Dr. P's Power Data
In May 2024, here are the values Dr. P got after doing some power optimization. The constraints were the same as lab: the LED was visibly ON when enabled, and the pushbutton was always able to trigger an interrupt.

| Circuit | LED ON   | LED OFF  |
|---------|----------|----------|
| 1       | 297.5 mW | 292.5 mW |
| 2       | 295.0 mW | 220.0 mW |
| 3       | 95.7 mW  | 78.9 mW  |
| 4       | 18.2 mW  | 17.5 mW  |

## Lab 11: Transmitting and Receiving a Secret Message
- Textbook
  - Section 15.5

## Lab 12: Ultrasonic Sensor
- Textbook
  - Section 14.2
- Videos
  - [Input capture unit](https://youtu.be/eXE-8X38AHs)

## Lab 13: Introduction to Assembly
- Code
  - [Circuit I: Pushbutton and LED](../ENGIN-2223/lab13_circuit1.asm)
  - [DrPCOD/assembly_help](https://github.com/DoctorPCOD/DoctorPCOD/tree/main/assembly_help)
- Textbook
  - Chapter 7
  - Chapter 19
- Websites
  - [AVR Instruction Set Manual, PDF](https://github.com/DoctorPCOD/DoctorPCOD/blob/main/assembly_help/AVR_Instruction_Set_Manual.pdf)
  - [Microchip Studio](https://www.microchip.com/en-us/tools-resources/develop/microchip-studio)
  - [How to program Arduino from Microchip Studio](https://www.arnabkumardas.com/platforms/atmel/how-to-flash-or-program-arduino-from-atmel-studio/) this works for both Atmel Studio and Microchip Studio
  - [AVR delay loop calculator](http://darcy.rsgc.on.ca/ACES/TEI4M/AVRdelay.html)

## Lab 14: USART: Universal Synchronous/Asynchronous Receiver/Transmitter
- Textbook
  - Section 15.4

## Lab 15: Pointers and ADC in Assembly
- Code
  - [Binary to BCD conversion](../ENGIN-2223/binary-bcd.asm)
  - [DrPCOD/assembly_help](https://github.com/DoctorPCOD/DoctorPCOD/tree/main/assembly_help)
- Textbook
  - Chapter 6
  - Chapter 7
  - Chapter 19
- Videos
  - [Circuit 2 demo](https://youtu.be/xMfgy89AevU)

## Lab 16: Interrupts and WDT in Assembly
- Code
  - [Circuit 1: Pushbutton LED toggle with interrupts](../ENGIN-2223/lab16_circuit1.asm)
  - [DrPCOD/assembly_help](https://github.com/DoctorPCOD/DoctorPCOD/tree/main/assembly_help)
- Textbook
  - Chapter 6
  - Chapter 7
  - Chapter 19
- Videos
  - [Circuit 4 demonstration](https://youtu.be/iWqjtBQRcCk)

## Lab 17: Greater Than 8-Bit Math in Assembly
- Code
  - [Circuit 1: Display DIP switch value on LEDs with pin change interrupt](../ENGIN-2223/lab17_circuit1.asm)
  - [Binary to BCD conversion with thousands place](../ENGIN-2223/bcd_thousands_place.asm)
  - [DrPCOD/assembly_help](https://github.com/DoctorPCOD/DoctorPCOD/tree/main/assembly_help)
- Textbook
  - Chapter 6
  - Chapter 7
  - Chapter 19

# TinkerCAD

While [TinkerCAD](https://www.tinkercad.com) is admittedly quite slow, it is possible to write code in [TinkerCAD](https://www.tinkercad.com) for many of our circuits and simulate multiple hardware options. This can be nice if you're struggling with writing code and need more practice and don't have access to a lot of hardware.

Things TinkerCAD cannot do
- Use the hd44780 library (workaround: use the serial monitor to display strings)
- Use timer/counter 1 PWM modes when TOP = `OCR1A` or `ICR1` (8-bit, 9-bit, and 10-bit modes do work)
- Use timer/counter 1 in CTC mode (when TOP = `OCR1A` or `ICR1`)
- WDT
- SPI
- Input capture unit
- USART in SPI mode (USART does work in asynchronous mode)
 
## ADC

The ADC works in TinkerCAD, but you have to re-enable the ADC start conversion bit in `ADCSRA` after every conversion:

```
ISR(ADC_vect) {
  result = ADC;
  ADCSRA |= 0x40;
}
```

## MUX 7-Segment Display

There is no drop-in compatible part for the MUX 7-segment display. However, I created [a template that you can use](https://www.tinkercad.com/things/lTxUvYVEqcu-mux-7-segment-display) where I simply connected each of the four sets of 7 segment anodes together to a current-limiting resistor. You would connect these as you would the segment anode pins. Then you'll need to connect each individual cathode.[^*]

[^*]: Note as of 2024-02-19, I literally just made this without really testing it, so if there are issues you find, please let me know so I can correct them!

## Line Sensors

There is no drop-in compatible part for the line-following sensors. However, you can use three photoresistors connected as we do in lab 4 on three different ADC pins and use that to test how well your code can collect data between the three different sensors. When you go into simulation mode, if you click on the photoresistor, there will be a slider that allows you to change the light level for the photoresistor (see screenshot below).

<img src="https://raw.githubusercontent.com/DoctorPCOD/DoctorPCOD/main/labs/tinkercad-photoresistor-simulation.png" alt="Screenshot of Arduino Uno connected to a photoresistor to an ADC pin, highlighting the slider that changes the simulated light level." width=800>
