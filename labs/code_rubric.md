# Code Rubric

This code rubric will be used to grade all software code, which will comprise the in-lab component of each lab grade. For circuits where I provide the code, all credit will be awarded based on the presence of the stamp.

This rubric and all lists may not be exhaustive and may be added to as the semester progresses.

## Currently Unanswered Questions
As of May 2025, I have not included program or data memory usage directly into the lab score. Generally, bloated code will be dinged for the issues that cause the code to be bloated in the first place. If you are interested, jump to the end of this file to get information on how much program and data memory used in the best code I could write as of May 2025.

## The Rubric
The severity level leading to the greatest score deduction will be the ultimate score determinant. (For example, code with 3 low severity issues and 1 medium severity issue will receive a grade of 50%.)

| Score | Code Quality                    |
|-------|---------------------------------|
| 100%  | Up to 1 qualitative issue OR    |
|       | Up to 1 low severity issue      |
| 75%   | 2-3 low severity issues OR      |
|       | Up to 2 qualitative issues      |
| 50%   | 1-2 medium severity issues OR   |
|       | 4-5 low severity issues OR      |
|       | Up to 3 qualitative issues      |
| 25%   | 1-2 high severity issues OR     |
|       | 3-4 medium severity issues OR   |
|       | 6-7 low severity issues OR      |
|       | Up to 4 qualitative issues      |
| 0%    | Any dealbreaker OR              |
|       | 3+ high severity issues OR      |
|       | 5+ medium severity issues OR    |
|       | 8+ low severity issues OR       |
|       | 5+ qualitative issues           |

## Dealbreakers
No credit is awarded if there's a dealbreaker.

- Anything that kills the code (e.g.: compiler error)
- No CTRL-T (improper indenting)
- No stamp
- Use of cheater functions
- No code header

## Code Header Needs
Issues with the code header will typically be qualitative. (For example, if your header has your team member names but no circuit description, I would consider that to be a qualitative issue.) If the code header is missing entirely, that's a dealbreaker.

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
- General syntax errors
- Timing issues based on having something in a loop vs. an ISR

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
  - Not using `LL` with `long`
  - Taking the modulo of negative number (or variable that can be negative)
  - Division by zero is allowed
- Failure to enable a peripheral the code assumes is enabled
- A function has a return type defined but no `return` statement (return type should be `void`)
- Lack of an ISR when an ISR is enabled
- Use of assignment instead of bitwise operators (when bitwise is required, for example with `PORTx` registers)
- Missing variable increment (e.g.: `x++`)
- Not accounting for zero-indexing of an array (allowing an array address to go out of bounds)
- Wrong type of control flow
- No use of `CLI`/`SEI` or saving `SREG` in an ISR (this may be **high** severity depending on context, likely high severity when absent around critical control flow or branching logic)
- Not enabling internal pull-ups (if external pull-downs or pull-ups are not used)
- Comparison logic issues
  - Assigning (`=`) instead of comparing (`==`)
- `if`/`else if`/`else` issues
  - `if`/`else if` not using mutually exclusive conditions
- Incorrect or conflicting keywords
  - Not using `static` on a local variable that requires this keyword
- Two variables with the same name
  - If one is global and the other is local
  - If both are local to the same function (i.e.: overwriting a variable)
- I/O issues
  - Not masking input data
- Incorrect array size
  - Character buffer in integer/long to string conversion has too few elements
- Enabling SPI on a primary device before configuring `SS` as an output pin

## Medium Severity Issues
**Definition:** There may be specific instances where the code may not work as expected.

- Wrong data type
  - Data type is too large (e.g.: `int` when it should be `char`) for an array
  - Mismatch between data type in function argument vs. passed variable
  - Mismatch between function return type and returned variable
