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

# 6:33PM

- After struggling with how I would design an algorithm, I ruminated for a bit and came to revelation.
- I simply need to evaluate a prefix notation.
- This is basically a leetcode problem
- In imperative programming, we would use a stack, but since we're in a functional language, we can use a list and call on that recursively to sort of use with a stack, (basically using a list and cons and cadr as push and pop. now the evaluation has become trivial)

## Work

- now I will design an evaluation method to evaluate a prefix notation quite easily.
- using stack method

## While Working (6:52 PM)

- yeah just working, i got the base case to be returning basically the stack, and some other stuff

# 7:11 PM

- i think i got the main logic, down just working with some dumb type errors

# 7:16PM

- YES! I've gotten the evaluate expression to work. this can now evaluate any prefix notation.
- now i can simply add this to the repl

## Future work

- I'm going to work on the history funciton, im thinking of mapping every string that starts with $ into it's original value

# 7:21PM

- defining some helper functions to clean input

# 7:40PM

- almost done just dealing with some issues
- some type errors

# 7:50PM

## What's happening

- I've given up on the cleaner functions and will just rely on doing it inside the evaluate function itself
- it will be easier to debug anyways

# 8:03PM

- History feature is almost done
- now just need to replace the values in the expression with history values

# 8:12PM

- history feature working, now need to read $ characters

# 8:25PM

- The history feature is complete, now I need to re-read the rubric and check if there are any missing requirements

## What's Missing

- There are a couple of things missing that should be fairly easy to fix

1. Make sure numbers are using floating point
2. Format History with <histId> : <result> (i'm going to put a dollar sign there just incase)
3. General error for evaluate func

# 8:42PM

- Well that's almost it
- I finished floating point
- I finished general error function
- All that's left is the history formatting

# 8:44PM

- Well yeah i pretty much finished, I don't think anything is left.
- Overall a pretty intense coding project.
  There were definetly times where I was frustrated and confused at how would I finish this, but the work is done.

# 8:48

- Well.. I was reading through the project and found out that there is no subtraction notation.....
- And i need to implement negative notation
- ehhh, i'm gonna call it a day
- I'll fix it tomorrow

## The Plan

- Remove notation of the subtraction
- Create helper function to be similar to evaluating $2 to instead multiplying the number by negative one when found
- yeah that's it
- should be esy but i'm too lazy to do it now

# March 14th 6:56PM

- Yeah I switched up the functionality so it includes negative numbers
- I finished it, now just implement batch mode and then submit

## Future Work

- batch mode
