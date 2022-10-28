;; @file asl_org.el
;; @comment customizing org-mode

;; ;;; TODO: find out why it is necessary here (and not in asl/f8-layers-layers)
(require 'org)

;; ;;; <asl/org aliases>
(defalias 'asl/org-next                          'org-next-visible-heading)
(defalias 'asl/org-previous                      'org-previous-visible-heading)
(defalias 'asl/org-forward                       'org-forward-heading-same-level)
(defalias 'asl/org-backward                      'org-backward-heading-same-level)
(defalias 'asl/org-jump                          'org-goto)
(defalias 'asl/org-insert-heading-r-c            'org-insert-heading-respect-content)
;; ;;; </asl/org aliases>

;; ;;; <asl/org-keys>
;; (define-prefix-command 'asl/org)
;; (let* (
;;        (key-map org-mode-map)
;;        (bindings '(

;;                     (asl/org- [(f8)]        )
;;                    (asl/org-jump    [(f8) (j)]       )
;;                    (asl/org-next    [(f8) (down)]    )

;;                    (asl/org-previous [(f8) (up)]     )
;;                    (asl/org-forward [(f8) (next)]    )
;;                    (asl/org-backward [(f8) (prior)])
;;                    (asl/org-insert-heading-r-c [(f8) (13)]) ;; 13=RET
;;                    (asl/org-insert-heading-r-c [(f8) (f8)]) ;; 13=RET
;;                    ))
;;        )
;;   (cl-loop for (fn key) in bindings do (progn (define-key key-map key fn))))
;;  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;   </als_org/keys>

;; ;;;<asl/org keys>
;;;;;;;;;;;;;;;;;;;Using the "Xah syntax" for Emacs key bindings:;;;;;;;
;;;;;; http://xahlee.info/emacs/pemacs/keyboard_shortcuts_examples.html ;;;;;;;;
(define-key org-mode-map (kbd "<f8>")                 nil)
(define-key org-mode-map (kbd "<f8> <up>")           'asl/org-previous)
(define-key org-mode-map (kbd "<f8> <next>")         'asl/org-forward)
(define-key org-mode-map (kbd "<f8> <down>")         'asl/org-next )
(define-key org-mode-map (kbd "<f8> <up>")           'asl/org-previous)
(define-key org-mode-map (kbd "<f8> <next>")         'asl/org-forward)
(define-key org-mode-map (kbd "<f8> <prior>")        'asl/org-backward)
(define-key org-mode-map (kbd "<f8> <f8>")           'asl/org-insert-heading-r-c ) 
(define-key org-mode-map (kbd "<f8> RET")            'asl/org-insert-heading-r-c ) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; </asl/org keys>

;;  ;;;
(provide 'asl_org)
(message "End of %s" (current-buffer))
;; ;;; end of asl_org.el