- Incorrect register configuration of a peripheral
  - Using auto trigger enable mode when needing to change `ADMUX` (this is **medium** severity if it's not accounted for elsewhere in code)
- Use of continuous polling instead of an interrupt (this will not be enforced until interrupts have been taught in class)
- Incorrect use of bitwise AND to clear
- No use of `CLI`/`SEI` or saving `SREG` in an ISR (this may be **medium** severity depending on context)
- No use of `CLI`/`SEI` when writing to or reading from a 16-bit register
- Toggling a variable instead of setting or clearing a flag, register, or variable based on an actual value
- Checking for a value based on a variable instead of probing a pin or configuration register
- Incorrect or conflicting keywords
  - Not using `volatile` correctly
- Two variables with the same name
  - If both are local to different functions

## Low Severity Issues
**Definition:** The code will use too much program or data memory. The code will take longer than needed to execute.

- Wrong data type
  - Data type is too large (e.g.: `int` when it should be `char`) for a non-array variable
  - Variable is `signed` when it should be `unsigned` (this is **low** severity if the variable cannot overflow)
- Incorrect register configuration of a peripheral
  - Using fast PWM with a motor
  - Enabling (but not using) the analog comparator
  - Using auto trigger enable mode when needing to change `ADMUX` (this is **low** severity if accounted for elsewhere in code)
- A variable is global when it should be local
- Not using pointers in passing an array to a function
- `if`/`else if`/`else` issues
  - Using repeated `if` with mutually exclusive conditions
  - Using an empty `if` and filled `else` instead of using negative logic
  - Using `if` and an empty `else`
- Unnecessary nested control flow
- Incorrect or conflicting keywords
  - Not using `const` correctly
- Code is in the `loop` function that should be in the `setup` function
- Using conditional logic such as `if (a == 1)` instead of `if (a)` (comparing Boolean variables to `TRUE` or `1`)
- Incorrect array size
  - Character buffer in integer/long to string conversion has too many elements
- Declaring array indexed elements before or after declaring the array, rather than declaring them at the same time as the array[^4]
- Use of bitwise operators instead of assignment on registers that do not require bitwise operations (for example, most peripheral configuration registers as well as `DDRx`)
- Non-optimal use of variables
  - Using a new variable rather than just modifying an old one, when the old one doesn't need to be preserved (e.g.: `percent = ADC; newPercent = ADC / 100;`)
- Unnecessary or excessive delay(s)
  
## Qualitative Issues
Good vibes only. Here are some code vibe-killers. This is not an exhaustive list and I will likely add to it as I read other people's (but definitely not your) code.

- Hard to follow
  - No comments kill code that's hard to follow
- Incorrect or conflicting keywords
  - Using `static` on a global and/or `volatile` variable
- Copy/pasted code vs. external function or control flow
- Functions are given generic names that don't correspond to their functionality (for example, a function is called `external` or `externalFunction`)
- Ugly
  - `if (x) {some code; }` all on the same line (curly brackets are not needed if `some code` is on the same line as the `if` statement)
  - `signed int a = whatever;` (no need to use the keyword `signed` which is by default)
  - Double spacing
- Spaghetti 🍝 code
- Too much masking of interrupts
  - I can't define too much but I know it when I see it
- Variables that don't make sense
  - Example: two global variables labeled `x` and `y` with no comments, making me wonder what they do. Then I have to read through hundreds of lines of code before I see them being used and, if I'm lucky, figure it out by context. (True story.)
- Bloat
  - Assembly: doing two or more `SBI` instead of `LDI` and `OUT` (if assignment is appropriate) or three or more `SBI` instead of `LDI`, `AND`, and `OUT` (if assignment is not appropriate)
  - Assembly: using GP registers as storage instead of SRAM (this is OK until we have learned pointers)
  - Too much stuff in an ISR
  - A variable that isn't needed (e.g.: `a = VAR1 && VAR2` and then using `if(a)` instead of just `if (VAR1 && VAR2)`)
  - Using an external interrupt on a particiular trigger condition, and then probing for that trigger condition
- Hard-coding numbers instead of using a globally defined variable
- Not using compound operators
- Confusing / unclear / incorrect comments
- Use of binary or decimal instead of HEX with configuring registers
- Not commenting out or deleting old code or tests
  - In particular: serial monitor code
  - Leaving in the default Arduino IDE comments in the `setup` and `loop` functions
 
## Best-Case Code
These are the best-case values of program and data memory used in each lab and activity circuit, assuming I write the best possible code. Please feel free to prove that assumption incorrect by doing better than this!

Any circuits with data memory listed as "variable" is dependent on the number of entries in an array.

* Data with an asterisk next to it means I haven't updated these values in the Great Lab Overhaul of 2025.

### Labs

| Lab | Circuit | Program (B) | Data (B) |
|-----|---------|-------------|----------|
| 1   | 1       | 178         | 0        |
|     | 2       | 162         | 0        |
|     | 3       | 248         | 0        |
| 2   | 1a      | 148         | 0        |
|     | 1b      | 150         | 0        |
|     | 2       | 204         | 0        |
|     | 3       | 194         | 0        |
| 3   | 1       | 262         | 16       |
|     | 2       | 844         | 16       |
|     | 3       | 454         | 10       |
| 4   | 1       | 1192        | variable |
|     | 2       | 1210        | variable |
|     | 3       | 1260        | variable |
| 5   | 1       | 946         | 4        |
|     | 2       | 1166        | 6        |
|     | 3       | 238         | 0        |
|     | 4       | 254         | 0        |
| 6   | 1       | 1258        | variable |
|     | 2       | 2120[^1]    | 24       |
| 7   | 1       | 210         | 0        |
|     | 2       | 318         | 0        |
|     | 3       | 318         | 0        |
| 8   | 2       | 1924* [^3]   |	191*      |
|     | 3       | 2046* [^3]   |	232*      |
| 9   | 1       | 644*         | 20*       |
|     | 2       | 698*         | 10*       |
|     | 3 P     | 1278*        | 16*       |
|     | 3 S     | 1324*        | 16*       |
| 10  | 2       | 552*         | 10*       |
|     | 3       | 586*         | 10*       |
| 11  | 1       | 568*         | 13*       |
|     | 2       | 1578* [^3]   |	188*      |
| 12  | 1       | 1500*        | 26*       |
|     | 2       | 1714*        | 47*       |
|     | 3       | 2348*        | 30*       |
| 13  | 1       | 22*          | 0*        |
|     | 2       | 34*          | 0*        |
|     | 3       | 86*          | 0*        |

### Activities

Apparently I haven't recorded my data for activities 10, 11, and 15 as of October 2024. I hope to have this updated in summer 2025. There are also new activity circuits that need to be included in this list.

| Activity | Circuit | Program (B) | Data (B) |
|----------|---------|-------------|----------|
| 2		     |         | 518*         | 9*        |
| 4        |         | 626*         | 25*       |
| 5        |         | 1264*        | variable |
| 6        | 1       | 502*         | 9*        |
|          | 2       | 522*         | 9*        |
| 10       | 2       | ??          | ??       |
| 11       | ??      | ??          | ??       |
| 13       | 1       | 816*         | 21*       |
|          | 2       | 790*         | 21*       |
| 15       | 1       | ??          | ??       |
|          | 2       | ??          | ??       |

[^1]: My code will likely be more bloated than yours because I included extra conditional logic and LCD writes to display commas in numbers larger than 999.

[^3]: This code uses the serial monitor, which is a huge code bloater, both in terms of program and data memory.

[^4]: An example of "bad" pseudocode would be:
  `array[n] = {}; // empty array`
  `array[0] = variableA / 10;`
  `array[1] = variableB % 10;`
  `array[2] = variableC + 10; // etc.`
  An example of better pseudocode would be:
  `array[n] = {variableA / 10, variableB % 10, variableC + 10};`
