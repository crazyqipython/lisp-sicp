(define (square-of-four t1 tr b1 br)
	(lambda (painter)
		(let ((top (beside (t1 painter) (tr painter))))
			(bottom (beside (b1 painter) (br painter))))
		(below bottom top))))
		

(define (flipped-pairs painter)
	(let ((combine4 (square-of-four identity flip-vert
									identity flip-vert)))
	 (combine4 painter)))
	 
(define (square-limit painter n)
	(let ((combine4 (square-of-four flip-horiz identity
					rotate180 flip-vert)))
	(combine4 (corner-split painter n))))