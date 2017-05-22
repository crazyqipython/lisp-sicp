(define (real-part z) (car z))

(define (image-part z) (cdr z))

(define (magnitude z)
	(sqrt (+ (square (real-part z)) (square (image-part z)))))
	
(define (angle z)
	(atan (image-part z) (real-part z)))
	
(define (make-from-real-image x y)
	(cons x y))
	
(define (make-from-mag-ang r a)
	(cons (* r (cos a)) (* r (sin a))))