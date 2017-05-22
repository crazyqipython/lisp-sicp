(define (cut-left-branch tree)
	(make-tree (entry tree)
		'()
		(right-branch tree)))
		
;;(cut-left-branch (list->tree '(1 2 3 4 5)))

(define (cut-right-branch tree)
	(make-tree (entry tree)
		(left-branch tree)
		'()))
		
;;(cut-right-branch (list->tree '(1 2 3 4 5)))

;;Union
(define (union-set-2 tree1 tree2)
  (cond ((null? tree1) tree2)
	((null? tree2) tree1)
	(else 
	 (let ((entry1 (entry tree1))
	       (entry2 (entry tree2))
	       (left1  (left-branch tree1))
	       (left2  (left-branch tree2))
	       (right1 (right-branch tree1))
	       (right2 (right-branch tree2)))
	   (cond ((= entry1 entry2)
		  (make-tree entry1 
			     (union-set-2 left1 left2)
			     (union-set-2 right1 right2)))
		 ((< entry1 entry2)
		  (union-set-2 
		   (make-tree entry2
			      (union-set-2 (cut-right-branch tree1)
					   left2)
			      right2)
		   right1))
		 ((< entry2 entry1)
		  (union-set-2 
		   (make-tree entry1
			      (union-set-2 (cut-right-branch tree2)
					   left1)
			      right1)
		   right2))
		 (else (error "Should be unreachable place.")))))))



(define (intersection-set-2 tree1 tree2)
  (cond ((or (null? tree1) (null? tree2)) '())
	(else 
	 (let ((entry1 (entry tree1))
	       (entry2 (entry tree2))
	       (left1  (left-branch tree1))
	       (left2  (left-branch tree2))
	       (right1 (right-branch tree1))
	       (right2 (right-branch tree2)))
	   (cond ((= entry1 entry2)
		  (make-tree entry1
			     (intersection-set-2 left1  left2)
			     (intersection-set-2 right1 right2)))
		 ((< entry1 entry2)
		  (union-set-2
		   (intersection-set-2 (cut-right-branch tree1)
				       left2)
		   (intersection-set-2 right1 tree2)))
		 ((< entry2 entry1)
		  (union-set-2
		   (intersection-set-2 (cut-right-branch tree2)
				       left1)
		   (intersection-set-2 right2 tree1)))
		 (else (error "Should be unreachable place.")))))))		 