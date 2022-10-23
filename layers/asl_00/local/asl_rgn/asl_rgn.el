;;; asl_rgn.el --- 	region                           -*- lexical-binding: t; buffer-read-only: t; -*-

;; Copyright (C) 2020  Aroldo Souza-Leite

;; Author: Aroldo Souza-Leite <aroldo@hp-lubuntu>
;; Keywords:

;; ;;; because asl_ln defines f7 as an event base:
(require 'asl_ln) 

;; ;;; <asl_rgn-aliases>
(defalias 'asl_rgn/er/expand                'er/expand-region)
(defalias 'asl_rgn/kill                     'delete-region)
(defalias 'asl_rgn/exchange-point-and-mark  'exchange-point-and-mark)
(defalias 'asl_rgn/apply-macro-to-lines     'apply-macro-to-asl_rgn/lines)
(defalias 'asl_rgn/canonically-space        'canonically-space-region)
(defalias 'asl_rgn/comment                  'comment-region)
(defalias 'asl_rgn/uncomment                'uncomment-region)
(defalias 'asl_rgn/narrow-to                'narrow-to-region)
(defalias 'asl_rgn/widen                    'widen)
(defalias 'asl_rgn/shift-left               'evil-shift-left)
(defalias 'asl_rgn/shift-right              'evil-shift-right)
(defalias 'asl_rgn/delete-duplicate-lines   'delete-duplicate-lines)
(defalias 'asl_rgn/reverse                  'reverse-region)
(defalias 'asl_rgn/sort                     'sort-lines)
(defalias 'asl_rgn/beginning                'region-active-p)
(defalias 'asl_rgn/bounds                   'region-bounds)
(defalias 'asl_rgn/end                      'region-end)
(defalias 'asl_rgn/active-p                 'region-active-p)
(defalias 'asl_rgn/modifiable-p             'region-modifiable-p)
;; ;;; </asl_rgn-aliases>

;; ;;; <asl_rgn-functions>;;
(defun asl_rgn/evaluate()
   "Evaluate the region and issues a message.
    Uses 'asl_rgn/beginning' and 'asl_rgn/end'"
   (interactive)
   (eval-region (asl_rgn/beginning) (asl_rgn/end))
   (message "Lisp-evaluated region from %d to %d" (point) (mark)))
;; ;;;
(defun asl_rgn/newlines (top bottom)
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
;; ;;; <asl_rgn/functions>

;; ;;; <asl_rgn-keys>   
(define-prefix-command 'asl_rgn/)
(let ((bindings '(
                  (asl_rgn/ [(f7) (r)]                   )
                  (asl_rgn/er/expand [(f7) (r) (e)]               )
                  (asl_rgn/comment [(f7) (r) (\#)]              )
                  (asl_rgn/uncomment [(f7) (r) (\')]              )
                  (asl_rgn/exchange-point-and-mark [(f7) (r) (.)]               )
                  (asl_rgn/narrow-to [(f7) (r) (n)]               )
                  (asl_rgn/widen [(f7) (r) (w)]               )
                  (asl_rgn/evaluate [(f7) (r) (x)]               )
                  (asl_rgn/newlines [(f7) (r) (N)]               )
                  (asl_rgn/canonically-space [(f7) (r) (?\ )]             )
                  (asl_rgn/delete-duplicate-lines [(f7) (r) (d)]               )
                  (asl_rgn/sort [(f7) (r) (s)]               )
                  (asl_rgn/reverse [(f7) (r) (r)]               )
                  (asl_rgn/kill [(f7) (r) (k)]               )
                  (asl_rgn/nxml-pretty-print [(f7) (r) (p)]               )
                  (asl_rgn/shift-right [(f7) (r) (control i)]       )
                  (asl_rgn/shift-left [(f7) (r) (backtab)]         )
    )))
  (cl-loop for (cmd key) in bindings do (global-set-key key cmd)))
;; ;;; </asl_rgn-keys>

;; ;;;
(provide 'asl_rgn)
;; ;;; asl_rgn.el ends here.

