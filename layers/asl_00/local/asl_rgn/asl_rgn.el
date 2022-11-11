;;; asl_rgn.el --- 	region                           -*- lexical-binding: t; buffer-read-only: nil; -*-

;; Copyright (C) 2020  Aroldo Souza-Leite

;; Author: Aroldo Souza-Leite <aroldo@hp-lubuntu>
;; Keywords:

;; ;;; because asl_ln defines f7 as an event base:
(require 'asl_ln) 

;; ;;; <asl_rgn-aliases>
(defalias 'asl/rgn-er/expand                'er/expand-region)
(defalias 'asl/rgn-kill                     'delete-region)
(defalias 'asl/rgn-exchange-point-and-mark  'exchange-point-and-mark)
(defalias 'asl/rgn-apply-macro-to-lines     'apply-macro-to-asl/rgn-lines)
(defalias 'asl/rgn-canonically-space        'canonically-space-region)
(defalias 'asl/rgn-comment                  'comment-region)
(defalias 'asl/rgn-uncomment                'uncomment-region)
(defalias 'asl/rgn-narrow-to                'narrow-to-region)
(defalias 'asl/rgn-widen                    'widen)
(defalias 'asl/rgn-shift-left               'evil-shift-left)
(defalias 'asl/rgn-shift-right              'evil-shift-right)
(defalias 'asl/rgn-delete-duplicate-lines   'delete-duplicate-lines)
(defalias 'asl/rgn-reverse                  'reverse-region)
(defalias 'asl/rgn-sort                     'sort-lines)
(defalias 'asl/rgn-beginning                'region-active-p)
(defalias 'asl/rgn-bounds                   'region-bounds)
(defalias 'asl/rgn-end                      'region-end)
(defalias 'asl/rgn-active-p                 'region-active-p)
(defalias 'asl/rgn-modifiable-p             'region-modifiable-p)
;; ;;; </asl_rgn-aliases>

;; ;;; <asl_rgn-functions>;;
(defun asl/rgn-evaluate()
   "Evaluate the region and issues a message.
    Uses 'asl/rgn-beginning' and 'asl/rgn-end'"
   (interactive)
   (eval-region (asl/rgn-beginning) (asl/rgn-end))
   (message "Lisp-evaluated region from %d to %d" (point) (mark)))
;; ;;;
(defun asl/rgn-newlines (top bottom)
  "Pledgiarized from apply-macro-to-lines in 'macro.el'
   Writes newlines in the region."
  (interactive "r")
  (setq end-marker-copy nil)
  (save-excursion
    (let ((end-marker (copy-marker bottom))
	        next-line-marker
           )
      (goto-char top)
      (if (not (bolp))
	  (forward-line 1))
      (setq next-line-marker (point-marker))
      (while (< next-line-marker end-marker)
	(goto-char next-line-marker)
	(save-excursion
	  (forward-line 1)
	  (set-marker next-line-marker (point)))
	(save-excursion
	  (let ((mark-active nil))
	    (newline))))
      (setq end-marker-copy end-marker)
      (set-marker end-marker nil)
      (set-marker next-line-marker nil)))
      ;;
      (set-marker-command end-marker-copy)
      (goto-char top))
;; ;;; <asl/rgn-functions>

;; ;;; <asl_rgn-keys>   
(define-prefix-command 'asl/rgn-)
(let ((bindings '(
                  (asl/rgn- [(f7) (r)]                   )
                  (asl/rgn-er/expand [(f7) (r) (e)]               )
                  (asl/rgn-comment [(f7) (r) (\#)]              )
                  (asl/rgn-uncomment [(f7) (r) (\')]              )
                  (asl/rgn-exchange-point-and-mark [(f7) (r) (.)]               )
                  (asl/rgn-narrow-to [(f7) (r) (n)]               )
                  (asl/rgn-widen [(f7) (r) (w)]               )
                  (asl/rgn-evaluate [(f7) (r) (x)]               )
                  (asl/rgn-newlines [(f7) (r) (N)]               )
                  (asl/rgn-canonically-space [(f7) (r) (?\ )]             )
                  (asl/rgn-delete-duplicate-lines [(f7) (r) (d)]               )
                  (asl/rgn-sort [(f7) (r) (s)]               )
                  (asl/rgn-reverse [(f7) (r) (r)]               )
                  (asl/rgn-kill [(f7) (r) (k)]               )
                  (asl/rgn-nxml-pretty-print [(f7) (r) (p)]               )
                  (asl/rgn-shift-right [(f7) (r) (control i)]       )
                  (asl/rgn-shift-left [(f7) (r) (backtab)]         )
    )))
  (cl-loop for (cmd key) in bindings do (global-set-key key cmd)))
;; ;;; </asl_rgn-keys>

;; ;;;
(provide 'asl_rgn)
;; ;;; asl_rgn.el ends here.

