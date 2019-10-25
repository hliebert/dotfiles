;; -*- no-byte-compile: t; -*-
;;; ~/dotfiles/doom.d/packages.el

;; (package! org-projectile)
;; (package! hledger-mode)
;; (package! exec-path-from-shell)
(package! academic-phrases)
(package! yasnippet-snippets)
(package! transpose-frame)
(package! banner-comment)
(package! org-projectile)
(package! rebecca-theme)
;; (package! company-files)
;; (package! company-capf)
;; (package! company-keywords)
;; (package! company-yasnippet)
(package! eterm-256color)

(package! ado-mode :recipe (:host github :repo "louabill/ado-mode"
                                     :files ("lisp/*.el")))

(package! emacs-snippets
  :recipe (:host github
           :repo "hlissner/emacs-snippets"
           :files ("*")))

;; (package! yasnippet-snippets
;;   :recipe (:host github
;;            :repo "AndreaCrotti/yasnippet-snippets"
;;            :files ("*")))

(package! rebox2
  :recipe (:host github
           :repo "lewang/rebox2"
           :files ("rebox2.el")))
