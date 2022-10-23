;;; asl_ln.el --- 	lines                            -*- lexical-binding: t; buffer-read-only: t; -*-

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
(defun asl_ln/mark()
 "Marks the current line.
  Uses 'set-mark', so that the other marks get lost."
 (interactive)
 (beginning-of-line nil)
 (set-mark (point))
 (end-of-line nil))
;; ;;;
(defun asl_ln/copy()
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
(defun asl_ln/repeat()
 "Inserts a copy of the current line below it."
  (interactive)
  (asl_ln/copy)
  (asl_ln/end)
  (newline)
  (yank))
;; ;;;
(defun asl_ln/transpose-up()
 "Transposes the current line and the previous one.
  see built-in function 'transpose-lines'"
  (interactive)
  (transpose-lines 1)
  (previous-line 2))
;; ;;;
(defun asl_ln/transpose-down()
 "Transposes the current line and the next one.
  see built-in function 'transpose-lines'"
  (interactive)
  (next-line)
  (transpose-lines 1)
  (previous-line 1))
;; ;;;
(defun asl_ln/split()
 "Like the built-in split-line"
  (split-line 1)
  (interactive)
  (next-line 1))
;; ;;;
(defun asl_ln/join()
 "Join this line to previous and fix up whitespace at join.
  Leaves one space between the joined lines.
  Uses the built-in 'join-line'
  " 
  (interactive)
  (join-line nil))
;; ;;;
(defun asl_ln/rtrim()
  "Trims the right side of the current line.
  ACHTUNG: if the line is not empty, a
  space is left before the newline charachter."
  (interactive)
  (end-of-line 1)
  (newline)
  (delete-indentation))
;; ;;;
(defun asl_ln/evaluate()
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
(defalias  'asl_ln/kill                    'kill-whole-line)
(defalias  'asl_ln/beginning               'beginning-of-line)
(defalias  'asl_ln/end                     'end-of-line)
(defalias  'asl_ln/linum-mode              'linum-mode)
(defalias  'asl_ln/eval-last-sexp          'eval-last-sexp)
(defalias  'asl_ln/word-transpose-words    'transpose-words)
(defalias  'asl_ln/word-mark               'mark-word)
(defalias  'asl_ln/word-kill               'kill-word)
(defalias  'asl_ln/open                    'open-line)
(defalias  'asl_ln/cycle-spacing           'cycle-spacing)
;; ;;; </asl_ln-aliases>

;; ;;; <asl_ln-keys>
(define-prefix-command 'asl_ln/)
(let ((bindings '(
                  (asl_ln/ [(f7)])
                  (asl_ln/open [(f7) (o)])
                  (asl_ln/kill [(f7) (k)])
                  (asl_ln/cycle-spacing [(f7) (?\ )])
                  (asl_ln/repeat [(f7) (?2)])
                  (asl_ln/copy [(f7) (c)])
                  (asl_ln/transpose-up [(f7) (up)])
                  (asl_ln/transpose-down [(f7) (down)])
                  (asl_ln/beginning [(f7) (left)])
                  (asl_ln/beginning [(meta left)])
                  (asl_ln/end [(f7) (right)])
                  (asl_ln/end [(meta right)])
                  (asl_ln/join [(f7) (j)])
                  (asl_ln/split [(f7) (s)])
                  (asl_ln/rtrim [(f7) (-)]) 
                  (asl_ln/linum-mode [(f7) (n)])
                  (asl_ln/word-mark [(f7) (w)])
                  (asl_ln/word-kill [(f7) (deletechar)])
                  (asl_ln/mark [(f7) (m)])
                  (asl_ln/evaluate [(f7) (x)])
                  (asl_ln/word-transpose-words [(f7) (t)]))))
  (cl-loop for (cmd key) in bindings do (global-set-key key cmd)))
;; ;;; </asl_ln-keys>

;; ;;;
(provide 'asl_ln)

;; ;;; asl_ln.el ends heree
