(define (decode bits tree)
	(define (decode-1 bits current-branch)
		(if (null? bits)
			'()
			(let ((next-branch
				(choose-branch (car bits) current-branch)))
			   (if (leaf? next-branch)
					(cons (symbol-leaf next-branch)
						(decode-1 (cdr bits) tree))
					(decode-1 (cdr bits) next-branch)))))
    (decode-1 bits tree))

(define (choose-branch b branch)
		(cond ((= b 0) (left-branch branch))
			  ((= b 1) (right-branch branch))
			  (else (error "bad it "))))