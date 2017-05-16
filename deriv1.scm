(define (exponentiation? exp)
	(and (pair? exp) (eq? (car exp) '**)))
	
(define (base p) (cadr p))

(define (exponent p) (caddr p))

(define (make-exponentiation base exponent)
	(cond ((= exponent 0)
			1)
		  ((= exponent 1)
			base)
		  (else 
			(list '** base exponent))))


(define (deriv1 exp var)
	(cond ((number? exp)
			0)
		  ((variable? exp)
			(if (same-variable? exp var)
				1
				0))
		  ((sum? exp)
			(make-sum (deriv1 (addend exp) var)
					   (deriv1 (augend exp) var)))
		  ((product? exp)
			(make-sum
				(make-product (multiplier exp)
							  (deriv1 (multiplicand exp) var))
				(make-product  (deriv1 (multiplier exp) var)
								(multiplicand exp))))
			((exponentiation? exp)
				(let ((n (exponent exp))
					   (u (base exp)))
					 (make-product
						n
						(make-product
							(make-exponentiation
								u
								(- n 1))
							(deriv1 u var)))))
		(else
			(error "unknown expression type -- DERIV" exp))))
	