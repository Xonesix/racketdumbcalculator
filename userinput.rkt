#lang racket


(define (ssplit str) 
  (string-split str)
)

(define (evaluate-addition exp)
    ; base case?
    (cond
        (string=? (car exp) "+")
        ()
    )
)

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

(ssplit "+ 500 300")