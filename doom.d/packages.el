;; -*- no-byte-compile: t; -*-
;;; ~/dotfiles/doom.d/packages.el

;; (package! org-projectile)
;; (package! hledger-mode)
(package! academic-phrases)
(package! exec-path-from-shell)
(package! ado-mode :recipe (:fetcher github :repo "louabill/ado-mode"
                                     :files ("lisp/*.el")))

(package! emacs-snippets
  :recipe (:fetcher github
           :repo "hlissner/emacs-snippets"
           :files ("*")))

(package! yasnippet-snippets
  :recipe (:fetcher github
           :repo "AndreaCrotti/yasnippet-snippets"
           :files ("*")))

(package! rebox2
  :recipe (:fetcher github
           :repo "lewang/rebox2"
           :files ("rebox2.el")))
