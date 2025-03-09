# 3:54PM March 9 2025

## Thoughts

- I sit here, the project only days away
- I have no ideas on what to do, from what I see it's a calculator with the hardest part being the history feature, but I think the most challenging part will most likely be the history feature, and getting used to the racket language

## The Plan Right Now

- Define the main components of this calculator and it's structure
- What parts would this calculator need
- I can define batch and interactive mode later as this seems easy in post as it's just changes to arg param and reading

## What Actions Am I Going To Take

- Well I guess I should start by the most basic part of the calculator, The read eval loop, and taking input

1. How to take input?
2. How to read user input?

## 5:50

- well I figured out how to take input

## The actions

- I guess I'm going to take a string (prefix notation) and try to evaluate it with trusting input

# 6:06 PM

- I've figured out a simple repl mechanism

## Next Steps

- Yeah I'm gonna start splitting strings based on white space
- Return results of the calculator

## What am I thinking?

- I say we have a evaluate function that evaluates a list in prefix notation so e.g. say I input "+ 2 3" as a string, it will be split by whitespace and then be a list of '(+ 2 3) in character format, then i will have functions based on the operations

## Future

- After this feature is done I will attempt to replicate for all major operations. And then I will try to add a history feature, which will be tough but oh well
