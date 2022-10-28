;;; asl_.el --- -*- buffer-read-only: t; -*-

;; Copyright 2022 Aroldo Souza-Leite
;;
;; Author: asouzaleite@gmx.de
;; Version: $Id: asl_.el,v 0.0 2020-02/26 21:31:28 aroldo Exp $
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

  ;;; ;; <asl/>
  ;;; ;; <aliases> 
  (defalias 'asl/magit-status                              'magit-status)
  (defalias 'asl/quit-save                                 'save-buffers-kill-emacs)
  (defalias 'asl/quit-not-save                             'kill-emacs)
  (defalias 'asl/helm-M-x-fuzzy-matching                   'spacemacs/helm-M-x-fuzzy-matching)
  (defalias 'asl/repeat-complex-command                    'repeat-complex-command)
  ;;; ;; </aliases>
  ;;; ;; <keys>
  (define-prefix-command                                    'asl/)
  (global-set-key (kbd "<f12>")                             'asl/)
  (global-set-key (kbd "<f12> <f12>")                       'asl/helm-M-x-fuzzy-matching)
  (global-set-key (kbd "<f12> \#")                          'asl/magit-status)
  (define-prefix-command                                    'asl/quit-)
  (global-set-key (kbd "<f12> q")                           'asl/quit-)
  (global-set-key (kbd "<f12> q q")                         'asl/quit-save)
  (global-set-key (kbd "<f12> q Q")                         'asl/quit-not-save)
  (global-set-key (kbd "C-<f12> <f36>")                     'asl/repeat-complex-command) ;; f36=C-<12>
  ;;; ;; </keys>
  ;;; ;; </ asl/> 

;; ;;;
(provide 'asl_)
;; ;;;
;; ;;; asl_.el ends here
