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
        ; division
        [ 
            (string=? (car exp) "/" )
          (if (= (cadr stack) 0)
              (error "Division by zero error")
              (evaluate (cdr exp) (cons (/ (car stack) (cadr stack)) (cddr stack)) history))
        ]
        ; multiplication
        [
            ( string=? (car exp) "*" )
            ( evaluate (cdr exp) (cons (* (car stack) (cadr stack) ) (cddr stack)) history)
        ]
        
        [ 
            (char=? (car (string->list (car exp ))) #\$) 
            (evaluate (cdr exp) (cons (hist-find (car exp) history) stack) history)

        ] 
        
         ; handle "-" by multiplying the next number by -1
        [ 
            (char=? (car (string->list (car exp))) #\-)
            (evaluate (cdr exp) (cons (real->double-flonum (toNegative (car exp))) stack) history)
        ]

        
        ;history features
        [else (evaluate (cdr exp) (cons (real->double-flonum (string->number (car exp))) stack) history)]
        

    )
)
(define (toNegative str)
  (define num (string->number (list->string (cdr (string->list str)))))
  (* -1 num))  ; Return the negated number

(define (hist-find str history)
    (define strIndex ( list->string (cdr (string->list str)) ) )
    (define index (string->number strIndex))
    (real->double-flonum (list-ref history index) )
)

(define (batch-mode history index)
  (define user-input (read-line))
  (if (or (eof-object? user-input) (string=? user-input "quit"))
      (void)
      (let* ([expression (reverse (ssplit user-input))]
             [result (with-handlers ([exn:fail? 
                                       (lambda (e)
                                         (displayln "An error occurred during evaluation.")
                                         'error)])
                       (real->double-flonum (evaluate expression '() history)))])
        
        (unless (eq? result 'error)
          (displayln result))
        
        (batch-mode (if (eq? result 'error)
                        history
                        (append history (list result)))
                    (if (eq? result 'error)
                        index
                        (+ 1 index))))))


(define (repl history index) 
  (display "> ")
  (define user-input (read-line))

  (if (string=? user-input "quit") 
      (exit)
      (let* ([expression (reverse (ssplit user-input))]
             [result (with-handlers ([exn:fail? 
                                       (lambda (e)
                                         (displayln "An error occurred during evaluation.")
                                         'error)])
                       (real->double-flonum (evaluate expression '() history)))])
        
        (unless (eq? result 'error)  
          (display "$")
          (display index)
          (display " : ")
          (displayln result))
        
        (repl (if (eq? result 'error) 
                  history                  
                  (append history (list result)))
              (if (eq? result 'error)
                  index                    
                  (+ 1 index))))))


(define (main)
  (define args (vector->list (current-command-line-arguments)))
  (if (or (member "-b" args) (member "--batch" args))
      (batch-mode '() 0)
      (repl '() 0)))

(main)

