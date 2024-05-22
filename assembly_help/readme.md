Assembly can be tricky to get a handle on. I've decided to compile together some code to show the myriad ways that things can be done using assembly.

# Turning ON/OFF an LED based on the status of a pushbutton
- [Using polling and `CPI` (compare immediate), this is the code given to you for Lab 13 Circuit I](https://github.com/DoctorPCOD/DoctorPCOD/blob/main/ENGIN-2223/lab13_circuit1.asm)
- [Using polling and `CPSE` (compare, skip if equal)](https://github.com/DoctorPCOD/DoctorPCOD/blob/main/assembly_help/turn_on_led_polling_CPSE.asm)
- [Using polling and `SBIC` (skip if bit in I/O register is cleared)](https://github.com/DoctorPCOD/DoctorPCOD/blob/main/assembly_help/turn_on_led_polling_SBIC.asm)
- Using `INT0` and `CPSE`
- Using `INT0` and `SBIC`
- Using `PCINTx` and `CPSE`
- Using `PCINTx` and `SBIC`
