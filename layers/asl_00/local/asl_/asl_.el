;;; asl_.el --- -*- buffer-read-only: nil; -*-

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

;;; ;; <aliases> 
(defalias 'asl_/helm-M-x-fuzzy-matching                   'spacemacs/helm-M-x-fuzzy-matching)
(defalias 'asl_/repeat-complex-command                    'repeat-complex-command)
(defalias 'asl_/magit-status                              'magit-status
  "Jumps to the magit status window.")
(defalias 'asl_/yas-reload-all                            'yas-reload-all
  "Reloads all available snippets.
ATTENTION: it takes some seconds to complete.")
(defalias 'asl_/yas-insert-snippet                        'yas-insert-snippet)
(defalias 'asl_/quit-save                                 'save-buffers-kill-emacs
  "Asks if open buffers should be saved before  killing Emacs")
(defalias 'asl_/quit-not-save                             'kill-emacs
  "Kills Emacs without asking to save open buffers.")
(defalias 'asl_/server-force-delete                       'server-force-delete
  "Kills Emacs and kills the Emacs.")
;;; ;; </aliases>


;; ;;;
(provide 'asl_)
;; ;;;
(message "end of .../layers/asl_00/local/asl_/asl_.el")
;; ;;; asl_.el ends here
