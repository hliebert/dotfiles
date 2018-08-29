;; -*- no-byte-compile: t; -*-
;;; ~/dotfiles/doom.d/packages.el

(package! org-projectile)
(package! hledger-mode)
(package! academic-phrases)
(package! ado-mode :recipe (:fetcher github :repo "louabill/ado-mode"
                                     :files ("lisp/*.el")))

