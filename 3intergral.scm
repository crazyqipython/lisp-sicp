(define (random-in-range low high)
  (let ((range (- high low)))
	(+ low (random range))))
	
(define (make-point x y)
	(list x y))

(define (x-point point)
	(car point))
	
(define (y-point point)
	(cadr point))

(define (point-in-region? point region)
	(region point))
	
(define disk1 (lambda (point)
  (let ((x (x-point point))
    (y (y-point point)))
	(<= (+ (square (- x 5)) (square (- y 7)))
	 (square 3)))))

(define disk2 (lambda (point)
  (let ((x (x-point point))
		(y (y-point point))
	   (x-center 0)
	   (y-center 0)
	   (radius 1))
   (<= (+ (square (- x x-center))
    (square (- y y-center)))
	(square radius)))))
	
	
;; Rectangeles
(define (make-rectangle lower-left upper-right)
  (cons lower-left upper-right))
  
(define (lower-left rectangle)
  (car rectangle))

  
(define (upper-right rectangle)
  (cdr rectangle))
  
(define (x-lower rectangle)
	(x-point (lower-left rectangle)))
	
(define (x-upper rectangle)
	(x-point (upper-right rectangle)))
	
(define (y-lower rectangle)
	(y-point (lower-left rectangle)))
	
(define (y-upper rectangle)
	(y-point (upper-right rectangle)))
	
(define (width rectangle)
	(- (x-upper rectangle)
		(x-lower rectangle)))
		
(define (height rectangle)
	(- (y-upper rectangle)
		(y-lower rectangle)))
(define (area rectangle)
	(* (width rectangle)
		(height rectangle)))
		
(define (random-point-in-rectangle rectangle)
  (make-point (random-in-range (x-lower rectangle)
    (x-upper rectangle))
	(random-in-range (y-lower rectangle)
		(y-upper rectangle))))
		
(define (disk-hit-test disk rectangle)
	(point-in-region?
		(random-point-in-rectangle rectangle)
		disk))
		
(define (estimate-integral region-predicate rectangle trials)
  (let ((test (lambda () (disk-hit-test region-predicate
	rectangle))))
  (let ((hitfraction (monte-carlo trials test)))
	(* hitfraction (area rectangle)))))
	
(define (pi-estimate trials)
	(estimate-integral disk2 rect2 trials))