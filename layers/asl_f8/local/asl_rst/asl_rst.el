;; @file asl_rst.el
;; @comment customizing org-mode

(require 'rst)

;; ;;; <asl_rst-aliases>
(defalias 'asl/rst-adjust           'rst-adjust)
(defalias 'asl/rst-forward-section  'rst-forward-section)
(defalias 'asl/rst-backward-section 'rst-backward-section)
(defalias 'asl/rst-toc              'rst-toc)
(defalias 'asl/rst-compile          'rst-compile)
;; ;;; </asl_rst-aliases>

;; ;;; <keys>
(define-key rst-mode-map [(f8) (a)]     'asl/rst-adjust)
(define-key rst-mode-map [(f8) (down)]  'asl/rst-forward-section)
(define-key rst-mode-map [(f8) (up)]    'asl/rst-backward-section)
(define-key rst-mode-map [(f8) (t)]     'asl/rst-toc)
(define-key rst-mode-map [(f8) (f8)]    'asl/-compile)
;; ;;; </keysY

;;  ;;;
(provide 'asl_rst)
;; ;;; end of asl_rst.el

