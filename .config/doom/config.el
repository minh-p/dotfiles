;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Vu Huy Minh Pham"
      user-mail-address "minhisverynormal@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-acario-light)
(setq doom-theme 'doom-solarized-dark)
(setq ob-mermaid-cli-path "/usr/bin/mmdc")

(defun dw/org-mode-setup ()
  (org-indent-mode t)
  (variable-pitch-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))


(use-package org
  :hook (org-mode . dw/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"
        org-hide-emphasis-markers t
        org-pretty-entities t
        org-clock-sound "~/.config/emacs/bell.wav"
	org-startup-with-inline-images t
	org-hide-leading-stars t
	org-directory "~/org"
	org-agenda-files '("Tasks.org" "Birthdays.org" "Habits.org")
	org-agenda-start-with-log-mode t
	org-log-done 'time
	org-log-into-drawer t
	org-todo-keywords
	  '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
	    (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)"))
        ))

(require 'org-faces)
(with-eval-after-load 'org-faces)


(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.1)
                (org-level-3 . 1.05)
                (org-level-4 . 1.0)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "JetBrainsMono Nerd Font" :weight 'regular :height (cdr face)))

(org-babel-do-load-languages 'org-babel-load-languages
    '(
        (shell . t)
        (mermaid . t)
    )
)

;; Make sure org-indent face is available
(require 'org-indent)

;; Ensure that anything that should be fixed-pitch in Org files appears that way
(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-hide ((t nil))))
(put 'downcase-region 'disabled nil)

(with-eval-after-load 'org-superstar
  (setq org-superstar-item-bullet-alist
        '((?* . ?•)
          (?+ . ?➤)
          (?- . ?•)))
  (setq org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿"))
  (setq org-superstar-special-todo-items t)
  (setq org-superstar-remove-leading-stars t)
  (setq org-hide-leading-stars t)
  ;; Enable custom bullets for TODO items
  (setq org-superstar-todo-bullet-alist
        '(("TODO" . ?☐)
          ("NEXT" . ?✒)
          ("HOLD" . ?✰)
          ("WAITING" . ?☕)
          ("CANCELLED" . ?✘)
          ("DONE" . ?✔)))
  (org-superstar-restart))
(setq org-ellipsis " ▼ ")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
(dolist (mode '(org-mode-hook
                term-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; transparency
(set-frame-parameter (selected-frame) 'alpha '(100 . 100))
(add-to-list 'default-frame-alist '(alpha . (100 . 100)))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package tree-sitter
  :commands (tree-sitter-mode)
  :when (bound-and-true-p module-file-suffix)
  :hook (prog-mode . tree-sitter-mode)
  :hook (tree-sitter-after-on . tree-sitter-hl-mode)
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
  (defadvice! doom-tree-sitter-fail-gracefully-a (orig-fn &rest args)
    "Don't break with errors when current major mode lacks tree-sitter support."
    :around #'tree-sitter-mode
    (condition-case e
        (apply orig-fn args)
      (error
       (unless (string-match-p (concat "^Cannot find shared library\\|"
                                       "^No language registered\\|"
                                       "cannot open shared object file")
                               (error-message-string e))
         (signal (car e) (cadr e)))))))

(use-package typescript-mode
  :mode ("\\.tsx\\'" . typescript-tsx-tree-sitter-mode)
  :config
  (setq typescript-indent-level 2)
  (define-derived-mode typescript-tsx-tree-sitter-mode typescript-mode "TypeScript TSX"))

(after! tree-sitter
  (add-to-list 'tree-sitter-major-mode-language-alist '(typescript-tsx-tree-sitter-mode . tsx)))

;; https://github.com/orzechowskid/tsi.el/
;; great tree-sitter-based indentation for typescript/tsx, css, json
(use-package tsi
  ;; define autoload definitions which when actually invoked will cause package to be loaded
  :commands (tsi-typescript-mode tsi-json-mode tsi-css-mode)
  :init
  (add-hook 'typescript-mode-hook (lambda () (tsi-typescript-mode 1)))
  (add-hook 'json-mode-hook (lambda () (tsi-json-mode 1)))
  (add-hook 'css-mode-hook (lambda () (tsi-css-mode 1)))
  (add-hook 'scss-mode-hook (lambda () (tsi-scss-mode 1))))

(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . efs/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))

(use-package! lsp-tailwindcss)

(use-package flycheck
  :diminish flycheck-mode
  :init
  (setq flycheck-check-syntax-automatically '(save new-line)
        flycheck-idle-change-delay 5.0
        flycheck-display-errors-delay 0.9
        flycheck-highlighting-mode 'symbols
        flycheck-indication-mode 'left-fringe
        flycheck-standard-error-navigation t
        flycheck-deferred-syntax-check nil)
  )
