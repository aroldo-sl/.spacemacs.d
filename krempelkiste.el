;;; krempelkiste.el --- Eine Kiste mit ungeordnetem Krempel  -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Aroldo Souza-Leite

;; Author: Aroldo Souza-Leite <aroldo@len-LM>
;; Keywords: krempel


(defun  asl/increment-numbers-by-2(x e)
  "Increments all numbers from point x to bottom by 2."
  (interactive "r")
  (goto-char x)
  (while (re-search-forward "\\b[0-9]+\\b" e t)
    (replace-match (number-to-string (+ 2 (string-to-number (match-string 0)))))))
