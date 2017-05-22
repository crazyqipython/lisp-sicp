(define (lookup given-key set-of-records)
	(cond ((null? set-of-records) false)
		((equal? given-key (key (car set-of-records)))
			(car set-of-records))
		(else (lookup given-key (cdr set-of-records)))))
		
(define alphabet-record
	(list->tree '((1 'a) (3 'c) (4 'd) (7 'g) (8 'h))))

(define key car)

(define (lookup1 given-key tree-of-records)
	(cond ((null? tree-of-records) false)
		((= given-key (key (entry tree-of-records)))
			(entry tree-of-records))
		((< given-key (key (entry tree-of-records)))
			(lookup1 given-key (left-branch tree-of-records)))
		((> given-key (key (entry tree-of-records)))
			(lookup given-key (right-branch tree-of-records)))
		(else (error "this location should be unreachable"))))