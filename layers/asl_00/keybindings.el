;;; keybindings.el --- -*- buffer-read-only: nil; -*-

;; Copyright 2020 Aroldo Souza-Leite
;;
;; Author: asouzaleite@gmx.de
;; Keywords: 
;; X-URL: not distributed yet


;; Key bindings for the layer asl_.
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

;; ;;; Keybindings are in the respective packages.


;;; ;; <asl_/>
(global-set-key (kbd "<f12>")                              nil)
(global-set-key (kbd "<f12> <f12>")                       'asl_/helm-M-x-fuzzy-matching)
(global-set-key (kbd "C-<f12> <f36>")                     'asl_/repeat-complex-command) ;; f36=C-<12>
(global-set-key (kbd "<f12> \#")                          'asl_/magit-status)
(global-set-key [(f12) (r)]                               'asl_/yas-reload-all)
(global-set-key [(f12) (insertchar)]                      'asl_/yas-insert-snippet)
(global-set-key (kbd "<f12> q")                            nil)
(global-set-key (kbd "<f12> q q")                         'asl_/quit-save)
(global-set-key (kbd "<f12> q Q")                         'asl_/quit-not-save)
;;; ;; </asl_/>

;; ;;;
(message "end of .../layers/asl_/keybindings.el")
;; ;;; keybindings.el ends here
