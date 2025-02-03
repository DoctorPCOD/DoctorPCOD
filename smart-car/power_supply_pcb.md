# Power Supply PCB

This PCB contains a regulated VCC/GND supply for the microcontroller and other devices as well as the h-bridge (754410) chip with a pin header.

## Overview
The PCB contains the following components:

- 5 V voltage regulator -- this takes the voltage from the LiPo battery and regulates it to 5 V through the fuse
- battery connector -- this connects to the LiPo battery using the XT60 connector
- H-bridge pin header -- this header contains connections to the [H-bridge motor driver chip](https://doctor-pasquale.com/wp-content/uploads/2017/05/754410-QUAD-HALF-H-DRIVER.pdf), the silkscreen labels each individual connection
- 2 A slow blow fuse -- this fuse will blow if the current draw from the battery exceeds 2 A
- 754410 H-bridge motor driver chip with heatsink -- this is the [H-bridge motor driver chip](https://doctor-pasquale.com/wp-content/uploads/2017/05/754410-QUAD-HALF-H-DRIVER.pdf) and has a heatsink on top :warning: the heatsink may get hot so avoid touching it! this chip is powered directly by the LiPo battery and the regulated 5V supply
- terminal block to connect to Arduino -- use the terminal block to connect a barrel jack connector to the Arduino
- regulated VCC and GND pin header connections -- these are extra regulated VCC and GND connections in case you run out of regulated connections on the Arduino; these should also be capable of sourcing/sinking more current than the Arduino pins can

<img src="https://raw.githubusercontent.com/DoctorPCOD/DoctorPCOD/main/smart-car/pcb_components.png" alt="Diagram of each component on the PCB." width="400">


## Top View

The top view shows each of these components as connected to the board. All capacitors are bypass caps to reduce noise.

<img src="https://raw.githubusercontent.com/DoctorPCOD/DoctorPCOD/main/smart-car/pcb_top_view.png" alt="Photograph of the view of the power supply PCB." width="400">

## Side View
The side view showcases the terminal block you can use to connect to a barrel jack connector. The screws on the top of the terminal block can be loosened / tightened to connect to a jumper wire. The silk screen on the board indicates which connection is to VCC, and which is to GND.

<img src="https://raw.githubusercontent.com/DoctorPCOD/DoctorPCOD/main/smart-car/pcb_side_view.png" alt="Photograph of a side view of the power supply PCB highlighting the terminal block. The left side of the terminal block has a black jumper wire connected, and the right side of the terminal block has a red jumper wire connected." width="400">

## Schematic

<img src="https://raw.githubusercontent.com/DoctorPCOD/DoctorPCOD/main/smart-car/pcb_schematic.png" alt="Schematic of the power supply PCB." width="400">

## Board View

<img src="https://raw.githubusercontent.com/DoctorPCOD/DoctorPCOD/main/smart-car/pcb_board_view.png" alt="Board view of the power supply PCB." width="400">
