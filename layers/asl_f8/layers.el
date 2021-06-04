;; ;;; -*- lexical-binding: t; buffer-read-only: t; -*-
;;; layers.el --- 	Required Spacemacs layers for asl_f8.

;; Copyright (C) 2020  Aroldo Souza-Leite

;; Author: Aroldo Souza-Leite <aroldo@hp-lubuntu>
;; Keywords:


(setq asl_f8-layers/layers
      '(
        org
        asl_00
	)
      )
(loop for layer in asl_f8-layers/layers do
         (configuration-layer/declare-layer layer))


