(define (remove-triples-not-equal-to sum triple)
	(filter (lambda (current-triple)
		(triple-sum-equal-to? sum current-triple))
		triple))