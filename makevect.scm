(define make-vect cons)

(define xcor-vect car)

(define ycor-vect cdr)

(define (add-vect v1 v2)
	(make-vect (+ (xcor-vect v1) (xcor-vect v2))
				(+ (ycor-vect v1) (ycor-vect v2))))
				
(define (sub-vect v1 v2)
	(make-vect (- (xcor-vect v1) (xcor-vect v2))
				(- (ycor-vect v1) (ycor-vect v2))))
				
(define (scale-vect s v)
	(make-vect (* s (xcor-vect v))
				(* s (ycor-vect v))))
				
				
(define (frame-coord-map frame)
	(lambda (v)
		(add-vect
			(origin-frame frame)
			(add-vect (scale-vect (xcor-vect v)
								(edge1-frame frame))
					(scale-vect (ycor-vect v)
							(edge2-frame frame))))))