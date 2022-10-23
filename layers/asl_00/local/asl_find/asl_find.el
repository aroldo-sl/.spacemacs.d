;;; asl_find.el --- 	Adapted from the legacy asl-keys.el  -*- lexical-binding: t; buffer-read-only: t; -*-

;; Copyright (C) 2020  Aroldo Souza-Leite

;; Author: Aroldo Souza-Leite <aroldo@hp-lubuntu>
;; Keywords: find search replace query-replace

;; ;;;  <asl_find-aliases>
(defalias 'asl_find/replace-string           'replace-string)
(defalias 'asl_find/forward-string           'search-forward)
(defalias 'asl_find/backward-string          'search-backward)
(defalias 'asl_find/replace-regexp           'replace-regexp)
(defalias 'asl_find/forward-regexp           'search-forward-regexp)
(defalias 'asl_find/backward-regexp          'search-backward-regexp)
(defalias 'asl_find/query-replace-string     'query-replace)
(defalias 'asl_find/query-replace-regexp     'query-replace-regexp)
;; ;;; </asl_find--aliases>

;; ;;; <asl_find-functions>
;; ;;; Found in http://stackoverflow.com/questions/202803/searching-for-marked-selected-text-in-emacs:"
(defun asl_find/region-text-isearch-forward (beg end)
      "Searches for text from the selected region" 
      (interactive "r")
      (let (
            (region (buffer-substring-no-properties beg end))
           )
        (deactivate-mark)
        (isearch-mode t nil nil nil)
        (goto-char (max beg end))
        (isearch-yank-string region)))
;; ;;;
(defun asl_find/region-text-isearch-backward (beg end)
      "Searches for text from the selected region backwards" 
      (interactive "r")
      (let (
            (region (buffer-substring-no-properties beg end))
           )
        (deactivate-mark)
        (isearch-mode nil nil nil nil)
        (goto-char (- (min beg end) 1))
        (isearch-yank-string region)))
;; ;;; </asl_find-functions>

;; ;;; <asl_find/keys>
(define-prefix-command              'asl_find/)
(let ((bindings '(
                  (asl_find/ [(f9)])
                  (asl_find/forward-string [(f9) (s)])
                  (asl_find/forward-regexp [(f9) (S)])
                  (asl_find/backward-string [(f9) (r)])
                  (asl_find/backward-regexp [(f9) (R)])
                  (asl_find/query-replace-string [(f9) (q)])
                  (asl_find/query-replace-string [(f9) (f9)])
                  (asl_find/query-replace-regexp [(f9) (Q)])
                  (asl_find/replace-string [(f9) (z)])
                  (asl_find/replace-regexp [(f9) (Z)])
                  )))
  (cl-loop for (cmd key) in bindings do (global-set-key key cmd)))
;; ;;; </asl_find-keys>

;; ;;; </asl_find-functions>

;; ;;; 
(provide 'asl_find)
;; ;;; end of asl_find.ele

