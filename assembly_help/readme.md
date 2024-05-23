Assembly can be tricky to get a handle on. I've decided to compile together some code to show the myriad ways that things can be done using assembly.

# Turning ON/OFF an LED based on the status of a pushbutton
- [Using polling and `CPI` (compare immediate)](https://github.com/DoctorPCOD/DoctorPCOD/blob/main/ENGIN-2223/lab13_circuit1.asm), this is the code given to you for Lab 13 Circuit I
- [Using polling and `CPSE` (compare, skip if equal)](https://github.com/DoctorPCOD/DoctorPCOD/blob/main/assembly_help/turn_on_led_polling_CPSE.asm)
- [Using polling and `SBIC` (skip if bit in I/O register is cleared)](https://github.com/DoctorPCOD/DoctorPCOD/blob/main/assembly_help/turn_on_led_polling_SBIC.asm)
- [Using `INT0` and `CPSE`](https://github.com/DoctorPCOD/DoctorPCOD/blob/main/assembly_help/turn_on_led_int0_cpse.asm)
- [Using `INT0` and `SBIC`](https://github.com/DoctorPCOD/DoctorPCOD/blob/main/assembly_help/turn_on_led_int0_sbic.asm)
- [Using `PCINT1` and `CPSE` and internal pull-up](https://github.com/DoctorPCOD/DoctorPCOD/blob/main/assembly_help/turn_on_led_pcint1_cpse.asm), otherwise the code is virtually identical to that given above using `INT0`
- [Using `PCINT1` and `SBIS` and internal pull-up](https://github.com/DoctorPCOD/DoctorPCOD/blob/main/assembly_help/turn_on_led_pcint1_sbis.asm), otherwise the code is virtually identical to that given above using `INT0`

# Toggling an LED ON/OFF at regular intervals
- [Using `CBI` and `SBI` and a `CALL` to a delay function](https://github.com/DoctorPCOD/DoctorPCOD/blob/main/assembly_help/toggle_led_cbi_sbi_call.asm)
- [Using exclusive OR and a `CALL` to a delay function](https://github.com/DoctorPCOD/DoctorPCOD/blob/main/assembly_help/toggle_led_eor_call.asm)
- Using exclusive OR and a timed interrupt
- Using the output compare pin on a timed interrupt
