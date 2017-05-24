(define (make-from-real-imag) 
	(define (dispatch op)
	  (cond	((eq? op 'real-part) x)
		((eq? op 'imag-part) y)
		((eq? op 'magnitude)
			(sqrt (+ (square x) (square y))))
		((eq? op 'angle) (atan y x))
		(else
			(error "Unkown op"))))
	dispatch)
	
	