;Part1 ----------------------------------------------------------------------------

;checks the length of list is exactly 2
(defun isLL2 (q)
	(and (listp q) (equal (length q) 2))
)

;check the length is 2 and it's second element is list
(defun isLL2a (q)
		( and (isLL2 q) (listp (cadr q)))
)

