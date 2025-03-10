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
        [else (evaluate (cdr exp) (cons (real->double-flonum (string->number (car exp))) stack) history)]

    )
)

(define (hist-find str history)
    (define strIndex ( list->string (cdr (string->list str)) ) )
    (define index (string->number strIndex))
    (real->double-flonum (list-ref history index) )
)

(define (repl history index) 
  (display "> ")
  (define user-input (read-line))

  (if (string=? user-input "exit") 
      (exit)
      (let* ([expression (reverse (ssplit user-input))]
             [result (with-handlers ([exn:fail? 
                                       (lambda (e)
                                         (displayln "An error occurred during evaluation.")
                                         'error)])
                       (real->double-flonum (evaluate expression '() history)))])
        
        (unless (eq? result 'error)  
          (display "HistoryVal: $")
          (display index)
          (display "  | ANSWER: ")
          (displayln result))
        
        (repl (if (eq? result 'error) 
                  history                  
                  (append history (list result)))
              (if (eq? result 'error)
                  index                    
                  (+ 1 index))))))


; (evaluate (reverse '("-" "+" "+" "+" "5" "3" "6" "7" "10")) '())
(repl '() 0)