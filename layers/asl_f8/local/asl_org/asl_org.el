;; @file asl_org.el
;; @comment customizing org-mode

;; ;;; TODO: find out why it is necessary here (and not in asl_f8-layers/layers)
(require 'org)

;; ;;; <asl_org-aliases>
(defalias 'asl_org/store-link                    'org-store-link)
(defalias 'asl_org/agenda                        'org-agenda)
(defalias 'asl_org/capture                       'org-capture)
(defalias 'asl_org/next                          'org-next-visible-heading)
(defalias 'asl_org/previous                      'org-previous-visible-heading)
(defalias 'asl_org/forward                       'org-forward-heading-same-level)
(defalias 'asl_org/backward                      'org-backward-heading-same-level)
(defalias 'asl_org/outline-up                    'org-outline-up-heading)
(defalias 'asl_org/jump                          'org-goto)
(defalias 'asl_org/bullets                       'org-bullets-mode)
;; ;;; </asl_org-aliases>

;; ;;; <asl_org-keys>
(define-prefix-command 'asl_org/)
(let* (
       (key-map org-mode-map)
       (bindings '(
                   (asl_org/ [(f8)]        )
                   (asl_org/bullets     [(f8) (-)])
                   (asl_org/store-link [(f8) (l)]    )
                   (asl_org/agenda [(f8) (a)]        )
                   (asl_org/capture [(f8) (c)]       )
                   (asl_org/jump    [(f8) (j)]       )
                   (asl_org/next    [(f8) (down)]    )
                   (asl_org/previous [(f8) (up)]     )
                   (asl_org/forward [(f8) (next)]    )
                   (asl_org/backward [(f8) (prior)])
                   ))
       )
  (loop for (fn key) in bindings do (progn 
                                         (define-key key-map key fn))))
;; ;;; </asl_org-keys>

;;  ;;;
(provide 'asl_org)
;; ;;; end of asl_org.el

