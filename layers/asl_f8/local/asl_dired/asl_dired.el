;; ;;; @file asl_dired.el
;; ;;; @comment Customizing dired-mode.

(require 'dired)
(require 'wdired)
(require 'asl_buff)

;; ;;; <dired-aliases>
(defalias 'asl_dired/next-marked-file      'dired-next-marked-file)
(defalias 'asl_dired/prev-marked-file      'dired-prev-marked-file)
(defalias 'asl_dired/mark-omitted          'dired-mark-omitted)
(defalias 'asl_dired/omit-mode             'dired-omit-mode)
(defalias 'asl_dired/mark-omitted          'dired-mark-omitted)
(defalias 'asl_dired/wdired-mode           'wdired-change-to-wdired-mode)
(defalias 'asl_dired/eww-open-file         'eww-open-file)
(defalias 'asl_dired/do-delete             'dired-do-delete)
;; ;;; </dired-aliases>

;; ;;; <dired-functions>
(defun asl_dired/trash-marked-files(&optional filename-ext)
   "Appends filename-ext to the marked file names.
The default value of filename-ext is '.Trash'."
   (interactive)
   (progn (if (equal filename-ext nil) 
              (setq ext ".Trash") 
	      (setq ext filename-ext))
	  (let (
                (marked-files (dired-get-marked-files)))
               (loop  for filename on marked-files do  
                (let* ((file-name (nth 0 filename))
                       (file-name-new (concat file-name ext)))
		      (message "file name extension: %s" ext)
                      (dired-rename-file file-name file-name-new nil)
                      (message "Trashed %s files" (length marked-files)))))))
;; ;;;
(defun asl_dired/trash-at-point()
  "In dired mode, appends .Trash to current the file or directory at point"
  (interactive)
  (let* ((old-name (dired-filename-at-point))
         (suffix ".Trash" )
	 (basename  (file-name-nondirectory old-name))
         (new-name (concat basename suffix)))
         (rename-file basename  new-name )
	 (revert-buffer nil t t)
         (message "Renamed %s to %s." basename  new-name)
        ))
;; ;;;
(defun asl_dired/file-name-at-point-kill-new()
       "Appends the file name's full path at point to the kill ring."
       (interactive)
       (progn
          (setq fname (dired-file-name-at-point))
          (kill-new fname)
	  (message "%s appended to the kill ring." fname)))
;; ;;;
(defun asl_dired/mark-latex-garbage()
  "Marks the latex compiler auxiliary files and pdf"
  (interactive)
  (progn (let ((garbage latex-garbage-regexp)) 
          (dired-mark-files-regexp garbage))))
;; ;;;
(defun asl_dired/mark-garbage()
  "Marks the files described in the variable 'dired-garbage-files-regexp'"
  (interactive)
  (progn (let ((regexp dired-garbage-files-regexp)) 
          (dired-mark-files-regexp regexp))))
;; ;;; seems to do the same as the built-in 'dired-mark-omitted
(defun asl_dired/mark-garbage-and-omitted()
  "Marks the files described in the variable 'dired-omit-extensions'"
  (interactive)
  (progn (let ((regexp1 (concat (regexp-opt dired-omit-extensions) "$"))
	       (regexp2 dired-omit-files))
	   (dired-mark-files-regexp regexp1)
	   (dired-mark-files-regexp regexp2))))
;; ;;;
(defun asl_dired/delete-latex-garbage()
  "Deletes the LaTeX garbage marked by asl_dired/mark-latex-garbage."
  (interactive)
  (progn (dired-omit-mode -1)
	 (asl_dired/mark-latex-garbage)
	 (dired-do-delete)
	 (dired-omit-mode 1)))
;; ;;; </dired-functions>

;; ;;; <dired-keys>
(define-prefix-command 'asl_dired/)
(let* (
       (keymap dired-mode-map)
       (bindings '(
                   (asl_dired/ [(f8)]             )
                   (asl_dired/next-marked-file [(f8) (down)]      )
                   (asl_dired/prev-marked-file [(f8) (up)]       )
                   (asl_dired/trash-at-point [(f8) (d)]       )
                   (asl_dired/omit-mode [(f8) (o)]         )
                   (asl_dired/wdired-mode [(f8) (w)]         )
                   (asl_dired/trash-marked-files [(%) (D)]         )
                   (asl_dired/file-name-at-point-kill-new [(W)]              )
                   (asl_dired/mark-garbage [(*) (g)]          )
                   (asl_dired/mark-omitted [(*) (o)]          )
                   (asl_dired/mark-latex-garbage [(*) (L)]          )
                   (asl_dired/delete-latex-garbage [(%) (L)]          )
                   (asl_buff/window-delete [(?0)]             )
                   (asl_buff/window-delete-other-windows [(?1)]             )
                   (asl_buff/window-split-vertically [(?2)]             )
                   (asl_buff/window-split-horizontally [(?3)]             )
                   (asl_dired/do-delete  [(deletechar)]     )
  )))
  (loop for (fn key) in bindings do (define-key keymap key fn)))
;; ;;; </asl_dired-keys>

;; ;;;
(provide 'asl_dired)
