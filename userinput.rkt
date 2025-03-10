#lang racket


(define (ssplit str) 
  (string-split str)
)

(define (evaluate exp stack)
    ; base case?
    (cond
        [(empty? exp ) (car stack) ]

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
        (else (evaluate (cdr exp) (cons (car exp) stack)) )

    )
)

;;; (define (repl)
;;;     (display "> ")
;;;     (define user-input (read-line))
;;;     (define expression (reverse (ssplit user-input)))
;;;     (displayln (evaluate expression '()) )
;;;     (if (string=? user-input "exit") 
;;;     ; then
;;;     (exit)
;;;     ;else 
;;;     (repl) )
    
;;; )

(evaluate '("+" "500" "300") '())