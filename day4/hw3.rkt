#lang racket

;;; Student Name: Jordan Van Duyne
;;;;
;;; Check one:
;;; [x] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

;;;;;;;;;;;
;; 1. assq

;; `assq` is a function that takes a key and an association list.
;;
;; It returns the corresponding key/value pair from the list
;; (*i.e.*, the pair whose key is *eq?* to the one it is given).
;;
;; If the key is not found in the list, `assq` returns `#f`.


(define operator-list
  (list (list 'ADD +)
        (list 'SUB -)
        (list 'MUL *)
        (list 'DIV /)
        (list 'GT >)
        (list 'LT <)
        (list 'GE >=)
        (list 'LE <=)
        (list 'EQ =)
        (list 'NEQ (lambda (x y) (not (= x y))))
        (list 'ANND (lambda (x y) (and x y)))
        (list 'ORR (lambda (x y) (or x y)))
        (list 'NOTT not)))


(define (my-assq key lst)
  (cond [(null? lst) #f]
  		[(eq? key (car (list-ref lst 0))) (list-ref lst 0)]
  		[else (my-assq key (list-tail lst 1))]))


(my-assq 'ADD operator-list);; --> '(ADD #<procedure:+>)
(my-assq 'ANND operator-list);; --> '(ANND #<procedure>)
(my-assq 'FOO operator-list);; --> #f



;;;;;;;;;;;
;; 2. lookup-list

;; Add the ability to look up symbols to your evaluator.
;;
;; Add the `lookup-list` argument to your hw2 evaluator (or ours, from the solution set).
;; `(evaluate 'foo lookup-list)` should return whatever `'foo` is associated with in `lookup-list`.

(define (calculate x)
  (cond [(eq? (car x) 'ADD) (+ (evaluate(car (cdr x))) (evaluate(car (cdr (cdr x)))))]
  		[(eq? (car x) 'SUB) (- (evaluate(car (cdr x))) (evaluate(car (cdr (cdr x)))))]
  		[(eq? (car x) 'MUL) (* (evaluate(car (cdr x))) (evaluate(car (cdr (cdr x)))))]
  		[(eq? (car x) 'DIV) (/ (evaluate(car (cdr x))) (evaluate(car (cdr (cdr x)))))]
  		[(eq? (car x) 'GT)  (> (evaluate(car (cdr x))) (evaluate(car (cdr (cdr x)))))]
  		[(eq? (car x) 'LT)  (< (evaluate(car (cdr x))) (evaluate(car (cdr (cdr x)))))]
  		[(eq? (car x) 'GE)  (>= (evaluate(car (cdr x))) (evaluate(car (cdr (cdr x)))))]
  		[(eq? (car x) 'LE)  (<= (evaluate(car (cdr x))) (evaluate(car (cdr (cdr x)))))]
  		[(eq? (car x) 'EQ)  (= (evaluate(car (cdr x))) (evaluate(car (cdr (cdr x)))))]
  		[(eq? (car x) 'NEQ) (not (= (evaluate(car (cdr x))) (evaluate(car (cdr (cdr x))))))]
  		[(eq? (car x) 'ANND) (and (evaluate(car (cdr x))) (evaluate(car (cdr (cdr x)))))]
		[(eq? (car x) 'ORR)  (or (evaluate(car (cdr x))) (evaluate(car (cdr (cdr x)))))]
		[(eq? (car x) 'NOTT) (not (evaluate(car (cdr x))))]
  		[(eq? (car x) 'IPH) (if (evaluate(car (cdr x))) (evaluate(car (cdr (cdr x)))) (evaluate(car (cdr (cdr (cdr x))))))]
  		[(eq? (car x) 'UMINUS) (* (evaluate(car (cdr x))) -1)]))


(define (evaluate x)
  (cond [(number? x) x]
  		[(boolean? x) x]
  		[else (calculate x)]))

