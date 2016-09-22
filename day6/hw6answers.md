# FOCS Day 7 Homework Answers
Jordan Van Duyne

## 1. Nondeterministic automaton

![Nondeterministic automaton](images/NFA.png)

Q = {q<sub>0</sub>, q<sub>1</sub>, q<sub>2</sub>, q<sub>3</sub>, q<sub>4</sub>}

∑ = {0, 1}

𝛿 =

|               |         0       |                1               |
| ----          | ---             | ---                            |
| q<sub>0</sub> | {q<sub>0</sub>} | {q<sub>0</sub>, q<sub>1</sub>} |
| q<sub>1</sub> | {q<sub>2</sub>} |                 -              |
| q<sub>2</sub> | -               | {q<sub>3</sub>}                |
| q<sub>3</sub> | -               | {q<sub>4</sub>}                |
| q<sub>0</sub> | {q<sub>4</sub>} | {q<sub>4</sub>}                |

q<sub>0</sub> is the start state

F = {q<sub>4</sub>}; {q<sub>4</sub>} is the only accepting state

## 2. Conversion to deterministic automaton

![Deterministic automaton](images/DFA.png)

Q = {q<sub>0</sub>, q<sub>1</sub>, q<sub>2</sub>, q<sub>3</sub>, q<sub>4</sub>}

∑ = {0, 1}

𝛿 =

|                   |       0       |       1       |
| ----              | ---           | ---           |
| **q<sub>0</sub>** | q<sub>0</sub> | q<sub>1</sub> |
| **q<sub>1</sub>** | q<sub>2</sub> | q<sub>0</sub> |
| **q<sub>2</sub>** | q<sub>0</sub> | q<sub>3</sub> |
| **q<sub>3</sub>** | q<sub>0</sub> | q<sub>4</sub> |
| **q<sub>4</sub>** | q<sub>4</sub> | q<sub>4</sub> |

q<sub>0</sub> is the start state

F = {q<sub>4</sub>}; q<sub>4</sub> is the only accepting state

## 3. Larger alphabet

No, a machine that could accept strings over a larger alphabet would not be more powerful (assuming "more powerful" means able to do more/accept more/represent more). This is because you could encode characters of the larger alphabet as characters from the smaller alphabet. For example, you could encode the alphabet {a, b, c, d} as {00, 01, 10, 11}. The only difference would be that the automaton that could accept over the larger alphabet could be smaller (less states). Since the letters are now represented as strings of two numbers (0s and 1s), you need two states to represent every letter in the machine that can accept over the binary alphabet, whereas the machine that can accept over the larger alphabet just needs one state per letter.

Example: These two machines can accept the same strings if you represent the characters as the following: a = 00, b = 01, c = 10, d = 11.

![larger alphabet](images/3_letters.png)
![smaller alphabet](images/3_binary.png)

## 4. Challenge: Reverse

This problem was not required!

## 5. Reading

Did the reading! Woohoo.

## 6. Regular Expression Practice

0<sup>\*</sup>10<sup>\*</sup>
