(define (triple-sum-equal-to? sum triple)
	(= sum
		(+ (car triple)
			(cadr triple)
			(caddr triple))))