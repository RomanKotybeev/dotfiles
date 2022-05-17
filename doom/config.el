;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Roman Colt"
      user-mail-address "notemail@doe.com")

(setq doom-theme 'darkcolt)
(setq doom-font (font-spec :family "Iosevka Fixed Curly"
                           :size 14
                           :height 1
                           :weight 'normal))

(setq display-line-numbers-type 'relative)
(setq global-hl-line-modes nil)
(remove-hook 'doom-first-buffer-hook #'hl-line-mode)

(setq org-directory "~/texts/org/")
(setq ispell-local-dictionary "~/.config/aspell/aspell.ru.pws")

;; Markdown
(setq markdown-command "markdown")
(setq markdown-xhtml-header-content "")
(setq markdown-xhtml-standalone-regexp "")

;; C/C++
;(setq c-default-style "linux" c-basic-offset 4)

;;; Bindings
(after! evil-escape
  (setq evil-escape-key-sequence "kj"))

(map! :i "C-h" 'evil-delete-backward-char)
; Cyrillic
(map! :i "C-р" 'evil-delete-backward-char)
(map! :i "C-ц" 'evil-delete-backward-word)
(map! :i "C-е" 'doom/forward-to-last-non-comment-or-eol)
(map! :i "C-а" 'doom/backward-to-bol-or-indent)


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

(add-to-list 'load-path (concat doom-local-dir "mine"))
(require 'blog)
