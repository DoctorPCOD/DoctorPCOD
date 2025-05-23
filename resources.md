# Resources

Here is a list of resources related to ENGIN-2223.

## Microchip[^1] / AVR Resources

- [ATmega328P Datasheet](https://doctor-pasquale.com/wp-content/uploads/2018/11/ATmega328P.pdf) This datasheet is probably the most useful resource that you have access to for learning more about the AVR microcontroller. This datasheet contains information on virtually every topic that we cover in class.
- [AVR Libc](https://onlinedocs.microchip.com/oxy/GUID-317042D4-BCCE-4065-BB05-AC4312DBC2C4-en-US-2/index.html) This outlines all of the AVR libraries available for us to use.
- [AVR Instruction Set Manual](https://ww1.microchip.com/downloads/en/DeviceDoc/AVR-Instruction-Set-Manual-DS40002198A.pdf) This document contains every instruction allowed on AVR microcontrollers. We cover many of these in class, so this becomes a very useful guide.
- [AVR Fuse Calculator](https://www.engbedded.com/fusecalc/) Use this online tool to determine fuse settings when programming any AVR microcontroller chip.
- [AVR Interrupts](https://www.nongnu.org/avr-libc/user-manual/group__avr__interrupts.html) This website has the name of every interrupt vector. Sometimes the name of the same interrupt vector is different on different microcontrollers. In case you are using something different from the ATmega328P, you may want to reference this if your interrupt isn’t working.

[^1]: Microchip bought out Atmel (the original producer of the AVR family of microcontrollers) in 2016. Some of the datasheets or other references herein may still say Atmel.

## Arduino

- [Arduino Uno R3 Datasheet](https://docs.arduino.cc/resources/datasheets/A000066-datasheet.pdf) This datasheet gives information specific to the Arduino Uno.
- [Arduino Uno R3 Schematic](https://www.arduino.cc/en/uploads/Main/Arduino_Uno_Rev3-schematic.pdf) A complete pin-by-pin look at the Arduino Uno[^2] and how it interfaces with the ATmega328P microcontroller.
- [Arduino Board Pin Reference](https://docs.arduino.cc/tutorials/uno-rev3/intro-to-board/) Explains all of the pins on the Arduino Uno board.
- [Cheater Functions Explained](http://garretlab.web.fc2.com/en/arduino/inside/index.html) This website explains the C code behind all of the Arduino “cheater functions” (that you are definitely not allowed to use in class). See how much bloat is included in these functions that we eliminate by using C.
- [Optiboot Bootloader](https://github.com/Optiboot/optiboot/blob/master/optiboot/bootloaders/optiboot/optiboot.c) This is the Github repository for the Optiboot bootloader C code. Skimming through this will give you an idea of all the program code that executes when the Arduino is rebooted.

[^2]: Note that there are two microcontrollers on the Arduino Uno R3. The ATmega328P is the MCU that you program. The ATmega16U2 is a microcontroller included to facilitate code transfer to the ATmega328P over USB.

## Simulation, Schematics and Flowchart Tools

- [KiCad](https://www.kicad.org) My personal favorite schematic tool. Supplement with [my library of KiCad parts](KiCAD) for components you can't get in the basic library.
- [TinkerCAD](https://www.tinkercad.com/) TinkerCAD is an online simulation tool that allows you to simulate digital logic chips as well as do some software coding with the Arduino Uno. Information about TinkerCAD and its limitations is included in [DoctorPCOD/labs](labs) here on GitHub.
- [draw.io](https://app.diagrams.net) A nice app for creating flowcharts or block diagrams.

## Binary Codes

- [ASCII Code](https://www.ascii-code.com) A full table of ASCII code values in decimal, binary, octal and hexadecimal.
- [HD44780 Character Codes](https://github.com/DoctorPCOD/DoctorPCOD/blob/main/labs/HD44780_character_codes.pdf) A table of the character codes used in the hd44780 library. (It's similar to ASCII for the 7-bit values, and then completely different for the 8-bit values.)

## Analog to Digital Converter (ADC)

- 🎥 [Chaning ADMUX](https://youtu.be/nEmeM64WUjs) A video I made with a warning about using the ADC if you have to change the input channel in ADMUX.
- [Understanding ADC Parameters](https://ww1.microchip.com/downloads/en/Appnotes/atmel-8456-8-and-32-bit-avr-microcontrollers-avr127-understanding-adc-parameters_application-note.pdf) This application note from Microchip goes over the basic concepts of the ADC used in AVR 8-bit microcontrollers, and in particular delves into ADC error in a bit of detail.
- [ADC of megaAVR in Single-Ended Mode](https://ww1.microchip.com/downloads/en/Appnotes/AN2538-ADC-of-megaAVR-in-SingleEnded-Mode-00002538A.pdf) This application note from Microchip explains the single-ended successive-approximation register ADC used on the megaAVR microcontrollers.

## CPU Clock

- [Choosing a Microcontroller Clock](https://www.allaboutcircuits.com/technical-articles/choosing-the-right-oscillator-for-your-microcontroller/) An explanation of different types of oscillators and how to choose the right clock for your microcontroller project.

## Timer/Counter

- 🎥 [Input Capture Unit YouTube Video](https://youtu.be/eXE-8X38AHs) A video I made about the input capture unit. At the end it discusses the HC-SR04 ultrasonic sensor.
- [Setup and Use of AVR Timers](https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ApplicationNotes/ApplicationNotes/Atmel-2505-Setup-and-Use-of-AVR-Timers_ApplicationNote_AVR130.pdf) This application note from Microchip explains the basics of the timer/counters on AVR microcontrollers.
- [Skipped toggles using ATmega328P timer/counter 1 in CTC mode](https://doctor-pasquale.com/2025/04/29/skipped-toggles-using-atmega328p-timer-counter-1-in-ctc-mode/) This is a blog post I wrote about an issue I encountered due to the lack of double buffering when changing the value of `TOP` in CTC mode.

## Serial Peripheral Interface (SPI)

- [Setup and Use of the SPI (AVR Application Note 151)](https://onlinedocs.microchip.com/oxy/GUID-6F1B86DC-C230-43D1-A405-0CC2E7EDF7EE-en-US-2/index.html) This document has information about how the SPI protocol works on AVR 8-bit microcontrollers.

## Memory

- [NAND and NOR Flash](https://www.embedded.com/flash-101-nand-flash-vs-nor-flash/) The differences between NAND and NOR flash memory.

## Measurement Tools

- [How to Use an Oscilloscope](https://www.sparkfuneducation.com/how-to/how-to-use-an-oscilloscope.html) If using a ‘scope intimidates you, check out this reference that breaks it down into simple steps.
- [Oscilloscope Video (YouTube)](https://www.youtube.com/watch?v=hrw1PiU-Uow) I made a video on using the oscilloscope for circuit analysis students. It will walk you through the basics.
- [Oscilloscope Triggering (YouTube)](https://www.youtube.com/watch?v=RJG-hE7xms8) I made a video on triggering the oscilloscope, which is particularly useful if the dancing sinusoids are driving you crazy.

## Debugging

- [A Feynman approach to debugging](https://www.embedded.com/a-feynman-approach-to-debugging/) This article from embedded.com presents a debugging scenario that may be familiar to microcontrollers students.
- 📘 _If I Only Changed the Software, Why Is the Phone on Fire?_ by Lisa Simone – Along the same lines as the above example, this book is non-fiction but written in a story-like manner following software developers who have to debug and fix embedded systems projects. Some of the examples should be familiar to you if you’ve ever used a timer/counter ISR or unsigned char variables!

## C Resources

- [Guide to Software Commenting](https://www.ganssle.com/commenting.htm) Helpful advice on how to comment your software code.
- [Functions: Introduction to C Programming](https://www.cs.uic.edu/~jbell/CourseNotes/C_Programming/Functions.html) A comprehensive guide to writing functions in C.

## Assembly Resources

- [Microchip Studio](https://www.microchip.com/en-us/tools-resources/develop/microchip-studio) This is the definitive IDE for use with AVR microcontrollers. You can code in C and AVR assembly using this IDE. This would be our go-to IDE if it were easier to upload code onto the Arduino from this program. However, this IDE is required when writing AVR assembly. The IDE is free and highly recommended if you plan to write assembly code at home, or want to program for non-Arduino microcontrollers.
- [AVR Delay Loop Calculator](http://darcy.rsgc.on.ca/ACES/TEI4M/AVRdelay.html) Want to create a delay in your AVR assembly code and don’t know how? Put in your microcontroller clock frequency and desired delay time and this handy tool will spit out the necessary code to achieve that delay.[^3]
- [View Arduino IDE Code in Assembly](http://rcarduino.blogspot.com/2012/09/how-to-view-arduino-assembly.html) If you’re interested in how the Arduino IDE translates your C code to Assembly, follow these steps to look at the output. You’ll see that the Arduino IDE severely bloats your code with a lot of unnecessary instructions that you can eliminate by writing Assembly directly.[^4]

[^3]: Make sure the general purpose registers used in creating your delay aren't registers that you're otherwise using in your assembly code, otherwise, bad things may happen! Note that `LDI` instructions require GP Registers `r16` through `r31` as per the instruction set manual.
[^4]: If you need another reason to switch to Microchip Studio, Microchip Studio does this much easier and automatically when you write C code for an AVR microcontroller. Microchip Studios also has no code bloat!

## General Resources

- [Falsehoods that programmers believe in](https://github.com/kdeldycke/awesome-falsehood) A compendium of many incorrect or problematic assumptions programmers make, and how they can cause software to behave unpredictably or poorly.
- [Glossary of Electrical Engineering Terms](https://www.analog.com/en/resources/glossary.html) Definitions of many frequently used EE terms.
- [How to Read a Schematic](https://learn.sparkfun.com/tutorials/how-to-read-a-schematic) In case you aren’t sure what all of the circuit symbols mean, here is a handy guide explaining the most common circuit symbols.
- [Sine Lookup Table](https://daycounter.com/Calculators/Sine-Generator-Calculator.phtml) If you’ve ever wanted to generate a sine wave using digital values, use this to create a lookup table of numbers. Using the ATmega328P, you’ll need to build an external DAC (such as an R-2R ladder[^5]) connected to several digital pins.

[^5]: To learn how to build an R-2R ladder, refer to the [Circuit Analysis Lab Manual](https://doctor-pasquale.com/wp-content/uploads/2023/05/ENGIN-2210-Lab-Manual.pdf).

## Recommended Books and Textbooks
- _The Atmel AVR Microcontroller: MEGA and XMEGA in Assembly and C_ by Han-Way Huang
- _Atmel AVR Microcontroller Primer: Programming and Interfacing_ by Steven F. Barrett, Daniel J. Pack
- _AVR Microcontroller and Embedded Systems: Using Assembly and C_ by Muhammad Ali Mazidi, Janice Mazidi
- _Digital Logic & Microprocessor Design with Interfacing_ by Enoch O. Hwang
- _Introduction to Embedded Systems: Using ANSI C and the Arduino Development Environment_ by David Russell
- _Make: AVR Programming: Learning to Write Software for Hardware_ by Elliot Williams

# Advice from Former Students

I give my students surveys every semester and ask them to give advice to future microcontrollers students. This is what they have to say.

> Pace yourself. There is a lot to be done outside of lab, and unlike digital, it can be mostly done with a computer and compiler. Prepare ahead of time, and keep your lab manual/appendixes on hand.

> Utilize the drop-in labs to practice your coding skills on the Arduino. START YOUR LAB REPORTS EARLY!

> Don’t be afraid to ask questions. Put in the effort.

> Buying an Arduino or a clone at the start of the semester would be a great investment.

> Just practice as much as you can and start lab reports when the information is fresh in your mind.

> Go to as many drop ins as you can.

> Don't be late to class.

> Learn from your mistakes on labs and reports. Make sure you have a solid foundation of coding knowledge or you will suffer (I did not suffer but saw a student or 2 in particular that did).

> Don't watch other people code! Its more beneficial, even if you write the same thing, to have a version that you practiced on yourself!

> In general, try to work ahead. Doing lab reports the night before sucks, at least start on them early. Take pictures of lab circuits and comment your code correctly so you don't mess up circuit diagrams or other parts of the report. Also, work on the smart car as soon as you can, and if you are looking for a challenge, work ahead and try using ultrasonic sensors. If you can ensure you don't have other classes after lectures/during office hours, that will allow you to spend more time working on stuff.
