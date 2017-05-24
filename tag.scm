(define (attach-tag type-tag contents)
	(cons type-tag contents))
	
(define (type-tag datum)
	(if (pair? datum)
		(car datum)
		(error "bad tagged datum ")))
		
(define (contents datum)
	(if (pair? datum)
		(cdr datum)
		(error "bad tagged")))
	
(define (rectangular? z)
	(eq? (type-tag z) 'rectangular))
	
(define (polar? z)
	(eq? (type-tag z) 'polar))
	
	
(define (install-rectangular-package)
	(define (real-part z) (car z))
	(define (imag-part z) (cdr z))
	(define (make-from-real-imag x y) (cons x y))
	(define (magnitude z)
	(sqrt (+ (square (real-part z)) (square (image-part z)))))
	(define (angle z)
		(atan (image-part z) (real-part z)))
		
	(define (make-from-mag-ang r a)
		(cons (* r (cos a)) (* r (sin a))))
		
	(define (tag x) (attach-tag 'rectangular x))
	(put 'real-part '(rectangular) real-part)
	(put 'imag-part '(rectangular) imag-part)
	(put 'magnitude '(rectangular) magnitude)
	(put 'angle '(rectangular) angle)
	(put 'make-from-real-imag 'rectangular
			(lambda (x y) (tag (make-from-real-imag x y))))
	(put 'make-from-mag-ang 'rectangular
			(lambda (r a) (tag (make-from-mag-ang r a))))
	'(done))
	
(define (apply-generic op . args)
	(let ((type-tags (map type-tag args)))
		(let ((proc (get op type-tags)))
			(if proc
				(apply proc (map contents args))
				(error 
					"No match for these types")))))
					
(define (real-part z)
	(apply-generic 'real-part z))
(define (imag-part z)
	(apply-generic 'imag-part z))
(define (magnitude z)
	(apply-generic 'magnitude z))
(define (angle z)
	(apply-generic 'angle z))