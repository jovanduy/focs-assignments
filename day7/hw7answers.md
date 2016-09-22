# FOCS Day 7 Homework
Jordan Van Duyne

## 1. FSA to Regular Expression

a. 01(11)\*0

b. 0\*10\*

c. 1\*

## 2. Parenthesis Matching

Note: the \ is shown to escape the ( and ) characters (in order to separate from the () used to group symbols).

a. (\\(\\))\*

b. ((\\(\\))\*(\\((\\(\\))\*\\))\*)\*

(([])\*([([])\*])\*)\*

(the one with brackets represents the same as the one without brackets where \( and \) are replaced by [ and ], respectively, to allow for easier reading)

c. (([])\* ([([])\*])\* ([([([])\*])\*])\*)\*

((\\(\\))\* (\\((\\(\\))\*\))\* (\\((\\((\\(\\))\*\\))\*\\))\*)\*

## 3. [optional] Challenge Problems
Assuming the language for each of these is ∑ = {0, 1}

* matches strings with an odd number of 1s

  1(11)\*

* matches strings with even number of 0s

 (00)\*

* matches strings with an odd number of 1s and and even number of 0s

 ((1(11)\*(00)\*)\*|((00)\*1(11)\*))\*

* matches strings with an odd number of 1s OR an even number of 0s

 (1(11)\*)|(00)\*

## 4. [optional] Regular Expression practice

## 5. [optional] Extended Regular Expressions
