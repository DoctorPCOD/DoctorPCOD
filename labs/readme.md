# Lab Information

- [Lab manual [PDF]](https://doctor-pasquale.com/wp-content/uploads/2023/05/ENGIN-2223-Lab-Manual.pdf)
- [doctor-pasquale.com Microcontrollers Webpage](https://doctor-pasquale.com/engin-2223/) contains suggested resources for each lab, as needed

# Starter Code

- This is available at [DoctorPCOD/ENGIN-2223](../ENGIN-2223)

# Lab Reports

- Select the pages in your Gradescope submissions, otherwise I will deduct one point to pay for my manual labor of doing it myself!
  - [Video: How do do this using the Gradescope app](https://youtu.be/oQ3h4JCz3O4)
  - [Video: How to do this using gradescope.com](https://youtu.be/LT7-Cjfbgho)
- [Read an example lab report to understand how I like things formatted.](example_lab_report.md)
- In your hardware section **be specific about how pushbuttons, DIP switches, toggle switches, or other digital input devices requiring a pull-up/down resistor are wired!**
  - External pull-down or pull-up. Note that we DO NOT USE 220 ohm pull-downs anymore. The ATmega328P requires less current than the TTL chips in digital, hence we use 10k ohm pull-downs now.
  - Internal pull-up. I should see this reflected in your code with the setting of the pull-up in the associated PORTx register.
  - Debounced pushbutton PCB.

## Reading Lab Feedback

After I finish grading your lab and lab report, be sure to read all of the feedback that I leave! In Gradescope, click on each question to see if I left a comment (which is possible even if you received full credit).

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
- Code
  - [Circuit I: Single 7-segment display](../ENGIN-2223/lab3_circuit1.ino
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
  - [ASCII code](https://www.ascii-code.com/)
- Videos
  - [Current-limiting resistors](https://youtu.be/EN3FPsV-pFg)

## Lab 4

## Lab 5

## Lab 6

## Lab 7

## Lab 8

## Lab 9

## Lab 10

## Lab 11

## Lab 12

## Lab 13

## Lab 14

## Lab 15

## Lab 16

## Lab 17

# TinkerCAD

While [TinkerCAD](https://www.tinkercad.com) is admittedly quite slow, it is possible to write code in [TinkerCAD](https://www.tinkercad.com) for many of our circuits and simulate multiple hardware options. This can be nice if you're struggling with writing code and need more practice and don't have access to a lot of hardware.

Things TinkerCAD cannot do
- Use the hd44780 library (workaround: use the serial monitor to display strings)
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
