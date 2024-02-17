# Project Schedule

Note the long gap between the plan and first demonstration. This is because we need to learn PWM before you can control the motor speed, which doesn't occur until midway through the semester. This is an ideal time to start gathering initial data from the Smart Car regarding the line sensors and whiskers (or ultrasonic sensors) and considering the overall plan of attack for the project.

| Description                                      | Week Due         | Points |
| :------------------------------------------------| :----------------| :------|
| Form design project groups                       | 2                |        |
| Design plan                                      | 4                | 20     |
| Barrier detection subsystem demonstration        | 10               | 20     |
| Barrier detection subsystem report               | 11               | 20     |
| Line detection and speed subsystem demonstration | 12               | 20     |
| Line detection and speed subsystem report        | 13               | 20     |
| Smart Car invitational (final demonstrations)    | 15               | 100    |
| Final project report                             | 16 (finals week) | 100    |

# General Requirements

- No hand-drawn schematics will be allowed.
- Use [draw.io](https://app.diagrams.net) (or an equivalent website or software) to create all block diagrams and flowcharts. Flowcharts must go into very specific detail; use the flowcharts given to you in lab as a guideline for the level of complexity that is expected.
- All reports must be written using word processing software (such as Microsoft Word), and must be written in paragraph form with complete sentences. (The Writing, Reading, Speech Assistance (WRSA) Center at COD's Learning Commons is a great resource if you are not comfortable with report writing. Keep in mind that technical writing is an important aspect of being an engineer, whether or not you believe it to be true at this stage in your career.)
- All reports must contain headings for each section that correspond to the sections required in the rubrics.
- All reports will be submitted as a PDF to Gradescope. Ensure that you select pages corresponding to each section. I have YouTube videos to explain how to do this using [the Gradescope app](https://youtu.be/oQ3h4JCz3O4) and [the Gradescope website](https://youtu.be/LT7-Cjfbgho).

# Schematics

Schematics must be created electronically. Following are suggestions of software you can use to create these. Use **schematics** view, not breadboard view! Be sure that all passive components (resistors, capacitors, etc.) are labeled.
- [KiCad](https://www.kicad.org)[^1]
- [Eagle](https://www.autodesk.com/products/eagle/free-download)
- Other software upon request, please ask me before using something else.

[^1]: Refer to my [KiCad library](https://github.com/DoctorPCOD/DoctorPCOD/tree/main/KiCAD) for parts and other KiCad information.

All schematics should be easy to read without criss-crossed wires. Examples of good and bad schematics are shown below.

## Bad Schematic :disappointed:

<img src="https://raw.githubusercontent.com/DoctorPCOD/DoctorPCOD/main/smart-car/bad_schematic.png" alt="Example of a bad schematic including cross-crossed wires." width="400">

## Good Schematic :smiley:

<img src="https://raw.githubusercontent.com/DoctorPCOD/DoctorPCOD/main/smart-car/good_schematic.png" alt="Example of a good schematic." width="400">

# Rubrics

## Design Plan

| Section                        | Description                                                        | Points |
| :------------------------------| :------------------------------------------------------------------| :------|
| Title Page                     | Includes the report title, team name, and all member names.        | 1      |
| Introduction                   | Describes what you will discuss in the report.                     | 1      |
| Block Diagram                  | Block diagram of all components used in your design, with arrows between them representing how each component communicates with the others. | 2 |
| Subsystem Flowcharts           | For each subsystem (barrier detection and line following) include a high-level flowchart of how you believe the it will work at this point. (You will add to this as you continue working on your project.) | 4 |
| Design Plan: Barrier Detection | Describe the functionality of the barrier detection subsystem. List all of the hardware components that you will need, and indicate if it is [included in your kit or not](https://github.com/DoctorPCOD/DoctorPCOD/blob/00c3be4459fa94c144db6620eb977ca3518ce958/smart-car/kit_contents.md). Include information that you think you will need to know before you can get your project running. (eg: how will you know on which side a barrier has been detected?) Explain your plan for accessing the components and obtaining any values that you may need. | 5 |
| Design Plan: Line Following    | Describe the functionality of the line following subsystem. List all of the hardware components that you will need, and indicate if it is [included in your kit or not](https://github.com/DoctorPCOD/DoctorPCOD/blob/00c3be4459fa94c144db6620eb977ca3518ce958/smart-car/kit_contents.md). Include information that you think you will need to know before you can get your project running. (eg: how will you know if the IR sensors are over tape or background?) Explain your plan for accessing the components and obtaining any values that you may need. | 5 |
| Challenges                     | Describe any anticipated challenges with your design project, and how they may be addressed. | 1 |
| Conclusion                     | Briefly describe the most notable things that were discussed in the report. | 1 |
