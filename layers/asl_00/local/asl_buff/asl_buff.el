;;; asl_buff.el ---

;; Copyright 2020 Aroldo Souza-Leite
;;
;; Author: asouzaleite@gmx.de
;; Version: $Id: asl/buff.el,v 0.0 2020-02/26 21:31:28 aroldo Exp $
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

;; ;;; <als_buff-aliases>
(defalias 'asl/buff-bury 'bury-buffer)
(defalias 'asl/buff-server-edit 'server-edit)
(defalias 'asl/buff-dired-jump 'dired-jump)
(defalias 'asl/buff-erase 'erase-buffer)
(defalias 'asl/buff-eval 'eval-buffer)
(defalias 'asl/buff-file-find 'find-file)
(defalias 'asl/buff-file-find-at-point 'find-file-at-point)
(defalias 'asl/buff-file-write 'write-file)
(defalias 'asl/buff-jump 'spacemacs/alternate-buffer)
(defalias 'asl/buff-kill-this 'kill-this-buffer)
(defalias 'asl/buff-list-helm 'helm-buffers-list)
(defalias 'asl/buff-list-other-window 'ibuffer-other-window)
(defalias 'asl/buff-next 'next-buffer)
(defalias 'asl/buff-prior 'previous-buffer)
(defalias 'asl/buff-read-only-mode 'read-only-mode)
(defalias 'asl/buff-revert 'revert-buffer)
(defalias 'asl/buff-save 'save-buffer)
(defalias 'asl/buff-terminal 'multi-term)
(defalias 'asl/buff-window-delete 'delete-window)
(defalias 'asl/buff-window-delete-other-windows 'delete-other-windows)
(defalias 'asl/buff-window-enlarge 'enlarge-window)
(defalias 'asl/buff-window-enlarge-horizontally 'enlarge-window-horizontally)
(defalias 'asl/buff-window-next 'next-multiframe-window)
(defalias 'asl/buff-window-other 'other-window)
(defalias 'asl/buff-window-previous 'previous-multiframe-window)
(defalias 'asl/buff-window-quit 'quit-window)
(defalias 'asl/buff-window-scroll-other-window 'scroll-other-window)
(defalias 'asl/buff-window-scroll-other-window-down 'scroll-other-window-down)
(defalias 'asl/buff-window-shrink 'shrink-window)
(defalias 'asl/buff-window-shrink-horizontally 'shrink-window-horizontally)
(defalias 'asl/buff-window-split-horizontally 'split-window-horizontally)
(defalias 'asl/buff-window-split-vertically 'split-window-vertically)
(defalias 'asl/buff-recentf-open-files 'recentf-open-files)
;; ;;; </asl_buff-aliases>

;; ;;; <asl_buff-functions>
(defun asl/buff-file-basename()
  (progn (helm-basename (buffer-file-name))))
;; ;;; </asl_buff-functions>

;; ;;; <asl_buff-keys>
(define-prefix-command 'asl/buff-)
(let ((bindings '(
  (asl/buff- [(f5)])
  (asl/buff-bury [(f5) (K)])
  (asl/buff-server-edit [(f5) (\#)])
  (asl/buff-dired-jump [(f5) (d)])
  (asl/buff-erase [(f5) (deletechar)])
  (asl/buff-eval [(f5) (e)])
  (asl/buff-file-find [(f5) (f)])
  (asl/buff-file-find-at-point [(f5) (p)])
  (asl/buff-file-write [(f5) (w)])
  (asl/buff-jump [(f5) (j)])
  (asl/buff-kill-this [(f5) (k)])
  (asl/buff-list-helm [(f5) (l)])
  (asl/buff-list-other-window [(f5) (L)])
  (asl/buff-next [(f5) (right) ])
  (asl/buff-prior [(f5) (left)])
  (asl/buff-read-only-mode [(f5) (insertchar)])
  (asl/buff-revert [(f5) (r)])
  (asl/buff-save [(f5) (f5) ])
  (asl/buff-save [(f5) (s) ])
  (asl/buff-terminal [(f5) (t)])
  (asl/buff-window-delete [(f5) (?0)])
  (asl/buff-window-delete-other-windows [(f5) (?1)])
  (asl/buff-window-enlarge [(f5) (+)])
  (asl/buff-window-enlarge-horizontally [(f5) (<)])
  (asl/buff-window-next [(f5) (up)])
  (asl/buff-window-other [(f5) (o)])
  (asl/buff-window-previous [(f5) (down)])
  (asl/buff-window-quit [(f5) (q)])
  (asl/buff-window-scroll-other-window [(f5) (next)])
  (asl/buff-window-scroll-other-window-down [(f5) (prior)])
  (asl/buff-window-shrink [(f5) (-)])
  (asl/buff-window-shrink-horizontally [(f5) (>)])
  (asl/buff-window-split-horizontally [(f5) (?3)])
  (asl/buff-window-split-vertically [(f5) (?2)])
  (asl/buff-recentf-open-files [(f5) (f6)])
)))
(cl-loop for (fn key) in bindings do (progn (global-set-key key fn))))
;; ;;; </als_buff-keys>

;; ;;;
(provide 'asl_buff)
;; ;;; asl_buff.el ends here
