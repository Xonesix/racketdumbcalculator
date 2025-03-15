# How to Use

## Starting Up

- It's a prefix calculator
- run using interactive mode by using `racket userinput.rkt`
- run in batch mode by using `racket userinput.rkt -b` or `racket userinput.rkt --batch`

## Interactive Mode

- Type in a prefix expression separated with spaces. There's addition, multiplication and division (subtraction is just adding a negative number)
- You will see a history index `$<index>` this is the index for the number, you can use this in future expression e.g. say I evaluate `+ 2 3` to `$3 : 5` now any time after that I can run any expression and have `$3` and it will automatically replace it with `5`
  - That's the basic gist of interactive mode

## Batch mode

- Type in a prefix expression separated with spaces. There's addition, multiplication and division (subtraction is just adding a negative number)
- Result will be outputted
