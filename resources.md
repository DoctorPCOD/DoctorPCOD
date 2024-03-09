# Resources

Here is a list of resources related to ENGIN-2223.

## Microchip[^1] / AVR Resources

- [ATmega328P Datasheet](https://doctor-pasquale.com/wp-content/uploads/2018/11/ATmega328P.pdf) This datasheet is probably the most useful resource that you have access to for learning more about the AVR microcontroller. This datasheet contains information on virtually every topic that we cover in class.
- [AVR Instruction Set Manual](http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0856-AVR-Instruction-Set-Manual.pdf) This document contains every instruction allowed on AVR microcontrollers. We cover many of these in class, so this becomes a very useful guide.
- [AVR Fuse Calculator](https://www.engbedded.com/fusecalc/) Use this online tool to determine fuse settings when programming any AVR microcontroller chip.
- [AVR Interrupts](https://www.nongnu.org/avr-libc/user-manual/group__avr__interrupts.html) This website has the name of every interrupt vector. Sometimes the name of the same interrupt vector is different on different microcontrollers. In case you are using something different from the ATmega328P, you may want to reference this if your interrupt isn’t working.

[^1]: Microchip bought out Atmel (the original producer of the AVR family of microcontrollers) in 2016. Some of the datasheets or other references herein may still say Atmel.

## Arduino

- [Arduino Uno R3 Schematic](https://www.arduino.cc/en/uploads/Main/Arduino_Uno_Rev3-schematic.pdf) A complete pin-by-pin look at the Arduino Uno and how it interfaces with the ATmega328P microcontroller.[^2]
- [Arduino Board Pin Reference](https://docs.arduino.cc/tutorials/uno-rev3/intro-to-board/) Explains all of the pins on the Arduino Uno board.
- [Cheater Functions Explained](http://garretlab.web.fc2.com/en/arduino/inside/index.html) This website explains the C code behind all of the Arduino “cheater functions” (that you are definitely not allowed to use in class). See how much bloat is included in these functions that we eliminate by using C.

[^2]: Note that there are two microcontrollers on the Arduino Uno R3. The ATmega328P is the MCU that you program. The ATmega16U2 is a microcontroller included to facilitate code transfer to the ATmega328P over USB.
