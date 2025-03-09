#lang racket

(define (repl)
    (display "> ")
    (define user-input (read-line))
    (displayln user-input )
    (if (string=? user-input "exit") 
    ; then
    (exit)
    ;else 
    (repl) )
    
)

(repl)