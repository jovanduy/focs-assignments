#lang racket

;;; Student Name: Jordan Van Duyne
;;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [x] I completed this assignment with assistance from ___
;;;     and/or using these external resources: https://docs.racket-lang.org/reference/pairs.html

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
(my-assq 'x '((x 3) (y 2) (z -5)))


;;;;;;;;;;;
;; 2. lookup-list

;; Add the ability to look up symbols to your evaluator.
;;
;; Add the `lookup-list` argument to your hw2 evaluator (or ours, from the solution set).
;; `(evaluate 'foo lookup-list)` should return whatever `'foo` is associated with in `lookup-list`.

(define (calculate x lst)
  (cond [(eq? (car x) 'ADD) (+ (get-value (car (cdr x)) lst) (get-value (car (cdr (cdr x))) lst))]
  		[(eq? (car x) 'SUB) (- (get-value (car (cdr x)) lst) (get-value (car (cdr (cdr x))) lst))]
  		[(eq? (car x) 'MUL) (* (get-value (car (cdr x)) lst) (get-value (car (cdr (cdr x))) lst))]
  		[(eq? (car x) 'DIV) (/ (get-value (car (cdr x)) lst) (get-value (car (cdr (cdr x))) lst))]
  		[(eq? (car x) 'GT)  (> (get-value (car (cdr x)) lst) (get-value (car (cdr (cdr x))) lst))]
  		[(eq? (car x) 'LT)  (< (get-value (car (cdr x)) lst) (get-value (car (cdr (cdr x))) lst))]
  		[(eq? (car x) 'GE)  (>= (get-value (car (cdr x)) lst) (get-value (car (cdr (cdr x))) lst))]
  		[(eq? (car x) 'LE)  (<= (get-value (car (cdr x)) lst) (get-value(car (cdr (cdr x))) lst))]
  		[(eq? (car x) 'EQ)  (= (get-value (car (cdr x)) lst) (get-value(car (cdr (cdr x))) lst))]
  		[(eq? (car x) 'NEQ) (not (= (get-value (car (cdr x)) lst) (get-value (car (cdr (cdr x))) lst)))]
  		[(eq? (car x) 'ANND) (and (get-value (car (cdr x)) lst) (get-value (car (cdr (cdr x))) lst))]
		[(eq? (car x) 'ORR)  (or (get-value (car (cdr x)) lst) (get-value (car (cdr (cdr x))) lst))]
		[(eq? (car x) 'NOTT) (not (get-value (car (cdr x)) lst))]
  		[(eq? (car x) 'IPH) (if (get-value (car (cdr x)) lst) (get-value (car (cdr (cdr x))) lst) (get-value (car (cdr (cdr (cdr x)))) lst))]
  		[(eq? (car x) 'UMINUS) (* (get-value (car (cdr x)) lst) -1)]
  		[else (error "Unknown operator " (car x))]))

(define (get-value x lst)
  (cond [(not (eq? #f (my-assq x lst))) (get-value (list-ref (my-assq x lst) 1) lst)]
  		[(number? x) x]
  		[(boolean? x) x]
  		[else (evaluate x lst)]))


(define (evaluate expr lst)
  (cond [(list? expr) (calculate expr lst)]
  		[else (get-value expr lst)]))

(evaluate '(ADD x y) '((x 3) (y 2) (z -5)))
(evaluate '(IPH (GT x 0) x (SUB 0 x)) '((x 3) (y 2) (z -5)))
(evaluate 'y  '((x 3) (y 2) (z -5)))
(evaluate '(IPH (GT z 0) z (SUB 0 z)) '((x 3) (y 2) (z -5)))

