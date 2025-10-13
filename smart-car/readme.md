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
- All reports must be written using word processing software (such as Microsoft Word), and must be written in paragraph form with complete sentences.[^2] 
- All reports must contain headings for each section that correspond to the sections required in the rubrics.
- All reports will be submitted as a PDF. Refer to the class syllabus for work submission information.

[^2]: The Writing, Reading, Speech Assistance (WRSA) Center at COD's Learning Commons is a great resource if you are not comfortable with report writing. Keep in mind that technical writing is an important aspect of being an engineer, whether or not you believe it to be true at this stage in your career.

# Schematics

Schematics must be created electronically. Following are suggestions of software you can use to create these. Use **schematics** view, not breadboard view! Be sure that all passive components (resistors, capacitors, etc.) are labeled.
- [KiCad](https://www.kicad.org)[^3]
- Other software upon request, please ask me before using something else.

[^3]: Refer to my [KiCad library](https://github.com/DoctorPCOD/DoctorPCOD/tree/main/KiCAD) for parts and other KiCad information.

All schematics should be easy to read without criss-crossed wires. Examples of good and bad schematics are shown below.

## Bad Schematic :disappointed:

<img src="https://raw.githubusercontent.com/DoctorPCOD/DoctorPCOD/main/smart-car/bad_schematic.png" alt="Example of a bad schematic including cross-crossed wires." width="400">

## Good Schematic :smiley:

<img src="https://raw.githubusercontent.com/DoctorPCOD/DoctorPCOD/main/smart-car/good_schematic.png" alt="Example of a good schematic." width="400">

# Code

Each individual student must join the GitHub team to receive individual credit for the code portion of each report. When uploading code to GitHub for your smart car, do not upload multiple files for each subsystem. Remember that the point of GitHub is that it keeps track of changes, so you should keep the file name exactly the same, and just upload updated work as needed. For the barrier detection and line following subsystems, I want to see only **one** piece of code for each demonstration.[^4]

For the final demonstration: The final code upload to GitHub can consist of no more than four individual pieces of code[^4], labeled:
- Line Following
- Maze Demo
- Enhancement 1
- Enhancement 2

**I do not want to have to guess which file to grade in any of your reports.**

[^4]: The exception may be external library code, if relevant. Have a discussion with me if you're not sure.

# Rubrics

## Design Plan Rubric

| Section                        | Description                                                        | Points |
| :------------------------------| :------------------------------------------------------------------| :------|
| Title Page                     | Includes the report title, team name, and all member names.        | 1      |
| Introduction                   | Describes what you will discuss in the report.                     | 1      |
| Block Diagram                  | Block diagram of all components used in your design, with arrows between them representing how each component communicates with the others. | 2 |
| Subsystem Flowcharts           | For each subsystem (barrier detection and line following) include a high-level flowchart of how you believe it will work at this point. (You will add to this as you continue working on your project.) | 4 |
| Design Plan: Barrier Detection | Describe the functionality of the barrier detection subsystem. List all of the hardware components that you will need, and indicate if it is [included in your kit or not](https://github.com/DoctorPCOD/DoctorPCOD/blob/main/smart-car/kit_contents.md)). Include information that you think you will need to know before you can get your project running. (eg: how will you know on which side a barrier has been detected?) Explain your plan for accessing the components and obtaining any values that you may need. | 5 |
| Design Plan: Line Following    | Describe the functionality of the line following subsystem. List all of the hardware components that you will need, and indicate if it is [included in your kit or not](https://github.com/DoctorPCOD/DoctorPCOD/blob/main/smart-car/kit_contents.md)). Include information that you think you will need to know before you can get your project running. (eg: how will you know if the IR sensors are over tape or background?) Explain your plan for accessing the components and obtaining any values that you may need. | 5 |
| Challenges                     | Describe any anticipated challenges with your design project, and how they may be addressed. | 1 |
| Conclusion                     | Briefly describe the most notable things that were discussed in the report. | 1 |

## Barrier Detection Demonstration

-  The car will move forward autonomously in a small L-shaped maze. It will enter on one side and exit on the other side, making a right-hand turn. The car must be able to accomplish this in less than 8 seconds.
-  The car will then travel through the L-shaped maze in the opposite direction, making a left-hand turn. The car must be able to accomplish this in less than 8 seconds.
-  Half credit will be awarded if the car travels through the maze in either direction between 8 and 20 seconds.
-  One quarter credit will be awarded if the car travels through the maze in either direction between 20 and 30 seconds.
-  Two LEDs will be mounted somewhere on your car. One will light if there was a barrier to the right, and the other will light if there was a barrier to the left.

### Due Date and Points

Each student in a group must be present to receive individual credit for a demonstration. You can demonstrate this any time up to and including the deadline of the last class day of the week given in the schedule above for full credit, and up to and including the last class day of the following week for half credit. No credit is possible after the late deadline, although you will still be responsible for making this subsystem work before the semester's end.

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

Each student in a group must be present to receive individual credit for a demonstration. You can demonstrate this any time up to and including the deadline of the last class day of the week given in the schedule above for full credit, and up to and including the last class day of the following week for half credit. No credit is possible after the late deadline, although you will still be responsible for making this subsystem work before the semester's end.

| Demonstration                                   | Points |
| :-----------------------------------------------| :------|
| Tests 1-3 within time limitations.              | 20     |
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
| Hardware Description | Describes ALL of the hardware components, include schematics, and explain what they are used for, and what pins they connect to on the microcontroller. Any input(s) that require a pull-up or pull-down resistor must be explicitly explained with the type of resistor used and whether it was internal or external. | 3 |
| Software Description | Describes ALL subroutines, external functions, libraries, or other notable components to your software. Cites from where any external code was obtained. | 3 |
| Functionality        | Describes how the hardware and software interact to carry out the subsystem functions. Written in paragraph form, not as bullet points. | 2 |
| Challenges           | What challenges were encountered when creating this subsystem? Are there any unsolved problems? If so, how do you plan to solve them before the full system must be functioning? | 2 |
| Conclusion           | Briefly describe the most notable things that were discussed in the report.                           | 1 |
| Code (GitHub)        | Upload all of your well-documented code to your team's GitHub repository. Each student must join the team to receive individual credit. | 3 |

## Smart Car Invitational (Final Demonstrations)

Due to timing (this takes place during the last week of the semester), there will be no option for a late demonstration. Therefore, failure to complete the final demonstrations by the conclusion of the last week of classes means that you will receive a 0 for that portion of the demonstration. (Your team is welcome to make arrangements for early testing if that is necessary.) Each student in a group must be present to receive individual credit for a demonstration.

### Maze Demonstration

The maze will be created out of the same material used in the barrier detection subsystem demo. You will not know what the maze looks like until the last week of classes.

- The smart car will autonomously navigate through a maze (i.e. you cannot touch it while it is moving or that attempt will be disqualified). It will enter through one of the openings, and exit through the other one. It does not have to autonomously stop at the end.

| Time to Complete                 | Points |
| :--------------------------------| :------|
| Complete maze within 18 seconds. | 30     |
| Complete maze within 36 seconds. | 20     |
| Complete maze within 60 seconds. | 10     |

### Line-Following Demonstration

The maze will be created out of the same material used in the line-following subsystem demo. You will not know what the final track looks like until the last week of classes.

- The smart car must be able to autonomously navigate (i.e. you cannot touch it while it is moving or that attempt will be disqualified) a track consisting of tape on a solid background.
- The smart car must be able to stop with the line sensors no more than 1 cm past the end of the track. (As measured from the line sensors.)

| Time to Complete                  | Points |
| :---------------------------------| :------|
| Less than or equal to 20 seconds. | 30     |
| Less than or equal to 25 seconds. | 20     |
| Less than or equal to 30 seconds. | 10     |
| Greater than 30 seconds.          | 5      |

### Enhancements

Enhancements are worth 20 points each. The smart car must have **at least** two enhancements. The enhancements may be demonstrated at any time up to the last class day of the semester (before final exams). Any sensor-based enhancements must be properly calibrated. (I.E. a speedometer that gives a qualitative value for speed is not a valid enhancement.) Relevant circuit diagrams and software code must be submitted during the last week of the semester in order to receive credit for the corresponding enhancement.

#### Enhancement Ideas

This list of enhancement ideas is by no means exhaustive. Be creative in coming up with something new! Use your imagination... the sky's the limit!

- Speedometer and/or odometer using 7-segment display or LCD screen
- Use of magnetometer to have the Smart Car follow a magnet
- Execution of a 3-point turn after completing the track, the turn must be automatically conducted at the end of the track
- Remote steering of the car using IR or Bluetooth

## Final Report Rubric

| Section              | Description                                                                                           | Points |
| :--------------------| :-----------------------------------------------------------------------------------------------------| :------|
| Title Page           | Includes the report title, team name, and all member names.                                           | 2      |
| Introduction         | Describes the design project and what you will discuss in the report.                                 | 3      |
| Block Diagram        | Block diagram of all smart car components and how they communicate with each other.                   | 5      |
| Flowchart            | Flowchart of the full operation of the smart car.                                                     | 5      |
| I/O Pins Used        | List all of the microcontroller pins that you've used and a description of what they're connected to. (If you have separate lists for each demonstration, then you may break this into sections.) | 2 |
| Hardware Description | Describes **all** of the hardware components, include circuit diagrams, and explain what they are used for, and what pins they connect to on the microcontroller. (Very large circuit diagrams may be included in an appendix and referenced here.) Any input(s) that require a pull-up or pull-down resistor must be explicitly explained with the type of resistor used and whether it was internal or external. | 10 |
| Software Description | Describes **all** subroutines, external functions, libraries, or other notable components to your software. Cites from where any external code was obtained. Explain the basis of any and all constants or other parameters used in your software code. (E.G. How did you obtain the track threshold value?) If one or more demonstration did not work, explain what aspects of the code worked, which aspects of the code did not work, and what you think the software issue(s) may be and why. | 10 |
| Peripherals          | Explain any peripherals used (ADC, TCNT, etc.), what hardware they're used with (if applicable), and explain frequencies, modes of operation, etc. There is no need to give exact register configuration values. | 5 |
| Functionality        | Describes how the hardware and software interact to carry out the design project functions. Explain whether or not you successfully completed the maze and/or track requirements, and how much time it took to complete each of these demos. If one or more demonstration was not successfully completed, explain what you would have done to attempt to meet the requirements if you'd had more time. | 5 |
| Design Changes       | Describes what changes were made after the barrier detection demonstration and before the final maze demonstration, and the changes that were made after the line detection demonstration and before the final line following demonstration. How and why were these changes made? | 5 |
| Feedback Control     | Comment on the use of P, PI, or PID control in your project (how and in what subsystems was it used?). Explain the parameters used and how they were determined. Describe how the use of feedback control improved the functionality of your project. | 10 |
| Enhancement 1        | Describe the first enhancement, including a schematic and an explanation of all software code used. If the enhancement did not work, explain what aspects of the code worked, which aspects of the code did not work, and what you think the software issue(s) may be and why. What would you have changed if you'd had more time? | 10      |
| Enhancement 2        | Describe the second enhancement, including a schematic and an explanation of all software code used. If the enhancement did not work, explain what aspects of the code worked, which aspects of the code did not work, and what you think the software issue(s) may be and why. What would you have changed if you'd had more time? | 10      |
| Challenges           | What challenges were encountered throughout the design process? Are there any unsolved problems? If so, how would you have done things differently to avoid them? | 5 |
| Conclusion           | Briefly describe the most notable things that were discussed in the report.                           | 5       |
| Code (GitHub)        | Upload all of your well-documented code to your team's GitHub repository. Each student must join the team to receive individual credit. | 10 |
