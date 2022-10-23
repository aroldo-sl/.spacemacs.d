;;; layers.el --- 	Required Spacemacs layers for asl_00.  -*- lexical-binding: t; buffer-read-only: t; -*-

;; Copyright (C) 2020  Aroldo Souza-Leite

;; Author: Aroldo Souza-Leite <aroldo@hp-lubuntu>
;; Keywords:

(setq asl_00-layers/layers
      '(spacemacs-evil
        auto-completion))
(cl-loop for layer in asl_00-layers/layers do
              (configuration-layer/declare-layer layer))

