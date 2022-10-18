;;; packages.el --- asl_Küchenschrank layer packages file for Spacemacs.  -*- buffer-read-only: t; -*-
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Aroldo Souza-Leite <aroldo@hp-lubuntu>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `asl_00-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `asl_00/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `asl_00/pre-init-PACKAGE' and/or
;;   `asl_00/post-init-PACKAGE' to customize the package as it is loaded.


(defconst asl_00-packages
  '(
    (asl_buff     :location local)
    (asl_pgrph    :location local)
    (asl_bkm      :location local)
    (asl_ln       :location local)
    (asl_rgn      :location local)
    (asl_rect     :location local)
    (asl_hs       :location local)
    ;; (breadcrumb   :location (recipe
    ;;                         :fetcher github
    ;;                         :repo pheaver/breadcrumb))

;;     (asl_bc       :location local)
    )
  "The list of Lisp packages required by the asl_00 layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


(defun asl_00/init-asl_bkm()
  (use-package asl_bkm))

(defun asl_00/init-asl_buff()
     (use-package asl_buff))

(defun asl_00/init-asl_ln()
  (use-package asl_ln))

(defun asl_00/init-asl_pgrph()
  (use-package asl_pgrph))

(defun asl_00/init-asl_rgn()
  (use-package asl_rgn))

(defun asl_00/init-asl_rect()
  (use-package asl_rect))

(defun asl_00/init-asl_find()
  (use-package asl_find))

(defun asl_00/init-asl_hs()
  (use-package asl_hs))

;; (defun asl_00/init-asl_bc()
;;   (use-package asl_bc))

;; (defun asl_00/init-breadcrumb()
;;   (use-package breadcrumb))


(provide 'asl_00-packages)

;;; packages.el ends here
