# Code Rubric

In spring 2025, I am piloting an "ungrading" approach to grading each lab circuit. The stamp is used as proof of completion. Then, code will go through the rubric, outlined below. I hope that this will help with the following.
  1. Reduce arbitrariness around grading.
  2. Promote faster identification of major code issues.
  3. Provide students with a "flowchart" of debugging steps.

## Currently Unanswered Questions
As of October 2023, I haven't decided what impact heavy use of program or data memory will have on scores. Perhaps we'll decide as a class how to deal with this.

## The Rubric
The number of issues with the highest level of severity is what determines the score.

| Score | Code Quality                    |
|-------|---------------------------------|
| 100%  | No quantitative issues          |
|       | Up to 1 qualitative issue       |
| 75%   | 1-2 low severity issues OR      |
|       | Up to 2 qualitative issues      |
| 50%   | No or inaccurate code header OR |
|       | 1-2 medium severity issues OR   |
|       | 3-4 low severity issues OR      |
|       | Up to 3 qualitative issues      |
| 25%   | 1-2 high severity issues OR     |
|       | 3-4 medium severity issues OR   |
|       | 5-6 low severity issues OR      |
|       | Up to 4 qualitative issues      |
| 0%    | Any dealbreaker OR              |
|       | 3+ high severity issues OR      |
|       | 5+ medium severity issues OR    |
|       | 7+ low severity issues OR       |
|       | 5+ qualitative issues           |

## Dealbreakers
No credit is awarded if there's a dealbreaker.

- Anything that kills the code (e.g.: compiler error)
- No CTRL-T (improper indenting)
- No stamp
- Use of cheater functions

## Code Header Needs
- Description
  - All team member names
  - Date
  - Lab and circuit number
  - Description of the circuit
- List of I/O pins
  - Must be included
  - Must include all I/O pins used
  - Anything hard wired to a signal (e.g.: GND) must be listed

## Issues of Unknown Severity
The following issues will have to be taken on a case-by-case basis. Hopefully this will be updated based on what I witness in spring 2025.

- Incorrect register configuration of a peripheral
  - Incorrect prescaler

## High Severity Issues
**Definition:** The code may stop functioning as expected under "normal" operating conditions.

- Wrong data type
  - Data type is too small
  - Variable is `signed` when it should be `unsigned` (this is **high** severity if the variable could overflow)
  - Variable is `unsigned` when it should be `signed`
- Use of floating-point math
- Equation error
  - Incorrect math
  - Issue with integer math (e.g.: order of operations)
  - Not using `L` with `char` and `int`
  - Not using `LL` with long
  - Taking the modulo of negative number (or variable that can be negative)

## Medium Severity Issues
**Definition:** There may be specific instances where the code may not work as expected.

- Wrong data type
  - Data type is too large (e.g.: `int` when it should be `char`) for an array
  - Mismatch between data type in function argument vs. passed variable
  - Mismatch between function return type and returned variable
- Incorrect register configuration of a peripheral
  - Using free-running mode when needing to change `ADMUX` (this is **medium** severity if it's not accounted for elsewhere in code)

## Low Severity Issues
**Definition:** The code will use too much program or data memory. The code will take longer than needed to execute.

- Wrong data type
  - Data type is too large (e.g.: `int` when it should be `char`) for a non-array variable
  - Variable is signed when it should be unsigned (this is **low** severity if the variable cannot overflow)
- Incorrect register configuration of a peripheral
  - Using fast PWM with a motor
  - Enabling (but not using) the analog comparator
  - Using free-running mode when needing to change `ADMUX` (this is **low** severity if accounted for elsewhere in code)

## Qualitative Issues
