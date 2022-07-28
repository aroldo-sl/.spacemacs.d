;;; asl_bkm.el --- -*- buffer-read-only: t -*-

;; Copyright 2020 Aroldo Souza-Leite
;;
;; Author: asouzaleite@gmx.de
;; Version: $Id: asl_bookmark.el,v 0.0 2020/02/26 21:31:28 aroldo Exp $
;; Keywords: 
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;; ;;; <bookmark-aliases>
(defalias 'asl_bkm/set 'bookmark-set)
(defalias 'asl_bkm/jump-helm 'helm-filtered-bookmarks)
(defalias 'asl_bkm/list 'bookmark-bmenu-list)
(defalias 'asl_bkm/jump 'bookmark-jump)
;; ;;; </bookmark-aliases>

;; ;;; <bookmark-keys>
(define-prefix-command 'asl_bkm/)
(global-set-key [(f6)] 'asl_bkm/)
(let ((bindings '(
                  (asl_bkm/set               [(f6) (13)]) ;; 13=RET
                  (asl_bkm/jump-helm         [(f6) (j)])
                  (asl_bkm/jump              [(f6) (J)])
                  (asl_bkm/list              [(f6) (l)])
                  )))
  (loop for (fn key) in bindings do (progn
                                         (global-set-key key fn))))
;; ;;; </bookmark-keys>

;; ;; ;;; <breadcrumb>
;; (require 'breadcrumb)
;; ;; ;;; <breadcrumb-aliases>
;; (defalias 'asl_bc/set 'bc-set)
;; (defalias 'asl_bc/clear 'bc-clear)
;; (defalias 'asl_bc/list 'bc-local-previous)
;; (defalias 'asl_bc/previous 'bc-previous)
;; (defalias 'asl_bc/local-next 'bc-local-next)
;; (defalias 'asl_bc/next 'bc-next)
;; (defalias 'asl_bc/goto-current 'bc-goto-current)
;; ;; ;;; </breadcrumb-aliases>

;; ;; ;;; <breadcrumb-keys>
;; (define-prefix-command 'asl_bc/)
;; (global-set-key [(f6) (f6)] 'asl_bc/ )
;; (let ((bindings '(
;;                   (asl_bc/set                 [(f6) (f6) (control m)])
;;                   (asl_bc/clear               [(f6) (f6) (deletechar)])
;;                   (asl_bc/list                [(f6) (f6) (l)])
;;                   (asl_bc/local-previous      [(f6) (f6) (up)])
;;                   (asl_bc/previous            [(f6) (f6) (prior)])
;;                   (asl_bc/local-next          [(f6) (f6) (down)])
;;                   (asl_bc/next                [(f6) (f6) (next)])
;;                   (asl_bc/goto-current        [(f6) (f6) (?0)])
;;                   )))
;;   (loop for (fn key) in bindings do (global-set-key key fn)))
;; ;; ;;; </breadcrumb-keys>
;; ;; ;;; </breadcrumb>

;; ;;;
(provide 'asl_bkm)
;; ;;;
;; ;;; asl_bkm.el ends here
