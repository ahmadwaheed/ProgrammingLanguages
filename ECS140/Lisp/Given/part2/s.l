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

