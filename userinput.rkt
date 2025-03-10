#lang racket

(define (ssplit str) 
  (string-split str)
)

(define (evaluate exp stack)
    ; base case?
    (cond
        [ (empty? exp ) (car stack) ]

        ;addition
        [
            ( string=? (car exp) "+" )
            ( evaluate (cdr exp) (cons (+ (car stack) (cadr stack) ) (cddr stack)) )
        ]
        ;subtraction
        [
            ( string=? (car exp) "-" )
            ( evaluate (cdr exp) (cons (- (car stack) (cadr stack) ) (cddr stack)) )
        ]
        ; division
        [
            ( string=? (car exp) "/" )
            ( evaluate (cdr exp) (cons (/ (car stack) (cadr stack) ) (cddr stack)) )
        ]
        ; multiplication
        [
            ( string=? (car exp) "*" )
            ( evaluate (cdr exp) (cons (* (car stack) (cadr stack) ) (cddr stack)) )
        ]
        ; (char=? (car (string->list)) #/$) ;history features
        [else (evaluate (cdr exp) (cons (string->number (car exp)) stack))]

    )
)


(define (repl history index) 
    (display "> ")
    (define user-input (read-line))


    (define expression (reverse (ssplit user-input)))


    (define result (evaluate expression '()) )
    (display "$")
    (display index)
    (display "  | ANSWER: ")
    (displayln result)
    (display "CURRENT HISTORY: ")
    (display history)
    
    (if (string=? user-input "exit") 
    ; then
    (exit)
    ;else 
    (repl (append history (list result)) (+ 1 index) ) )
    
)

; (evaluate (reverse '("-" "+" "+" "+" "5" "3" "6" "7" "10")) '())
(repl '() 1)