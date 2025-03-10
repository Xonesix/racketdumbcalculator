#lang racket

(define (ssplit str) 
  (string-split str)
)

(define (evaluate exp stack history)
    ; base case?
    (cond
        [ (empty? exp ) (car stack) ]

        ;addition
        [
            ( string=? (car exp) "+" )
            ( evaluate (cdr exp) (cons (+ (car stack) (cadr stack) ) (cddr stack)) history)
        ]
        ;subtraction
        [
            ( string=? (car exp) "-" )
            ( evaluate (cdr exp) (cons (- (car stack) (cadr stack) ) (cddr stack)) history)
        ]
        ; division
        [
            ( string=? (car exp) "/" )
            ( evaluate (cdr exp) (cons (/ (car stack) (cadr stack) ) (cddr stack)) history)
        ]
        ; multiplication
        [
            ( string=? (car exp) "*" )
            ( evaluate (cdr exp) (cons (* (car stack) (cadr stack) ) (cddr stack)) history)
        ]
         [ 
            (char=? (car (string->list (car exp ))) #\$) 
            (evaluate (cdr exp) (cons (hist-find (car exp) history) stack) history)

        ] ;history features
        [else (evaluate (cdr exp) (cons (string->number (car exp)) stack) history)]

    )
)

(define (hist-find str history)
    (define strIndex ( list->string (cdr (string->list str)) ) )
    (define index (string->number strIndex))
    (list-ref history index)
)

(define (repl history index) 
    (display "> ")
    (define user-input (read-line))


    (define expression (reverse (ssplit user-input)))


    (define result (evaluate expression '() history) )
    (display "HistoryVal: $")
    (display index)
    (display "  | ANSWER: ")
    (displayln result)
    
    (if (string=? user-input "exit") 
    ; then
    (exit)
    ;else 
    (repl (append history (list result)) (+ 1 index) ) )
    
)

; (evaluate (reverse '("-" "+" "+" "+" "5" "3" "6" "7" "10")) '())
(repl '() 0)