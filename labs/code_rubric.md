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


## High Severity Issues
**Definition:** The code may stop functioning as expected under "normal" operating conditions.


## Medium Severity Issues
**Definition:** There may be specific instances where the code may not work as expected.

## Low Severity Issues
**Definition:** The code will use too much program or data memory. The code will take longer than needed to execute.

## Qualitative Issues
