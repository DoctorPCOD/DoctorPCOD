# Project Schedule

These dates are subject to change in case of school closings, global pandemics, or other unforeseen circumstances.

| Description                                      | Week Due         | Points |
| :------------------------------------------------| :----------------| :------|
| Form design project groups                       | 2                |        |
| Design plan                                      | 4                | 20     |
| Barrier detection subsystem demonstration        | 10[^1]           | 20     |
| Barrier detection subsystem report               | 11               | 20     |
| Line detection and speed subsystem demonstration | 12               | 20     |
| Line detection and speed subsystem report        | 13               | 20     |
| Smart Car invitational (final demonstrations)    | 15               | 100    |
| Final project report                             | 16 (finals week) | 100    |

[^1]: Note the long gap between the plan and first demonstration. This is because we need to learn PWM before you can control the motor speed, which doesn't occur until midway through the semester. This is an ideal time to start gathering initial data from the Smart Car regarding the line sensors and whiskers (or ultrasonic sensors) and considering the overall plan of attack for the project.

# General Requirements

- No hand-drawn schematics will be allowed.
- Use [draw.io](https://app.diagrams.net) (or an equivalent website or software) to create all block diagrams and flowcharts. Flowcharts must go into very specific detail; use the flowcharts given to you in lab as a guideline for the level of complexity that is expected.
- All reports must be written using word processing software (such as Microsoft Word), and must be written in paragraph form with complete sentences. (The Writing, Reading, Speech Assistance (WRSA) Center at COD's Learning Commons is a great resource if you are not comfortable with report writing. Keep in mind that technical writing is an important aspect of being an engineer, whether or not you believe it to be true at this stage in your career.)
- All reports must contain headings for each section that correspond to the sections required in the rubrics.
- All reports will be submitted as a PDF to Gradescope. Ensure that you select pages corresponding to each section. I have YouTube videos to explain how to do this using [the Gradescope app](https://youtu.be/oQ3h4JCz3O4) and [the Gradescope website](https://youtu.be/LT7-Cjfbgho).

# Schematics

Schematics must be created electronically. Following are suggestions of software you can use to create these. Use **schematics** view, not breadboard view! Be sure that all passive components (resistors, capacitors, etc.) are labeled.
- [KiCad](https://www.kicad.org)[^2]
- [Eagle](https://www.autodesk.com/products/eagle/free-download)
- Other software upon request, please ask me before using something else.

[^2]: Refer to my [KiCad library](https://github.com/DoctorPCOD/DoctorPCOD/tree/main/KiCAD) for parts and other KiCad information.

All schematics should be easy to read without criss-crossed wires. Examples of good and bad schematics are shown below.

## Bad Schematic :disappointed:

<img src="https://raw.githubusercontent.com/DoctorPCOD/DoctorPCOD/main/smart-car/bad_schematic.png" alt="Example of a bad schematic including cross-crossed wires." width="400">

## Good Schematic :smiley:

<img src="https://raw.githubusercontent.com/DoctorPCOD/DoctorPCOD/main/smart-car/good_schematic.png" alt="Example of a good schematic." width="400">

# Rubrics

## Design Plan Rubric

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

## Barrier Detection Demonstration

-  The car will move forward autonomously in a small L-shaped maze. It will enter on one side and exit on the other side, making a right-hand turn. The car must be able to accomplish this in less than 10 seconds.
-  The car will then travel through the L-shaped maze in the opposite direction, making a left-hand turn. The car must be able to accomplish this in less than 10 seconds.
-  Half credit will be awarded if the car travels through the maze in either direction between 10 and 20 seconds.
-  One quarter credit will be awarded if the car travels through the maze in either direction between 20 and 30 seconds.
-  Two LEDs will be mounted somewhere on your car. One will light if there was a barrier to the right, and the other will light if there was a barrier to the left.

### Due Date and Points

All students in a group must be present to receive credit for a demonstration. You can demonstrate this any time up to and including the deadline of the last class day of the week given in the schedule above for full credit, and up to and including the last class day of the following week for half credit. No credit is possible after the late deadline, although you will still be responsible for making this subsystem work before the semester's end.

| Demonstration                                                                                   | Points |
| :-----------------------------------------------------------------------------------------------| :------|
| Accomplished both left-hand and right-hand turns through the maze (within time limitation).     | 20     |
| Accomplished only left-hand turn or only right-hand turn through maze (within time limitation). | 10     |

The subsystem report will be due the last class day of the week given in the schedule above, regardless of when the demonstration was made. If your demo was late, your report will still be expected on time.

## Line Detection and Speed Subsystem Demonstration

- The car will follow a (roughly) 2 m long track (possibly consisting of 1 m of brown electrical tape followed by 1 m of black tape, possibly consisting of 2 m of the same color tape) both on a solid white background.
- The car must autonomously follow the tape and stop on its own with the line sensors no more than 1 cm past the end of the track. (As measured from the line sensors.)
- The following three tests need to be performed:
  - The car must travel along the entire length of the track in less than or equal to 8 seconds.
	- The car must travel along the entire length of the track in greater than or equal to 13 seconds.
  - The car must travel along the first half of track in less than or equal to 4 seconds, followed immediately by following the second half of track in greater than or equal to 6.5 seconds.
- Half credit will be awarded if the Smart Car travels the fast segments between `t` and `2t`, or if the Smart Car travels the slow segments between `t/2` and `t`.

### Due Date and Points

All students in a group must be present to receive credit for a demonstration. You can demonstrate this any time up to and including the deadline of the last class day of the week given in the schedule above for full credit, and up to and including the last class day of the following week for half credit. No credit is possible after the late deadline, although you will still be responsible for making this subsystem work before the semester's end.

| Demonstration                                                                                   | Points |
| :-----------------------------------------------| :------|
| Tests 1--3 within time limitations.             | 20     |
| Two out of three tests within time limitations. | 13     |
| One out of three tests within time limitations. | 6      |

The subsystem report will be due the last class day of the week given in the schedule above, regardless of when the demonstration was made. If your demo was late, your report will still be expected on time.

## Subsystem Report Rubric

| Section              | Description                                                                                           | Points |
| :--------------------| :-----------------------------------------------------------------------------------------------------| :------|
| Title Page           | Includes the report title, team name, and all member names.                                           | 1      |
| Introduction         | Describes the subsystem and what you will discuss in the report.                                      | 1      |
| Flowchart            | Flowchart of the full operation of the subsystem.                                                     | 2      |
| I/O Pins Used        | List all of the microcontroller pins that you've used and a description of what they're connected to. | 2      |
| Hardware Description | Describes ALL of the hardware components, include schematics, and explain what they are used for, and what pins they connect to on the microcontroller. | 3 |
| Software Description | Describes ALL subroutines, external functions, libraries, or other notable components to your software. Cites from where any external code was obtained. | 3 |
| Functionality        | Describes how the hardware and software interact to carry out the subsystem functions. Written in paragraph form, not as bullet points. | 2 |
| Challenges           | What challenges were encountered when creating this subsystem? Are there any unsolved problems? If so, how do you plan to solve them before the full system must be functioning? | 2 |
| Conclusion           | Briefly describe the most notable things that were discussed in the report.                           | 1 |
| Code (GitHub)        | Upload all of your well-documented code to your team's GitHub repository. Each student must join the team to receive individual credit. | 3 |
