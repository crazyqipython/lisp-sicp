;(define rand
;	(let ((x random-init))
;		(lambda ()
;			(set! x (rand-update x))
;			x)))
			
(define rand
	(let ((x random-init))
	  (define (dispatch message)
		(cond ((eq? message 'generate)
		  (set! x (rand-update x))
		  x)
		((eq? message 'reset)
			(set! x new)
			(set! x (rand-update x))
			x))
		(else (error "message not understood"))))
	dispatch)