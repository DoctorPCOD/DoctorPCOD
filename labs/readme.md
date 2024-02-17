# Lab Information

- [Lab manual [PDF]](https://doctor-pasquale.com/wp-content/uploads/2023/05/ENGIN-2223-Lab-Manual.pdf)
- [doctor-pasquale.com Microcontrollers Webpage](https://doctor-pasquale.com/engin-2223/) contains suggested resources for each lab, as needed

# Starter Code

- This is available at [DoctorPCOD/ENGIN-2223](https://github.com/DoctorPCOD/DoctorPCOD/tree/main/ENGIN-2223)

# Lab Reports

- Select the pages in your Gradescope submissions, otherwise I will deduct one point to pay for my manual labor of doing it myself!
  - [Video: How do do this using the Gradescope app](https://youtu.be/oQ3h4JCz3O4)
  - [Video: How to do this using gradescope.com](https://youtu.be/LT7-Cjfbgho)
- Read an example lab report to understand how I like things formatted.
- In your hardware section **be specific about how pushbuttons, DIP switches, toggle switches, or other digital input devices requiring a pull-up/down resistor are wired!**
  - External pull-down or pull-up. Note that we DO NOT USE 220 ohm pull-downs anymore. The ATmega328P requires less current than the TTL chips in digital, hence we use 10k ohm pull-downs now.
  - Internal pull-up. I should see this reflected in your code with the setting of the pull-up in the associated PORTx register.
  - Debounced pushbutton PCB.

# Schematics

- Approved software (must use schematics view)
  - KiCad
  - Eagle
  - If you have something else in mind, ask for my permission
- Symbols for special parts and additional information about components to use in KiCAD is available at [DoctorPCOD/KiCAD](https://github.com/DoctorPCOD/DoctorPCOD/tree/4d2a9d0bdce1ecdbc5682b49febf170fd6fb412d/KiCAD)
  - I can add additional symbols on request, but I need advance notice!
- In your schematics **be clear about how pushbuttons, DIP switches, toggle switches, or other digital input devices requiring a pull-up/down resistor are wired!**
  - External pull-down or pull-up. The signal pin (input) to the microcontroller connects between the pushbutton and the pull-down/pull-up. The input never connects directly to VCC or GND, which would give you a constant 1 or 0 value on the PINx register.
  - Internal pull-up. The signal pin (input) connects directly to one pushbutton pin, and the other pushbutton pin connects to ground.
  - Debounced pushbutton PCB. Either use the KiCad symbol available at [DoctorPCOD/KiCAD](https://github.com/DoctorPCOD/DoctorPCOD/tree/4d2a9d0bdce1ecdbc5682b49febf170fd6fb412d/KiCAD) or include the correct wiring in your schematic. The schematic below shows how the debounced pushbutton is wired. (If you use one button, you would only need to show the wiring for one pushbutton.)
 
<img src="https://i0.wp.com/doctor-pasquale.com/wp-content/uploads/2022/12/debounced-button-schematic.png">

# TinkerCAD

While [TinkerCAD](https://www.tinkercad.com) is admittedly quite slow, it is possible to write code in [TinkerCAD](https://www.tinkercad.com) for many of our circuits and simulate multiple hardware options. This can be nice if you're struggling with writing code and need more practice and don't have access to a lot of hardware.

Things TinkerCAD cannot do
- Use the hd44780 library (workaround: use the serial monitor to display strings)
- WDT
- SPI
- Input capture unit
- USART in SPI mode (USART does work in asynchronous mode)
 
## ADC in TinkerCAD

The ADC works, but you have to re-enable the ADC start conversion bit in `ADCSRA` after every conversion:

`ISR(ADC_vect) {`
`  result = ADC;`
`  ADCSRA |= 0x40;`
`}`
