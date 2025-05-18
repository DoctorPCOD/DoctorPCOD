# Pasquale Library Information

I am aware there are issues with this library and hope to address them in the summer and fall of 2025.

## Symbols Included
- 74279 (S'R' Latch)
- 74C922 (Keypad Encoder)
- 27C1024 (EPROM 64k x 16)
- Keypad / encoder PCB
- Debounced pushbutton PCB
- 0-99 BCD display PCB
- 16-segment display PCB
- RGB LED matrix PCB
- 16-key keypad

## How to Install
1. Download ZIP file
2. Unzip the file
3. Open KiCad
4. Click on Symbol Editor
5. Go to file -> add library...
6. Navigate to the unzipped file, click on open
7. When you create a schematic file, you will be able to access the new symbols, which are listed in the **Pasquale** library

## Request a Part
Contact Dr. P!

### Library Updates
- 2024-04-24: added 74C922, 16-key keypad, and RGB LED matrix display
- 2023-06-13: added 0-99 BCD display PCB
- 2023-03-18: added debounced pushbutton PCB
- 2023-01-31: created library

# Other KiCad Information

## MUX 7-Segment Display

If you search for display on the KiCad schematic editor, you'll see lots of options for displays. I don't need the exact part to be correct, just find a display that is MUX'd (has only 8 segment pins) and common cathode. See screenshot below for a good example.

<img src="https://raw.githubusercontent.com/DoctorPCOD/DoctorPCOD/main/KiCAD/CC-mux-display-kicad.png" alt="Screenshot of an appropriate MUX 7-semgnet display in KiCad." width=800>
