;;; layers.el --- 	Required Spacemacs layers for asl_.  -*- lexical-binding: nil; buffer-read-only: nil; -*-

;; Copyright (C) 2020  Aroldo Souza-Leite

;; Author: Aroldo Souza-Leite <aroldo@hp-lubuntu>
;; Keywords:

(setq asl_-layers/layers
      '(spacemacs-evil
        auto-completion))
(cl-loop for layer in asl_-layers/layers do
              (configuration-layer/declare-layer layer))

