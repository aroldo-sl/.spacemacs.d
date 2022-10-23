;;; asl_buff.el ---

;; Copyright 2020 Aroldo Souza-Leite
;;
;; Author: asouzaleite@gmx.de
;; Version: $Id: asl_buff.el,v 0.0 2020/02/26 21:31:28 aroldo Exp $
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
(defalias 'asl_buff/bury 'bury-buffer)
(defalias 'asl_buff/server-edit 'server-edit)
(defalias 'asl_buff/dired-jump 'dired-jump)
(defalias 'asl_buff/erase 'erase-buffer)
(defalias 'asl_buff/eval 'eval-buffer)
(defalias 'asl_buff/file-find 'find-file)
(defalias 'asl_buff/file-find-at-point 'find-file-at-point)
(defalias 'asl_buff/file-write 'write-file)
(defalias 'asl_buff/jump 'spacemacs/alternate-buffer)
(defalias 'asl_buff/kill-this 'kill-this-buffer)
(defalias 'asl_buff/list-helm 'helm-buffers-list)
(defalias 'asl_buff/list-other-window 'ibuffer-other-window)
(defalias 'asl_buff/next 'next-buffer)
(defalias 'asl_buff/prior 'previous-buffer)
(defalias 'asl_buff/read-only-mode 'read-only-mode)
(defalias 'asl_buff/revert 'revert-buffer)
(defalias 'asl_buff/save 'save-buffer)
(defalias 'asl_buff/terminal 'multi-term)
(defalias 'asl_buff/window-delete 'delete-window)
(defalias 'asl_buff/window-delete-other-windows 'delete-other-windows)
(defalias 'asl_buff/window-enlarge 'enlarge-window)
(defalias 'asl_buff/window-enlarge-horizontally 'enlarge-window-horizontally)
(defalias 'asl_buff/window-next 'next-multiframe-window)
(defalias 'asl_buff/window-other 'other-window)
(defalias 'asl_buff/window-previous 'previous-multiframe-window)
(defalias 'asl_buff/window-quit 'quit-window)
(defalias 'asl_buff/window-scroll-other-window 'scroll-other-window)
(defalias 'asl_buff/window-scroll-other-window-down 'scroll-other-window-down)
(defalias 'asl_buff/window-shrink 'shrink-window)
(defalias 'asl_buff/window-shrink-horizontally 'shrink-window-horizontally)
(defalias 'asl_buff/window-split-horizontally 'split-window-horizontally)
(defalias 'asl_buff/window-split-vertically 'split-window-vertically)
(defalias 'asl_buff/recentf-open-files 'recentf-open-files)
;; ;;; </asl_buff-aliases>

;; ;;; <asl_buff-functions>
(defun asl_buff/file-basename()
  (progn (helm-basename (buffer-file-name))))
;; ;;; </asl_buff-functions>

;; ;;; <asl_buff-keys>
(define-prefix-command 'asl_buff/)
(let ((bindings '(
  (asl_buff/ [(f5)])
  (asl_buff/bury [(f5) (K)])
  (asl_buff/server-edit [(f5) (\#)])
  (asl_buff/dired-jump [(f5) (d)])
  (asl_buff/erase [(f5) (deletechar)])
  (asl_buff/eval [(f5) (e)])
  (asl_buff/file-find [(f5) (f)])
  (asl_buff/file-find-at-point [(f5) (p)])
  (asl_buff/file-write [(f5) (w)])
  (asl_buff/jump [(f5) (j)])
  (asl_buff/kill-this [(f5) (k)])
  (asl_buff/list-helm [(f5) (l)])
  (asl_buff/list-other-window [(f5) (L)])
  (asl_buff/next [(f5) (right) ])
  (asl_buff/prior [(f5) (left)])
  (asl_buff/read-only-mode [(f5) (insertchar)])
  (asl_buff/revert [(f5) (r)])
  (asl_buff/save [(f5) (f5) ])
  (asl_buff/save [(f5) (s) ])
  (asl_buff/terminal [(f5) (t)])
  (asl_buff/window-delete [(f5) (?0)])
  (asl_buff/window-delete-other-windows [(f5) (?1)])
  (asl_buff/window-enlarge [(f5) (+)])
  (asl_buff/window-enlarge-horizontally [(f5) (<)])
  (asl_buff/window-next [(f5) (up)])
  (asl_buff/window-other [(f5) (o)])
  (asl_buff/window-previous [(f5) (down)])
  (asl_buff/window-quit [(f5) (q)])
  (asl_buff/window-scroll-other-window [(f5) (next)])
  (asl_buff/window-scroll-other-window-down [(f5) (prior)])
  (asl_buff/window-shrink [(f5) (-)])
  (asl_buff/window-shrink-horizontally [(f5) (>)])
  (asl_buff/window-split-horizontally [(f5) (?3)])
  (asl_buff/window-split-vertically [(f5) (?2)])
  (asl_buff/recentf-open-files [(f5) (f6)])
)))
(cl-loop for (fn key) in bindings do (progn (global-set-key key fn))))
;; ;;; </als_buff-keys>

;; ;;;
(provide 'asl_buff)
;; ;;; asl_buff.el ends here
