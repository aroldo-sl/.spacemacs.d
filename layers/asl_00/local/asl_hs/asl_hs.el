;;; asl_hs.el --- 	Adapted from asl_find.el  -*- lexical-binding: t; buffer-read-only: nil; -*-

;; Copyright (C) 2022  Aroldo Souza-Leite

;; Author: Aroldo Souza-Leite <aroldo@hp-lubuntu>
;; Keywords: find search replace query-replace
(require 'hideshow)

;; ;;;  <asl_hs-aliases>
(defalias 'asl/hs-show-all             'hs-show-all)
(defalias 'asl/hs-hide-all             'hs-hide-all)
(defalias 'asl/hs-show-block           'hs-show-block)
(defalias 'asl/hs-hide-block           'hs-hide-block)
(defalias 'asl/hs-hide-block-at-point  'hs-hide-block-at-point)
(defalias 'asl/hs-toggle-hiding        'hs-toggle-hiding)
;; ;;; </asl_hs-aliases>

;; ;;; <asl/hs-keys>
(define-prefix-command  'asl/hs-)
(let ((bindings '(
                  (asl/hs- [(control f5)])
                  (asl/hs-toggle-hiding [(control f5) (f5)])
                  (asl/hs-hide-block-at-point [(control f5) (p)])
                  (asl/hs-show-block [(control f5) (B)])
                  (asl/hs-hide-block [(control f5) (b)])
                  (asl/hs-show-all [(control f5) (A)])
                  (asl/hs-hide-all [(control f5) (a)])
                  )))
  (cl-loop for (cmd key) in bindings do (global-set-key key cmd)))
;; ;;; </asl_hs-keys>

;; ;;; </asl_hs-functions>

;; ;;; 
(provide 'asl_hs)
;; ;;; end of asl_hs.el

