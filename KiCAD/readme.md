# Pasquale Library Information

## Symbols Included

Links go to each datasheet or informational page (which contains a schematic of the printed circuit board).

- ICs
  - [74279 (S'R' Latch)](https://doctor-pasquale.com/wp-content/uploads/2019/07/74279-Quad-SR-Latches.pdf)
  - [74C922 (Keypad Encoder)](https://doctor-pasquale.com/wp-content/uploads/2017/05/74922-16-KEY-ENCODER.pdf)
  - [27C1024 (EPROM 64k x 16)](https://doctor-pasquale.com/wp-content/uploads/2018/03/AT27C1024.pdf)
- Input devices
  - 16-key keypad
- PCBs
  - [Debounced pushbutton PCB](https://doctor-pasquale.com/debounced-pushbuttons/)
  - Keypad / encoder PCB
  - [BCD to 7-segment display PCB](https://doctor-pasquale.com/7-segment-decoder-and-display/)
  - [SPI 7-segment display PCB](https://doctor-pasquale.com/7-segment-display-serial-input/)
  - [0-99 BCD display PCB](https://doctor-pasquale.com/0-99-decoder/)
  - 16-segment display PCB
  - RGB LED matrix PCB

## How to Install
1. Download ZIP file
2. Unzip the file
3. Open KiCad
4. Click on Symbol Editor
5. Go to file -> add library...
6. Navigate to the unzipped file, click on open
7. When you create a schematic file, you will be able to access the new symbols, which are listed in the **Pasquale** library

## Request a Part
Contact Dr. P! Note that it may take me several days to over a month to add to this library depending on my workload.

### Library Updates
- 2025-05-24: added SPI to 7-segment display PCB and BCD to 7-segment display PCB
- 2024-04-24: added 74C922, 16-key keypad, and RGB LED matrix display
- 2023-06-13: added 0-99 BCD display PCB
- 2023-03-18: added debounced pushbutton PCB
- 2023-01-31: created library

# Other KiCad Information

## MUX 7-Segment Display

If you search for display on the KiCad schematic editor, you'll see lots of options for displays. I don't need the exact part to be correct, just find a display that is MUX'd (has only 8 segment pins) and common cathode. See screenshot below for a good example.

<img src="https://raw.githubusercontent.com/DoctorPCOD/DoctorPCOD/main/KiCAD/CC-mux-display-kicad.png" alt="Screenshot of an appropriate MUX 7-semgnet display in KiCad." width=800>
