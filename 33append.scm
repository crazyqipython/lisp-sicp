(define (append seq1 seq2)
	(accumulate cons seq2 seq1))