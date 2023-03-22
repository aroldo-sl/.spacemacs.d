;;; asl_pgrph.el --- 	paragraph   -*- lexical-binding: t; buffer-read-only: nil; -*-

;; Copyright (C) 2020  Aroldo Souza-Leite

;; Author: Aroldo Souza-Leite <aroldo@hp-lubuntu>
;; Keywords: paragraph

;; ;;; because asl_ln defines f7 as a prefix command key:
(require 'asl_ln)

;; ;;; <asl_pgrph-aliases>
(defalias 'asl/pgrph-backward 'backward-paragraph)
(defalias 'asl/pgrph-forward 'forward-paragraph)
(defalias 'asl/pgrph-end-kill 'kill-paragraph)
(defalias 'asl/pgrph-beginning-kill 'backward-kill-paragraph)
(defalias 'asl/pgrph-mark 'mark-paragraph)
(defalias 'asl/pgrph-transpose 'transpose-paragraphs)
(defalias 'asl/pgrph-comment-box 'comment-box)
;; ;;; </asl_pgrph-aliases>

;; ;;; <asl_pgrph-functions>
(defun asl/pgrph-backward-join()
   "Joins the current paragraph with previous."
   (interactive)
   (asl/pgrph-backward)
   (delete-blank-lines)
   (delete-blank-lines))
;; ;;;
(defun asl/pgrph-forward-join()
   "Joins the current paragraph with following."
   (interactive)
   (asl/pgrph-forward)
   (delete-blank-lines)
   (delete-blank-lines))
;; ;;;
(defun asl/pgrph-comment()
  "Comments the paragraph at point."
  (interactive)
  (progn
    (asl/pgrph-mark)
    (asl/rgn-comment (point) (mark))))
;; ;;;
(defun asl/pgrph-uncomment()
  "Uncomments the paragraph at point."
  (interactive)
  (progn
    (asl/pgrph-mark)
    (asl/rgn-uncomment (point) (mark))))
;; ;;;
(defun asl/pgrph-copy()
 "Copies the current paragraph to the kill ring."
 (interactive)
 (setq start-point (point))
 (asl/pgrph-backward 1)
 (setq beg (point))
 (asl/pgrph-forward 1)
 (setq end (point))
 (copy-region-as-kill beg end)
 (goto-char start-point)
 (message "copied paragraph to kill ring"))
;; ;;; BUGGY:
;; (defun asl/pgrph-repeat()
;;   (interactive)
;;   (progn (asl/pgrph-copy)
;; 	 (forward-paragraph)
;; 	 (yank)
;;          (backward-paragraph)))
;; ;;; </asl_pgrph-functions>

;; ;;; <asl_pgrph-keys>
(define-prefix-command 'asl/pgrph-)
(let ((bindings '(
                  (asl/pgrph- [(f7) (p)])
                  (asl/pgrph-end-kill [(f7) (p) (deletechar)])
                  (asl/pgrph-beginning-kill [(f7) (p) (^)])
                  (asl/pgrph-forward-join [(f7) (p) (next)])
                  (asl/pgrph-backward-join [(f7) (p) (prior)])
                  (asl/pgrph-comment [(f7) (p) (\#)])
                  (asl/pgrph-uncomment [(f7) (p) (\')])
                  (asl/pgrph-comment-box [(f7) (p) (\*)])
                  (asl/pgrph-forward [(f7) (p) (down)])
                  (asl/pgrph-backward [(f7) (p) (up)])
                  (asl/pgrph-mark [(f7) (p) (m)])
                  (asl/pgrph-copy [(f7) (p) (c)])
                  ;; (asl/pgrph-repeat [(f7) (p) (?2)])
                  (asl/pgrph-transpose [(f7) (p) (t)])
                  )))
  (cl-loop for (cmd key) in bindings do (global-set-key key cmd))
  )
;; ;;; </asl_pgrph-keys>

;; ;;;
(provide 'asl_pgrph)
;; ;;; asl_pgrph.el ends here.
