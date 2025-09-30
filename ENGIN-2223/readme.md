# Code templates

- [Lab 1 Circuit 1](lab1_circuit1.ino)
- [Lab 2 Circuit 1a](lab2_circuit1a.ino)
- [Lab 3 Circuit 1](lab3_circuit1.ino)
- [Lab 5 Circuit 1](lab5_circuit1.ino)
- [Lab 9 Circuit 1](lab9_circuit1.ino)
- [Lab 13 Circuit 1](lab13_circuit1.asm)
- [Lab 16 Circuit 1](lab16_circuit1.asm)
- [Lab 17 Circuit 1](lab17_circuit1.asm)

## LCD library files

- [hd44780.cpp](hd44780.cpp)
- [hd44780.h](hd44780.h)
- [hd44780_settings.h](hd44780_settings.h)

## BCD conversion in assembly

- [BCD between 0-999](binary-bcd.asm)
- [BCD between 0-9999](bcd_thousands_place.asm)

# Uploading code to Arduino using Arduino IDE
1. Write your code in Arduino IDE
2. Use CONTROL-T (command-T on Mac) to get nice clean auto-formatting
3. Ensure that the Arduino is plugged in to the computer or laptop via USB
4. Ensure that the Arduino IDE is using the correct board information
    1. In the menu, select tools
    2. Select boards
    3. Select Arduino Uno
5. Ensure that the Arduino IDE has the correct port for uploading code
    1. In the menu, select tools
    2. Select port
    3. Select whichever port says Arduino Uno
6. If unsure if the code will work, select Verify (checkmark icon or CONTROL-R)
7. Ensure that your code is properly indented and formatted by using CONTROL-T
8. Before uploading code to the board, ensure that nothing is connected to pin `D0` and pin `D1`
9. If you're sure that the code will work, select Upload (arrow icon or CONTROL-U)

# Checking program memory usage in Atmel/Microchip Studio
![screenshot showing how to check program memory usage in Atmel Studio](https://doctor-pasquale.com/wp-content/uploads/2022/06/Assembly-Program-Memory-Usage.png)
