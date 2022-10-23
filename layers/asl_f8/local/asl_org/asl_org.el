;; @file asl_org.el
;; @comment customizing org-mode

;; ;;; TODO: find out why it is necessary here (and not in asl/f8-layers-layers)
(require 'org)

;; ;;; <asl_org-aliases>
(defalias 'asl/org-next                          'org-next-visible-heading)
(defalias 'asl/org-previous                      'org-previous-visible-heading)
(defalias 'asl/org-forward                       'org-forward-heading-same-level)
(defalias 'asl/org-backward                      'org-backward-heading-same-level)
(defalias 'asl/org-jump                          'org-goto)
(defalias 'asl/org-insert-heading-r-c            'org-insert-heading-respect-content)
;; ;;; </asl_org-aliases>

;; ;;; <asl_org-keys>
(define-prefix-command 'asl/org-)
(let* (
       (key-map org-mode-map)
       (bindings '(

                   (asl/org- [(f8)]        )
                   (asl/org-jump    [(f8) (j)]       )
                   (asl/org-next    [(f8) (down)]    )

                   (asl/org-previous [(f8) (up)]     )
                   (asl/org-forward [(f8) (next)]    )
                   (asl/org-backward [(f8) (prior)])
                   (asl/org-insert-heading-r-c [(f8) (13)]) ;; 13=RET
                   ))
       )
  (cl-loop for (fn key) in bindings do (progn 
                                         (define-key key-map key fn))))
;; ;;; </asl_org-keys>

;;  ;;;
(provide 'asl_org)
;; ;;; end of asl_org.el

