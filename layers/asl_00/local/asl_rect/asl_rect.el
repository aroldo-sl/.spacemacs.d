;;; asl_rect.el --- 	rectangle                      -*- lexical-binding: t; buffer-read-only: nil;  -*-

;; Copyright (C) 2020  Aroldo Souza-Leite

;; Author: Aroldo Souza-Leite <aroldo@hp-lubuntu>
;; Keywords: rectangle

;; ;;; Because asl_ln defines f7 as a prefix command key:
(require 'asl_ln)

;; ;;; <asl_rect-aliases>
(defalias 'asl/rect-copy-as-kill       'copy-rectangle-as-kill)
(defalias 'asl/rect-kill            	 'kill-rectangle)
(defalias 'asl/rect-yank            	 'yank-rectangle)
(defalias 'asl/rect-open            	 'open-rectangle)
(defalias 'asl/rect-clear           	 'clear-rectangle)
(defalias 'asl/rect-string          	 'string-rectangle)
(defalias 'asl/rect-copy-to-register	 'copy-rectangle-to-register)
(defalias 'asl/rect-insert-register 	 'insert-register)
(defalias 'asl/rect-kill               'kill-rectangle)
(defalias 'asl/rect-yank               'yank-rectangle)
(defalias 'asl/rect-mark-mode          'rectangle-mark-mode)
;;; </rectangle-aliases>

;;; <asl_rect-keys>
(define-prefix-command 'asl/rect-)
(let ((bindings '( 
                  (asl/rect- [(f7) (R)]                   )
                  (asl/rect-mark-mode [(f7) (R) (m)]         	    )
                  (asl/rect-mark-mode [(f7) (R) (R)]         	    )
                  (asl/rect-yank [(f7) (R) (y)]       	      )
                  (asl/rect-kill [(f7) (R) (k)]               )
                  (asl/rect-copy-as-kill [(f7) (R) (c)]       	      )
                  (asl/rect-insert-register [(f7) (R) (i)]       	      )
                  (asl/rect-copy-to-register [(f7) (R) (r)]       	      )
                  (asl/rect-open [(f7) (R) (o)]       	      )
                  (asl/rect-clear [(f7) (R) (\ )]  	          )
                  (asl/rect-string [(f7) (R) (s)]       	      )
                  )))
  (cl-loop for (cmd key) in bindings do (global-set-key key cmd)))
;; ;;; </asl_rect-keys>

;; ;;;
(provide 'asl_rect)
;; ;;; asl_rect.el ends here.



