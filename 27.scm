(define (deep-reverse items)
		(cond ((null? items) '())
				((not (pair? items)) items)
				(else (reverse (list (deep-reverse (car items))
								     (deep-reverse (cadr items)))))))
									 

									 
