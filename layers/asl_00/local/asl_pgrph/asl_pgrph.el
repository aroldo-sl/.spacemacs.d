;;; asl_pgrph.el --- 	paragraph   -*- lexical-binding: t; buffer-read-only: t; -*-

;; Copyright (C) 2020  Aroldo Souza-Leite

;; Author: Aroldo Souza-Leite <aroldo@hp-lubuntu>
;; Keywords: paragraph

;; ;;; because asl_ln defines f7 as a prefix command key:
(require 'asl_ln)

;; ;;; <asl_pgrph-aliases>
(defalias 'asl_pgrph/backward 'backward-paragraph)
(defalias 'asl_pgrph/forward 'forward-paragraph)
(defalias 'asl_pgrph/end-kill 'kill-paragraph)
(defalias 'asl_pgrph/beginning-kill 'backward-kill-paragraph)
(defalias 'asl_pgrph/mark 'mark-paragraph)
(defalias 'asl_pgrph/transpose 'transpose-paragraphs)
(defalias 'asl_pgrph/comment-box 'comment-box)
;; ;;; </asl_pgrph-aliases>

;; ;;; <asl_pgrph-functions>
(defun asl_pgrph/backward-join()
   "Joins the current paragraph with previous."
   (interactive)
   (asl_pgrph/backward)
   (delete-blank-lines)
   (delete-blank-lines))
;; ;;;
(defun asl_pgrph/forward-join()
   "Joins the current paragraph with following."
   (interactive)
   (asl_pgrph/forward)
   (delete-blank-lines)
   (delete-blank-lines))
;; ;;;
(defun asl_pgrph/comment()
  "Comments the paragraph at point."
  (interactive)
  (progn
    (asl_pgrph/mark)
    (region-comment (point) (mark))))
;; ;;;
(defun asl_pgrph/uncomment()
  "Uncomments the paragraph at point."
  (interactive)
  (progn
    (asl_pgrph/mark)
    (region-uncomment (point) (mark))))
;; ;;;
(defun asl_pgrph/copy()
 "Copies the current paragraph to the kill ring."
 (interactive)
 (setq start-point (point))
 (asl_pgrph/backward 1)
 (setq beg (point))
 (asl_pgrph/forward 1)
 (setq end (point))
 (copy-region-as-kill beg end)
 (goto-char start-point)
 (message "copied paragraph to kill ring"))
;; ;;;
(defun asl_pgrph/repeat()
  (interactive)
  (progn (asl_pgrph/copy)
	 (forward-paragraph)
	 (yank)
         (backward-paragraph)))
;; ;;; </asl_pgrph-functions>

;; ;;; <asl_pgrph-keys>
(define-prefix-command 'asl_pgrph/)
(let ((bindings '(
                  (asl_pgrph/ [(f7) (p)])
                  (asl_pgrph/end-kill [(f7) (p) (deletechar)])
                  (asl_pgrph/beginning-kill [(f7) (p) (^)])
                  (asl_pgrph/forward-join [(f7) (p) (next)])
                  (asl_pgrph/backward-join [(f7) (p) (prior)])
                  (asl_pgrph/comment [(f7) (p) (\#)])
                  (asl_pgrph/uncomment [(f7) (p) (\')])
                  (asl_pgrph/comment-box [(f7) (p) (\*)])
                  (asl_pgrph/forward [(f7) (p) (down)])
                  (asl_pgrph/backward [(f7) (p) (up)])
                  (asl_pgrph/mark [(f7) (p) (m)])
                  (asl_pgrph/copy [(f7) (p) (c)])
                  (asl_pgrph/repeat [(f7) (p) (?2)])
                  (asl_pgrph/transpose [(f7) (p) (t)])
                  )))
  (cl-loop for (cmd key) in bindings do (global-set-key key cmd))
  )
;; ;;; </asl_pgrph-keys>

;; ;;;
(provide 'asl_pgrph)
;; ;;; asl_pgrph.el ends here.
