Following is an example lab report that I wrote for Lab 17. This should hopefully give you an example of how detailed to be when writing a lab report for ENGIN-2223. Note that it does not include text or schematics for every circuit, just one.

# Introduction
In this lab, the focus was learning to perform arthmetic operations on numbers that are more than 8 bits using AVR assembly. Specifically, we focused on addition. 

# Procedure and Results

## Circuit I

### Circuit Description

Circuit 1 displays the binary value of a DIP switch onto eight LEDs. The LEDs only change their values when a pushbutton is pressed, providing a rising-edge to the circuit.

### Hardware Description

The hardware consisted of a pushbutton connected to pin `A5`. The pushbutton was debounced using the PCB that Dr. P created that uses a resistor and capacitor to filter out high-frequency noise. A DIP switch was used to generate the 8-bit number. The DIP switch was connected to pins `D7`-`D0` and used internal pull-up resistors. Finally, eight LEDs were connected to pins `D8-D13` and `A0` and `A1`. Each one was connected in series with a 220 ohm current-limiting resistor.

### Software Description

This code was provided to us to use by Dr. P. First, the code establishes the address locations for the `RESET` and `PINCHANGE1` interrupt routines. This is important so the code knows where to go when `PINCHANGE1` is triggerred by the pushbutton. 

The setup configures each I/O pin. The pins connected to the DIP switch have their corresponding `PORTx` register locations written HIGH to enable the internal pull-ups. The pins connected to the LEDs are configured as output pins using `DDRx`. (Note that the pushbutton does not require configuring because it is an input device and has an external pull-down, so there is no need to enable an internal pull-up.) Finally, the setup configures the `PCICR` and `PCMSK1` registers to configure the pin-change interrupt. 

The text of the `PINCHANGE1` interrupt service routine reads data from `PIND` (DIP switch) and inverts (because the internal pull-ups cause the DIP switch to be active-LOW) and stores in GP register `r16` and `r17`. The data from `r16` is masked and written onto `PORTB`, where six of the LEDs are located. The data from `r17` is shifted right six times and written onto `PORTC` where the two most-significant LEDs are located. Finally, `RETI` is used to return from interrupt once all of this has been completed.

Note that the loop function causes an infinite loop where "nothing" happens. All of the functionality of the circuit takes place in the `PINCHANGE1` interrupt service routine.

# Circuit Diagrams

(https://github.com/DoctorPCOD/DoctorPCOD/blob/main/example_lab_schematic.png)

# Challenges

We initally weren't sure how to get the code to load onto the Arduino using Atmel Studio. We had to re-read the instructions online to remind ourselves how to configure the ports, and where to put the double quotes. In circuit IV, we had difficulty determining when there was an overflow in the sum register. My lab partner and I had to consider what binary (hex) value would lead to an overflow, and then create comparison logic using assembly to find that condition. 

# Conclusion

This lab was a thorough introduction to using more than 8-bit math using assembly. It also provided a good opportunity to see how things like pin-change interrupts work when using assembly, rather than C, like we did in lab 5.

# Feedback

I think it would be cool to do some other math, like subtraction. Maybe we could create a calculator like in lab 5, but do it using assembly?
