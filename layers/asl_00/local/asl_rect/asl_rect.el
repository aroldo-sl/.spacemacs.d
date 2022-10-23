;;; asl_rect.el --- 	rectangle                      -*- lexical-binding: t; buffer-read-only: t;  -*-

;; Copyright (C) 2020  Aroldo Souza-Leite

;; Author: Aroldo Souza-Leite <aroldo@hp-lubuntu>
;; Keywords: rectangle

;; ;;; Because asl_ln defines f7 as a prefix command key:
(require 'asl_ln)

;; ;;; <asl_rect-aliases>
(defalias 'asl_rect/copy-as-kill       'copy-rectangle-as-kill)
(defalias 'asl_rect/kill            	 'kill-rectangle)
(defalias 'asl_rect/yank            	 'yank-rectangle)
(defalias 'asl_rect/open            	 'open-rectangle)
(defalias 'asl_rect/clear           	 'clear-rectangle)
(defalias 'asl_rect/string          	 'string-rectangle)
(defalias 'asl_rect/copy-to-register	 'copy-rectangle-to-register)
(defalias 'asl_rect/insert-register 	 'insert-register)
(defalias 'asl_rect/kill               'kill-rectangle)
(defalias 'asl_rect/yank               'yank-rectangle)
(defalias 'asl_rect/mark-mode          'rectangle-mark-mode)
;;; </rectangle-aliases>

;;; <asl_rect-keys>
(define-prefix-command 'asl_rect/)
(let ((bindings '( 
                  (asl_rect/ [(f7) (R)]                   )
                  (asl_rect/mark-mode [(f7) (R) (m)]         	    )
                  (asl_rect/mark-mode [(f7) (R) (R)]         	    )
                  (asl_rect/yank [(f7) (R) (y)]       	      )
                  (asl_rect/kill [(f7) (R) (k)]               )
                  (asl_rect/copy-as-kill [(f7) (R) (c)]       	      )
                  (asl_rect/insert-register [(f7) (R) (i)]       	      )
                  (asl_rect/copy-to-register [(f7) (R) (r)]       	      )
                  (asl_rect/open [(f7) (R) (o)]       	      )
                  (asl_rect/clear [(f7) (R) (\ )]  	          )
                  (asl_rect/string [(f7) (R) (s)]       	      )
                  )))
  (cl-loop for (cmd key) in bindings do (global-set-key key cmd)))
;; ;;; </asl_rect-keys>

;; ;;;
(provide 'asl_rect)
;; ;;; asl_rect.el ends here.



