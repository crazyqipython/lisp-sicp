(define (unique-triples n)
	(flatmap (lambda (i)
				(map (lambda (j)
						(cons i j))
						(unique-pairs (- i 1))))
			  (enumerate-interval 1 n)))
	
