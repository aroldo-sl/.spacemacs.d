;;; -*- buffer-read-only: nil; -*-

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

;; ;;;
(provide 'asl_bkm)
;; ;;;
;; ;;; asl_bkm.el ends here
