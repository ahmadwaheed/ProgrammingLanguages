;Part1 ----------------------------------------------------------------------------

;checks the length of list is exactly 2
(defun isLL2 (q)
	(and (listp q) (equal (length q) 2))
)

;check the length is 2 and it's second element is list
(defun isLL2a (q)
		( and (isLL2 q) (listp (cadr q)))
)


;Part2.1 : Whether q is a list of pairs -------------------------------------------

; Check base cases. Else if each car q is isLL2(), call recursively. Else ret nil
(defun isLpairs-recursive (q)
	(cond
		( (null q) t )
		( (not (listp q)) nil)
		( (isLL2 (car q)) (isLpairs-recursive (cdr q)) )
		( t nil )
	)

	;(if (null q)
	;	t
    ;   (if (isLL2 (car q))
	;	    (isLpairs-recursive (cdr q))
	;       (nil)
    ;   )
	;)
)


; Check base cases. Else if list, call iterr(), which does a do loop updating:
;       1. q1 = cdr q1      2. comparing prev valued res to current car q1 being pair
;       Loops until q1=null and returns res

(defun isLpairs-iterative (q)
	(defun iterr ()
		(do ((q1 q (cdr q1))
			 (res t (and res (isLL2 (car q1))))
			)

			((null q1) res)
		)
	)

	(if (null q)
		t
    	(if (not (listp q))
            nil
		    (if (listp q)
	    	    (iterr)
	            (nil))) )
)


; Check base cases. Calls every(), checking if each element of q matches isLL2()
(defun isLpairs-every (q)
	(if (null q)
	    t
	    (if (not (listp q))
	        nil
			(if (listp q)
				(every #'isLL2 q)
			    (nil))) )

)



;Part2.2 : Whether all lists of q have same 1st element -------------------------

; if regular recursive() rets t, then call recursivehelper() w/ params, else ret nil
; Did it this way b/c didn't want to call regular recursive() recursively...
(defun isLpairs1st-recursive (q)
	(cond
	    ((isLpairs-recursive q)
		    (recursivehelper (cdr q) (caar q)))
	    (t nil)
	)
)

; If x = caar of passed-in cdr q, then recursively call w/ params
(defun recursivehelper (q x)
	(cond
		((null q) t)
		((equal x (caar q)) (recursivehelper (cdr q)  x))
		(t nil)
	)
)



; if regular iterative() rets t, then call iterativehelper() w/ params, else ret nil
(defun isLpairs1st-iterative (q)
    (cond
	    ((isLpairs-iterative q)
		    (iterativehelper (cdr q) (caar q)))
	    (t nil)
	)
)

; same do loop portion from earlier
(defun iterativehelper (q x)
    (do ((q1 q (cdr q1))
         (res t (and res (equal x (caar q1))))
		)

		((null q1) res)
    )
)



; if regular every() returns t, then call everyhelper() w/ params, else ret nil
(defun isLpairs1st-every (q)
    (cond
	    ((isLpairs-every q)
	        (everyhelper q (caar q)))
	    (t nil)
	)
)

; lambda expression: comparing each car of element (y) of q with x ..(1st element)
(defun everyhelper (q x)
    (every #'(lambda (y)(equal x (car y))) q)
)



;Part3 ----------------------------
(defun distribute-recursive (q)
				(cond ((isLL2a q)

					(distribute_helper (car q) (cadr q)))

				(t nil))


)
(defun distribute_helper(x y)

			(if (null y)
				nil
				(if (listp y)
					(append (list (list x (car y))) (distribute_helper x (cdr y)))
					(nil))
)
)

(defun distribute-iterative (q)
				(cond ((isLL2a q)

					(distribute_iter_helper (car q) (cadr q)))

				(t nil))

)
(defun distribute_iter_helper (q x)
    (do ((q1 x (cdr q1))
         (res '() (append res (list (list q (car q1)))))
	)
		((null q1) res)
    )
)

(defun distribute-mapcar (q)

	(cond ((isLL2a q)
		(distribute_map_helper (car q) (cadr q)))		  
		 (t nil))
)
(defun distribute_map_helper (r s)  ; it makes the copy of element in first list if necessary 
					
	(mapcar #'(lambda (x) (list r x)) s)

)



;part4----------------------------
(defun undistribute-recursive (q)

	(cond ((null q) nil)
		((isLpairs1st-recursive q)
		(list (caar q) (undistribute_rec_helper q)))		  
		 (t nil))
)
(defun undistribute_rec_helper (q)  
	(if (null q) 
		nil 				
		 (cons (cadar q) (undistribute_rec_helper (cdr q)))  ;  cadar 
	)

)

;part4 second-----------------------
(defun undistribute-iterative (q)

	(cond ((null q) nil)
		((isLpairs1st-recursive q)
		 (list (caar q) (undistribute_iter_helper q)))	  
	        (t nil))
)
(defun undistribute_iter_helper (q)  
 
	(do ((q1 q (cdr q1))
		(res nil (append  res (list (cadar q1))))
	    )((null q1) res)
	)

)

;part4 third-------------------------
(defun undistribute-mapcar (q)

	(cond ((null q) nil)
		((isLpairs1st-recursive q)
		 (list (caar q) (undistribute_map_helper q)))	  
	        (t nil))
)
(defun undistribute_map_helper (q)  
 	;(setq r nil)
	(mapcar #'(lambda (x) (cadr x)) q)

)

;part5--------------------------------
;Implementing our own every function, where we call the function on car q and cdr of q

(defun my-every (fun q)
	(cond ((null q) t)
		((funcall fun (car q)) (my-every fun (cdr q)))
		(t nil) 
	)
)

;part6--------------------------------
;lenLL() returns 0 if q is not a list. Otherwise, it returns the maximum of q’s length, and the lngth of the longest list contained anywhere within q.

(defun lenLL (q)
	(cond
		((not (listp q)) 0)
		(t (max (lenLLpart q) (length q)) )
	)
)

(defun lenLLpart (q)
	(cond
		((null q) 0)
		((not (listp q)) 0)
		((not (listp (car q))) (lenLLpart (cdr q)))
		(t (len-helper q))		
		
	) 
)

(defun len-helper (q)
	(cond ((null q) (lenLLpart q))
		((not (list (car q))) (lenLLpart (cdr q)))
		(t (max (length (car q)) (max (lenLLpart (car q)) (lenLLpart (cdr q)))))
		
	)

)

;part7---------------------------
; Simplifying not. Not (nil) returns true. Not (t) returns nil. Call simplify-not recursively using car and cdr recursion, mapcar, and a helper function). If the list begins with an atom that is not "not", then the q is returned as is. 

(defun simplify-not (q)
	(cond 	
		((null q) nil)
		((not (listp q)) q)
		((equal (car q) 'not) (simplify_not_helper (mapcar #'simplify-not (cdr q))))	
		((atom (car q)) (append (list (car q)) (mapcar #'simplify-not (cdr q))))
		((listp (car q)) (append (mapcar #'simplify-not (car q)) (mapcar #'simplify-not (cdr q))))
		
		(t q)
	)
)

(defun simplify_not_helper (q)
	(cond 
		((equal (car q) 't)  nil)
		((equal (car q) 'nil)  t)
		(t (cons 'not q))
	)
)

