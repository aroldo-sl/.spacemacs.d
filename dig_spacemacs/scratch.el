;;; scratch.el --- Testing some simple Elisp features.  -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Aroldo Souza-Leite

;; Author: Aroldo Souza-Leite <aroldo@len-LM>
;; Keywords: Elisp

;; (add-to-list 'auto-mode-alist '("\\.xml\\'" . nxml-mode))
(defun greeting()
  (interactive) 
   (message "hello"))

(global-set-key (kbd "<f8> RET") 'greeting)


;; (let* ((a 15)
;;        (b -11)
;;        (c (+ a b)))
;;   (message "a+b=%s" c)
;;   )

(defun org-tell-if-checkbox()
  "Tells if there is a checkbox in this line."
  (interactive)
  (message "%s" (org-at-item-checkbox-p)))

(defun hallo()
(let* ((x 1)
      (y 2)
      (z (+ x y)))
(message "z=%s" z)))
(if nil (hallo))

(defun  asl/org-new-item-with-checkbox()
     (interactive)
     (end-of-line)
     (org-meta-return))




(defun derived-mode-parents (mode)
  (and mode
       (cons mode (derived-mode-parents
                   (get mode 'derived-mode-parent)))))
(message "%s" (derived-mode-parents 'python-mode))


;; Local Variables: 
;; eval: (hs-hide-all)
;; End:
;; (message "End of %s" (current-buffer))


