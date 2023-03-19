;; ;;; @file asl_dired.el
;; ;;; @comment Customizing dired-mode.

(require 'dired)
(require 'wdired)
(require 'asl_buff)

;; ;;; <dired-aliases>
(defalias 'asl/dired-next-marked-file      'dired-next-marked-file)
(defalias 'asl/dired-prev-marked-file      'dired-prev-marked-file)
(defalias 'asl/dired-mark-omitted          'dired-mark-omitted)
(defalias 'asl/dired-omit-mode             'dired-omit-mode)
(defalias 'asl/dired-mark-omitted          'dired-mark-omitted)
(defalias 'asl/dired-wdired-mode           'wdired-change-to-wdired-mode)
(defalias 'asl/dired-eww-open-file         'eww-open-file)
(defalias 'asl/dired-do-delete             'dired-do-delete)
(defalias 'asl/dired-toggle-read-only       'dired-toggle-read-only)

;; ;;; </dired-aliases>

;; ;;; <dired-functions>
(defun asl/dired-trash-marked-files(&optional filename-ext)
   "Appends filename-ext to the marked file names.
The default value of filename-ext is '.Trash'."
   (interactive)
   (progn (if (equal filename-ext nil) 
              (setq ext ".Trash") 
	      (setq ext filename-ext))
	  (let (
                (marked-files (dired-get-marked-files)))
               (cl-loop  for filename on marked-files do  
                (let* ((file-name (nth 0 filename))
                       (file-name-new (concat file-name ext)))
		      (message "file name extension: %s" ext)
                      (dired-rename-file file-name file-name-new nil)
                      (message "Trashed %s files" (length marked-files)))))))
;; ;;;
(defun asl/dired-trash-at-point()
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
(defun asl/dired-file-name-at-point-kill-new()
       "Appends the file name's full path at point to the kill ring."
       (interactive)
       (progn
          (setq fname (dired-file-name-at-point))
          (kill-new fname)
	  (message "%s appended to the kill ring." fname)))
;; ;;;
(defun asl/dired-mark-latex-garbage()
  "Marks the latex compiler auxiliary files and pdf"
  (interactive)
  (progn (let ((garbage latex-garbage-regexp)) 

           (dired-mark-files-regexp garbage))))
;; ;;;
(defun asl/dired-mark-garbage()
  "Marks the files described in the variable 'dired-garbage-files-regexp'"
  (interactive)
  (progn (let ((regexp dired-garbage-files-regexp)) 
          (dired-mark-files-regexp regexp))))
;; ;;; seems to do the same as the built-in 'dired-mark-omitted
(defun asl/dired-mark-garbage-and-omitted()
  "Marks the files described in the variable 'dired-omit-extensions'"
  (interactive)
  (progn (let ((regexp1 (concat (regexp-opt dired-omit-extensions) "$"))
	       (regexp2 dired-omit-files))
	   (dired-mark-files-regexp regexp1)
	   (dired-mark-files-regexp regexp2))))
;; ;;;
(defun asl/dired-delete-latex-garbage()
  "Deletes the LaTeX garbage marked by asl/dired-mark-latex-garbage."
  (interactive)
  (progn (dired-omit-mode -1)
	 (asl/dired-mark-latex-garbage)
	 (dired-do-delete)
	 (dired-omit-mode 1)))
;; ;;; </dired-functions>

;; ;;; <dired-keys>
(define-prefix-command 'asl/dired-)
(let* (
       (keymap dired-mode-map)
       (bindings '(
                   (asl/dired- [(f8)]             )
                   (asl/dired-next-marked-file [(f8) (down)]      )
                   (asl/dired-prev-marked-file [(f8) (up)]       )
                   (asl/dired-trash-at-point [(f8) (d)]       )
                   (asl/dired-omit-mode [(f8) (o)]         )
                   (asl/dired-wdired-mode [(f8) (w)]         )
                   (asl/dired-trash-marked-files [(%) (D)]         )
                   (asl/dired-file-name-at-point-kill-new [(W)]              )
                   (asl/dired-mark-garbage [(*) (g)]          )
                   (asl/dired-mark-omitted [(*) (o)]          )
                   (asl/dired-mark-latex-garbage [(*) (L)]          )
                   (asl/dired-delete-latex-garbage [(%) (L)]          )
                   (asl/buff-window-delete [(?0)]             )
                   (asl/buff-window-delete-other-windows [(?1)]             )
                   (asl/buff-window-split-vertically [(?2)]             )
                   (asl/buff-window-split-horizontally [(?3)]             )
                   (asl/dired-do-delete  [(deletechar)]     )
                   (asl/dired-toggle-read-only [(control x) (control q)])
  )))
  (cl-loop for (fn key) in bindings do (define-key keymap key fn)))
;; ;;; </asl_dired-keys>

;; ;;;
(provide 'asl_dired)
