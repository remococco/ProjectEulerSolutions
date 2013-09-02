;; Problem 1                                                                                                                                                                                         
(defun multiples-of-three-and-five (n multiples)
  (if (>= n 1000)
      (apply '+ multiples)
      (if (or
            (eq (mod n 3) 0)
            (eq (mod n 5) 0))
          (multiples-of-three-and-five (+ n 1) (push n multiples))
          (multiples-of-three-and-five (+ n 1) multiples))))
          
(write (multiples-of-three-and-five 1 '()))
(write-line "")
