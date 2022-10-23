;;; asl_bkm.el --- -*- buffer-read-only: t -*-

;; Copyright 2020 Aroldo Souza-Leite
;;
;; Author: asouzaleite@gmx.de
;; Version: $Id: asl/bookmark.el,v 0.0 2020-02/26 21:31:28 aroldo Exp $
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
(defalias 'asl/bkm-set 'bookmark-set)
(defalias 'asl/bkm-jump-helm 'helm-filtered-bookmarks)
(defalias 'asl/bkm-list 'bookmark-bmenu-list)
(defalias 'asl/bkm-jump 'bookmark-jump)
;; ;;; </bookmark-aliases>

;; ;;; <bookmark-keys>
(define-prefix-command 'asl/bkm-)
(global-set-key [(f6)] 'asl/bkm-)
(let ((bindings '(
                  (asl/bkm-set               [(f6) (13)]) ;; 13=RET
                  (asl/bkm-jump-helm         [(f6) (f6)])
                  (asl/bkm-jump              [(f6) (f5)])
                  (asl/bkm-jump              [(f6) (j)])
                  (asl/bkm-list              [(f6) (l)])
                  )))
  (cl-loop for (fn key) in bindings do (progn
                                         (global-set-key key fn))))
;; ;;; </bookmark-keys>

;; ;; ;;; <breadcrumb>
;; (require 'breadcrumb)
;; ;; ;;; <breadcrumb-aliases>
;; (defalias 'asl/bc-set 'bc-set)
;; (defalias 'asl/bc-clear 'bc-clear)
;; (defalias 'asl/bc-list 'bc-local-previous)
;; (defalias 'asl/bc-previous 'bc-previous)
;; (defalias 'asl/bc-local-next 'bc-local-next)
;; (defalias 'asl/bc-next 'bc-next)
;; (defalias 'asl/bc-goto-current 'bc-goto-current)
;; ;; ;;; </breadcrumb-aliases>

;; ;; ;;; <breadcrumb-keys>
;; (define-prefix-command 'asl/bc-)
;; (global-set-key [(f6) (f6)] 'asl/bc- )
;; (let ((bindings '(
;;                   (asl/bc-set                 [(f6) (f6) (control m)])
;;                   (asl/bc-clear               [(f6) (f6) (deletechar)])
;;                   (asl/bc-list                [(f6) (f6) (l)])
;;                   (asl/bc-local-previous      [(f6) (f6) (up)])
;;                   (asl/bc-previous            [(f6) (f6) (prior)])
;;                   (asl/bc-local-next          [(f6) (f6) (down)])
;;                   (asl/bc-next                [(f6) (f6) (next)])
;;                   (asl/bc-goto-current        [(f6) (f6) (?0)])
;;                   )))
;;   (cl-loop for (fn key) in bindings do (global-set-key key fn)))
;; ;; ;;; </breadcrumb-keys>
;; ;; ;;; </breadcrumb>

;; ;;;
(provide 'asl_bkm)
;; ;;;
;; ;;; asl_bkm.el ends here
