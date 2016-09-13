#lang racket

;;; Student Name: Jordan Van Duyne
;;;
;;; Check one:
;;; [x] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

;;; 1.  Create a calculator that takes one argument: a list that represents an expression.

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
  		[(eq? (car x) 'AND) (and (evaluate(car (cdr x))) (evaluate(car (cdr (cdr x)))))]
		[(eq? (car x) 'OR)  (or (evaluate(car (cdr x))) (evaluate(car (cdr (cdr x)))))]
		[(eq? (car x) 'NOT) (not (evaluate(car (cdr x))))]
  		[(eq? (car x) 'IPH) (if (evaluate(car (cdr x))) (evaluate(car (cdr (cdr x)))) (evaluate(car (cdr (cdr (cdr x))))))]
  		[(eq? (car x) 'UMINUS) (* (evaluate(car (cdr x))) -1)]))


(define (evaluate x)
  (cond [(number? x) x]
  		[(boolean? x) x]
  		[else (calculate x)]))

(calculate '(ADD 3 4)) ;; --> 7

;;; 2. Expand the calculator's operation to allow for arguments that are themselves well-formed arithmetic expressions.

(calculate '(ADD 3 (MUL 4 5))) ;; --> 23   ;; what is the equivalent construction using list?
(calculate '(SUB (ADD 3 4) (MUL 5 6))) ;; --> -23

;;; 3. Add comparators returning booleans (*e.g.*, greater than, less than, …).
;; Note that each of these takes numeric arguments (or expressions that evaluate to produce numeric values),
;; but returns a boolean.  We suggest operators `GT`, `LT`, `GE`, `LE`, `EQ`, `NEQ`.

	(calculate '(GT (ADD 3 4) (MUL 5 6))) ;; --> #f
	(calculate '(LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6))))) ;; --> #t
;;	(calculate '(NEQ 2 3)) ;; --> #t
;;	(calculate '(NEQ 3 3)) ;; --> #f
;;	(calculate '(EQ 3 3)) ;;  --> #t
;;	(calculate '(EQ 2 3)) ;;  --> #f
	

;;; 4. Add boolean operations ANND, ORR, NOTT

(calculate '(AND (GT (ADD 3 4) (MUL 5 6)) (LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6)))))) ;; --> #f
(calculate '(AND (GT (ADD 3 4) (MUL 5 6)) (LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6)))))) ;; --> #f
(calculate '(NOT (AND (GT (ADD 3 4) (MUL 5 6)) (LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6))))))) ;; --> #t

;;; 5. Add IPH

(calculate '(IPH (GT (ADD 3 4) 7) (ADD 1 2) (ADD 1 3))) ;; -> 4

;;; 6. Add UMINUS
;		given a number input, UMINUS will negate that number
(calculate '(UMINUS 100)) ;; -> -100
(calculate '(UMINUS -3)) ;; --> 3
