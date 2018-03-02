(defun print-filled-pathway-holes (filename)
  (tofile filename
	  (format t "Protein	Reaction~%")
	  (loop for enzrxn in (get-class-all-instances '|Enzymatic-Reactions|)
		when (fequal :pathway-hole-filler
			      (get-slot-value enzrxn 'basis-for-assignment))
		do (format t "~A	~A~%"
			   (get-frame-name (get-slot-value enzrxn 'enzyme))
			   (get-frame-name (get-slot-value enzrxn 'reaction))))))

(defun print-rxns-of-filled-pathway-holes (filename)
  (tofile filename
	  (format t "Reaction~%")
	  (loop for enzrxn in (get-class-all-instances '|Enzymatic-Reactions|)
		when (fequal :pathway-hole-filler
			      (get-slot-value enzrxn 'basis-for-assignment))
		do (format t "~A~%"
			   (get-frame-name (get-slot-value enzrxn 'reaction))))))
