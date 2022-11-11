;;; asl_ln.el --- 	lines                            -*- lexical-binding: t; buffer-read-only: nil; -*-

;; Copyright (C) 2020  Aroldo Souza-Leite

;; Keywords: line lines word words 
;; Author: Aroldo Souza-Leite <aroldo@hp-lubuntu>
;; Description:
;;    line processing (also words in a line)
;;    Take a look also at the built-in 'join-lines'
;;    see also rst-delete-entire-line
;;    dito 'split-line'
;;    transpose-lines
;;    TODO: compare it whith the Emacs built-in 'kill-whole-line'
;;    delete-blank-lines
;;    delete-indentation
;; ;;;

;; ;;; <asl_ln-functions>
(defun asl/ln-mark()
 "Marks the current line.
  Uses 'set-mark', so that the other marks get lost."
 (interactive)
 (beginning-of-line nil)
 (set-mark (point))
 (end-of-line nil))
;; ;;;
(defun asl/ln-copy()
 "Copies the current line to the kill ring."
 (interactive)
 (setq start-point (point))
 (beginning-of-line 1)
 (setq beg (point))
 (end-of-line 1)
 (setq end (point))
 (copy-region-as-kill beg end)
 (goto-char start-point)
 (message "copied line to kill ring"))
;; ;;;
(defun asl/ln-repeat()
 "Inserts a copy of the current line below it."
  (interactive)
  (asl/ln-copy)
  (asl/ln-end)
  (newline)
  (yank))
;; ;;;
(defun asl/ln-transpose-up()
 "Transposes the current line and the previous one.
  see built-in function 'transpose-lines'"
  (interactive)
  (transpose-lines 1)
  (previous-line 2))
;; ;;;
(defun asl/ln-transpose-down()
 "Transposes the current line and the next one.
  see built-in function 'transpose-lines'"
  (interactive)
  (next-line)
  (transpose-lines 1)
  (previous-line 1))
;; ;;;
(defun asl/ln-split()
 "Like the built-in split-line"
  (split-line 1)
  (interactive)
  (next-line 1))
;; ;;;
(defun asl/ln-join()
 "Join this line to previous and fix up whitespace at join.
  Leaves one space between the joined lines.
  Uses the built-in 'join-line'
  " 
  (interactive)
  (join-line nil))
;; ;;;
(defun asl/ln-rtrim()
  "Trims the right side of the current line.
  ACHTUNG: if the line is not empty, a
  space is left before the newline charachter."
  (interactive)
  (end-of-line 1)
  (newline)
  (delete-indentation))
;; ;;;
(defun asl/ln-evaluate()
   "Lisp-evaluates the line as a region."
   (interactive)
   (progn 
     (setq start-point (point))
     (beginning-of-line)
     (setq beginning (point))
     (end-of-line)
     (setq end (point))
     (eval-region beginning end)
     (goto-char start-point)))
;; ;;; </asl_ln-functions>
;; ;;;
;; ;;; <asl_ln-aliases>
(defalias  'asl/ln-kill                    'kill-whole-line)
(defalias  'asl/ln-beginning               'beginning-of-line)
(defalias  'asl/ln-end                     'end-of-line)
(defalias  'asl/ln-linum-mode              'linum-mode)
(defalias  'asl/ln-eval-last-sexp          'eval-last-sexp)
(defalias  'asl/ln-word-transpose-words    'transpose-words)
(defalias  'asl/ln-word-mark               'mark-word)
(defalias  'asl/ln-word-kill               'kill-word)
(defalias  'asl/ln-open                    'open-line)
(defalias  'asl/ln-cycle-spacing           'cycle-spacing)
;; ;;; </asl_ln-aliases>

;; ;;; <asl_ln-keys>
(define-prefix-command 'asl/ln-)
(let ((bindings '(
                  (asl/ln- [(f7)])
                  (asl/ln-open [(f7) (o)])
                  (asl/ln-kill [(f7) (k)])
                  (asl/ln-cycle-spacing [(f7) (?\ )])
                  (asl/ln-repeat [(f7) (?2)])
                  (asl/ln-copy [(f7) (c)])
                  (asl/ln-transpose-up [(f7) (up)])
                  (asl/ln-transpose-down [(f7) (down)])
                  (asl/ln-beginning [(f7) (left)])
                  (asl/ln-beginning [(meta left)])
                  (asl/ln-end [(f7) (right)])
                  (asl/ln-end [(meta right)])
                  (asl/ln-join [(f7) (j)])
                  (asl/ln-split [(f7) (s)])
                  (asl/ln-rtrim [(f7) (-)]) 
                  (asl/ln-linum-mode [(f7) (n)])
                  (asl/ln-word-mark [(f7) (w)])
                  (asl/ln-word-kill [(f7) (deletechar)])
                  (asl/ln-mark [(f7) (m)])
                  (asl/ln-evaluate [(f7) (x)])
                  (asl/ln-word-transpose-words [(f7) (t)]))))
  (cl-loop for (cmd key) in bindings do (global-set-key key cmd)))
;; ;;; </asl_ln-keys>

;; ;;;
(provide 'asl_ln)

;; ;;; asl_ln.el ends heree
