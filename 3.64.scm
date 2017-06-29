(define (stream-limit s tolerance)
  (define (iter s)
    (let ((first (stream-car s))
	   (second (stream-car (stream-cdr s))))
	 (if (< (abs (- first second)) tolerance)
	   second
	   (iter (stream-cdr s)))))
	 (iter s))

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(define tolerance 0.000000001)