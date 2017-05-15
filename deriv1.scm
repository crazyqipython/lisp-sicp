(define (exponentiation? exp)
	(and (pair? exp) (eq? (car exp) '**)))
	
(define (base p) (cadr p))

(define (exponent p) (caddr p))


(define (deriv1 exp var)
	