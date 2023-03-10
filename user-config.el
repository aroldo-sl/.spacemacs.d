;;; -*-  lexical-binding: t; buffer-read-only: t; -*-
;;; user-config.el --- This is the sourced out dotspacemacs/user-config() in init.el (the dotspacemacs file)

;; Copyright (C) 2021  Aroldo Souza-Leite

;; Author: Aroldo Souza-Leite <asouzaleige@gmx.de>
;; Keywords: dotspacemacs user-config
(message "Beginning of %s" "~/.spacemacs.d/user-config.el")

(defun -gnome-terminal-keys()
;; This is one of the crappiest things I've ever 
;; experienced in the Brave New World of Computers.
;; To find out what is the character sequence sent by 
;; gnome-terminal (in Ubunut 12.04), for instance, for (shift f9), to
;; Emacs I had to press C-q and then (shift f9) and then 
;; replace the (look-alike) ^[ by backslash-e. 
;; Thanks to http://superuser.com/questions/314729/how-can-i-pass-function-keys-in-gnome-terminal-to-emacs
;; for the incredibly precise hint.
;; [f1] used by the Unity desktop help
;;
(let ((keymap function-key-map) (bindings '( 
    ("\e[5;3~"     [(meta next)])
    ("\e[6;3~"     [(meta prior)])
    ("\eOQ"        [f2])
    ;;
    ("\eOR"        [f3])
    ("\eO1;5R"     [(control f3)])
    ("\eO1;2R"     [(shift f3)])
    ("\eO1;6R"     [(control shift f3)])
    ;;
    ("\eOS"        [f4])
    ("\eO1;2S"     [(shift f4)])
    ("\eO1;5S"     [(control f4)])
    ;;
    ("\e[15~"      [f5])
    ("\e[15;2~"    [(shift f5)])
    ("\e[15;5~"    [(control f5)])
    ;;
    ("\e[17~"      [f6])
    ("\e[17;2~"    [(shift f6)])
    ("\e[17;5~"    [(control f6)])
    ;;
    ("\e[18~"      [f7])
    ("\e[18;2~"    [(shift f7)])
    ("\e[18;5~"    [(control f7)])
    ("\e[18;6~"    [(control shift f7)])
    ;;
    ("\e[19~"      [f8])
    ("\e[19;2~"    [(shift f8)])
    ("\e[19;5~"    [(control f8)])
    ;;
    ("\e[20~"      [f9])
    ("\e[20;2~"    [(shift f9)])
    ("\e[20;5~"    [(control f9)])
    ("\e[20;6~"    [(control shift f9)])
    ;; f10  not used (used by gnome-terminal)
    ;; (shift f10) not used 
    ("\e[21;5~"    [(control f10)])
    ;; f11 not used (used by gnome-terminal)
    ;; (shift f11) not used
    ("\e[23;5~"    [(control f11)])
    ;;
    ("\e[24~"      [(f12)])
    ("\e[24;2~"    [(shift f12)])
    ("\e[24;5~"    [(control f12)])
    ;;
    ("\e[1;3C"     [(meta right)])
    ("\e[1;3A"     [(meta up)])
    ("\e[1;3B"     [(meta down)])
    ("\e[1;3D"     [(meta left)])
    ;;
    ("\e[1;5C"     [(control right)])
    ("\e[1;5A"     [(control up)])
    ("\e[1;5B"     [(control down)])
    ("\e[1;5D"     [(control left)])
    ;;
    ("\eOH"        [home])
    ("\eOF"        [end])
    ("\e[3;2~"     [(shift delete)])
    ("\e[3;5~"     [(control delete)])
    )))
  (cl-loop for (gnome-key emacs-key) in bindings do
           (define-key keymap gnome-key emacs-key))
  )
  ;; because Gnome uses f10:
  (global-set-key [(control f10)]      'menu-bar-open)
)
(-gnome-terminal-keys)
;;
(defun -user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; The variables spacemacs-private-directory and
  ;; spacemacs-private-cache-directory are set in
  ;; dotspacemacs/user-init().
  ;; User configuration files should be located in 
  ;; spacemacs-private-directory or in one of its recursive
  ;; subdirectories.
  ;; (setq custom-file
  ;;       (concat spacemacs-private-directory "custom-settings.el"))
  ;; (setq spacemacs-private-cache-directory
  ;;       (concat spacemacs-private-directory ".cache/"))


  ;;; <auto-mode-alist>
  (add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))
  (add-to-list 'auto-mode-alist '("\\.xml\\'" . nxml-mode))
  ;;; </auto-mode-alist>

  ;;; <bookmark>
  (setq bookmark-directory
        (concat spacemacs-private-directory "bookmarks/"))
  (setq bookmark-default-file
        (concat bookmark-directory "default.bkm"))
  ;;; </bookmark>

  ;;; <recentf>
  (setq recentf-save-file
        (concat spacemacs-private-cache-directory "recentf"))
  (if (not (file-exists-p recentf-save-file))
  (make-empty-file recentf-save-file t))
  ;;; </recentf>

  ;;; <xclip>
  (xclip-mode t)
  ;;; </xclip>

  ;; ;;; <yasnippet>
  ;; (setq yas-snippet-private-directory
  ;;       (concat spacemacs-private-directory "snippets/"))
  ;; (add-to-list 'yas-snippet-dirs yas-snippet-private-directory)
  ;; (yas-reload-all)
  ;; ;;; </yasnippet>

  ;;; <projectile>
  (setq projectile-indexing-method 'native)
  ;;; </projectile>

  ;;; <python>
  (add-hook
   'python-mode-hook
   (lambda()(yas-minor-mode t)))
  ;;; </python>

  ;;; <dired>
  (setq dired-garbage-files-regexp 
        "\\(?:\\.\\(?:aux\\|bak\\|out\\|Trash\\|rubbish\\|DELETEME\\|DEPRECATED\\|dvi\\|log\\|orig\\|rej\\|toc\\)\\)\\'")
  (add-hook
   'dired-mode-hook
   (lambda()(setq dired-auto-revert-buffer t)))
  (add-hook
   'dired-mode-hook
   (lambda()(dired-hide-details-mode)))
  ;;; </dired>

  ;;; ;; <hs>
  (define-key key-translation-map [(f5) (h)] [(control c) (\@) (control e)])
  ;;; ;; </hs>
  ;;; ;;
  ;;; ;; <auto-save>
  (setq spacemacs-auto-save-directory
        (concat spacemacs-private-cache-directory "auto-save"))
  ;;; ;; auto-save is a real mess:
  (setq auto-save-default nil)
  ;;; ;; </auto-save>

  ;;; ;; <org-roam>
  (setq org-roam-directory (file-truename "~/devel/Zettelkasten"))
  (setq org-roam-db-location (concat spacemacs-private-directory "org-roam-db"))
  (if (not (file-exists-p org-roam-directory))
  (make-directory org-roam-directory  t))
  (org-roam-db-autosync-mode t)
  ;;; ;; </org-roam>
)
(-user-config)
;;; ;;
(message "End of %s" user-config_el)
