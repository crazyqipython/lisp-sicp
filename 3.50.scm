(define (stream-map proc . list-of-streams)
  (if (null? (car list-of-streams))
		'()
	   (cons-stream
	      (apply proc
		     (map (lambda (s)
					(stream-car s))
					list-of-streams))
			(apply stream-map 
			  (cons proc (map (lambda (s)
							(stream-cdr s))
						  list-of-streams))))))