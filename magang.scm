(define (real-part z)
	(* (magnitude z) (cos (angle z))))
	
(define (image-part z)
	(* (magnitude z) (sin (angle z))))
	
(define (magnitude z)
	(car z))
	
(define (angle z)
	(cdr z))
	
(define (make-from-real-image x y)
	(cons (sqrt (+ (square x) (square y)))
		(atan y x)))
		
(define (make-from-mag-ang r a) (cons r a))