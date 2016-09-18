#lang racket

;;; Student Name: Jordan Van Duyne
;;;
;;; Check one:
;;; [x] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

(define operator-list
  (list (list 'ADD +)
  		(list 'SUB -)
  		(list 'MUL *)
  		(list 'DIV /)
  		(list 'GT  >)
  		(list 'LT  <)
  		(list 'GE >=)
  		(list 'LE <=)
  		(list 'EQ  =)
  		(list 'NEQ  (lambda (x y)   (not (= x y))))
  		(list 'ANND (lambda (x y)   (and x y)))
  		(list 'OR   (lambda (x y)   (or x y)))
  		(list 'IPH  (lambda (x y z) (if x y z)))))

(define (run-repl)
  (display "welcome to my repl. type some scheme-ish")
  (repl '()))

(define (repl defns)
  (display "> ")
  (display (myeval (read) defns))
  (newline)
  (repl defns))

(define (myeval sexpr defns)
  (get-value sexpr defns))

(define (my-assq key lst)
  (cond [(null? lst) #f]
  		[(eq? key (car (list-ref lst 0))) (cadr (list-ref lst 0))]
  		[else (my-assq key (list-tail lst 1))]))

(define (get-value x defns)
  (cond [(number? x) x]
  		[(boolean? x) x]
  		[(procedure? x) x]
  		[(symbol? x) (my-assq x defns)]
  		[(eq? (car x) 'DEFINE) (repl (append defns (list (list (cadr x) (get-value (car (cdr (cdr x))) defns)))))]
  		[else (apply (my-assq (car x) operator-list) (map (lambda (n) (get-value n defns)) (cdr x)))]))



(run-repl)




