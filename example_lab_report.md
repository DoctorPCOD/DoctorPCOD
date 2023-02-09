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

This code was provided to us to use by Dr. P. First, the code establishes the address locations for the `RESET` and `PINCHANGE1` interrupt routines. This is important so the code knows where to go when `PINCHANGE1` is triggerred by the pushbutton. The setup configures each I/O pin. The pins connected to the DIP switch have their corresponding `PORTx` register locations written HIGH to enable the internal pull-ups. The pins connected to the LEDs are configured as output pins using `DDRx`. Finally, the setup configures the `PCICR` and `PCMSK1` registers to configure the pin-change interrupt. The text of the `PINCHANGE1` interrupt service routine reads data from `PIND` (DIP switch) and inverts (because the internal pull-ups cause the DIP switch to be active-LOW).

# Circuit Diagrams

# Challenges

# Conclusion

# Feedback
