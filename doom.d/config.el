;===============================================================================
;; Filename: config.el
;; Description: config file for doom-emacs
;; Author: Helge Liebert
;; Created: Mon Apr 16 23:56:45 2018
;; Last-Updated: So Mai 10 12:24:00 2020
;===============================================================================

;================================ Basic settings ===============================

;; User
(setq user-full-name    "Helge Liebert"
      user-mail-address "helge.liebert@gmail.com")

;; Doom UI settings
(setq doom-font (font-spec :family "MesloLGS Nerd Font"))
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-vibrant)
;; (setq doom-theme 'doom-snazzy)
(setq doom-theme 'doom-dracula)
;; (setq doom-theme 'doom-dark+)
;; (setq doom-theme 'rebecca)

;; Org
(setq org-directory (expand-file-name "~/Dropbox/Org/")
      org-projectile-file (expand-file-name "~/Dropbox/Org/projects.org"))

;; Display absolute line numbers
(setq display-line-numbers-type t)


;==================================== Email ====================================

;; Each path is relative to `+mu4e-mu4e-mail-path', which is ~/.mail by default
(set-email-account! "gmail"
  '((mu4e-sent-folder       . "/gmail/Gesendet")
    (mu4e-drafts-folder     . "/gmail/Entwürfe")
    (mu4e-trash-folder      . "/gmail/Papierkorb")
    (mu4e-refile-folder     . "/gmail/Alle Nachrichten")
    (user-mail-address      . "helge.liebert@gmail.com")    ;; only needed for mu < 1.4
    (smtpmail-smtp-user     . "helge.liebert@gmail.com")
    (smtpmail-smtp-server   . "smtp.gmail.com")
    (smtpmail-smtp-service  . 587)
    (mu4e-compose-signature . (concat "Helge Liebert\n"
                                      "Postdoctoral Fellow\n"
                                      "Department of Health Care Policy\n"
                                      "Harvard University\n"
                                      "https://hliebert.github.io\n")))
  t)

(set-email-account! "hbdc"
  '((mu4e-sent-folder       . "/hbdc/Gesendet")
    (mu4e-drafts-folder     . "/hbdc/Entwürfe")
    (mu4e-trash-folder      . "/hbdc/Papierkorb")
    (mu4e-refile-folder     . "/hbdc/Alle Nachrichten")
    (user-mail-address      . "hyperbolicdiscounting00@gmail.com")    ;; only needed for mu < 1.4
    (smtpmail-smtp-user     . "hyperbolicdiscounting00@gmail.com")
    (smtpmail-smtp-server   . "smtp.gmail.com")
    (smtpmail-smtp-service  . 587))
  t)

;; Start mu4e on startup, otherwise auto-update won't work
(mu4e)
(switch-to-buffer (other-buffer))

;; Update automatically in the background, every 10 minutes
(setq mu4e-update-interval 600)
;; if xapian lock causes issues
;; (run-at-time nil 600 mu4e-update-index)
;; (run-at-time nil 600 'mu4e-update-mail-and-index t)

;================================== Dictionary =================================

;; dictionaries
;; activate multiple dictionaries to avoid switching between German and English
(after! ispell
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "en_US,de_CH")
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_US,de_CH"))


;===================================== Evil ====================================

;; Do not replace element in kill ring after pasting over
(setq-default evil-kill-on-visual-paste nil)

;; Delete things by moving them to trash
(setq delete-by-moving-to-trash t)

;; Fix evil paragraph to behave like vim
;; Works for latex, not for org-mode
(after! evil
(defun forward-evil-paragraph (&optional count)
    "Move forward COUNT paragraphs.
Moves point COUNT paragraphs forward or (- COUNT) paragraphs backward
if COUNT is negative.  A paragraph is defined by
`start-of-paragraph-text' and `forward-paragraph' functions."
    (let ((paragraph-start "\f\\|[ \t]*$"))
    (evil-motion-loop (dir (or count 1))
        (cond
        ((> dir 0) (forward-paragraph))
        ((not (bobp)) (start-of-paragraph-text) (beginning-of-line)))))))


;=================================== Editing ===================================

;; disable smartparens
;; (after! smartparens (smartparens-global-mode -1))

;; disable smartparens for mini buffer
(after! evil-ex
  :config
  (remove-hook! 'minibuffer-setup-hook #'doom-init-smartparens-in-minibuffer-maybe-h))

;; Recenter screen after most searches
(dolist (fn '(evil-visualstar/begin-search-forward
              evil-visualstar/begin-search-backward
              evil-ex-search-word-forward
              evil-ex-search-word-backward
              evil-ex-search-next
              evil-ex-search-previous
              evil-ex-search-forward
              evil-ex-search-backward))
  (advice-add fn :around #'doom-preserve-window-position-a))


;================================= Key mappings ================================

;; These are old, set before doom moved to general.el.
;; Probably need fixing. Try without them?
(map!
 (:leader
   :desc "Comment"                      :nv ";"   #'evilnc-comment-operator
   (:prefix "f"
     :desc "Copy this file"             :n  "c"   #'doom/copy-this-file
   ;;   :desc "Move this file"             :n  "m"   #'doom/move-this-file
   ;;   :desc "Find file in project"       :n  "p"   #'counsel-projectile
   ;;   :desc "Treemacs"                   :n  "t"   #'+treemacs/toggle
     :desc "Find file jump"             :n  "j"   #'dired-jump
     :desc "Find file fzf"              :n  "z"   #'counsel-fzf
     :desc "Find file rg"               :n  "g"   #'counsel-rg)
   (:prefix "b"
     :desc "Other buffer"               :n  "TAB" #'+helge/alternate-buffer
     :desc "Kill buffer and window"     :n  "q"   #'kill-buffer-and-window)
   (:prefix "w"
     :desc "Maximize window"            :n  "m"   #'doom/window-maximize-buffer
     :desc "Other window"               :n  "w"   #'other-window
     :desc "Alternate window"           :n  "TAB" #'+helge/alternate-window)
   (:prefix "s"
     :desc "Search clear"               :n  "c"   #'evil-ex-nohighlight)
   (:prefix "t"
     ;; :desc "Toggle flyspell dictionary" :n  "d"   #'ispell-change-dictionary
     ;; :desc "Toggle truncate lines"      :n  "l"   #'toggle-truncate-lines
     :desc "Toggle auto-fill-mode"      :n  "a"   #'auto-fill-mode
     :desc "Toggle visual lines"        :n  "l"   #'visual-line-mode
     :desc "Toggle line numbers"        :n  "L"   #'doom/toggle-line-numbers)
   (:prefix "i"
     ;; :desc "Org-projectile todo current project" :n  "t"   #'org-projectile-capture-for-current-project
     ;; :desc "Org-projectile todo any project"     :n  "i"   #'org-projectile-project-todo-completing-read
     :desc "Banner-comment"                      :n  "h"   #'banner-comment)
     ))


;================================== Workspaces =================================

;; turn off creating a new workspace when opening a new frame
(after! persp-mode
  ;; for emacsclient spawned frames:
  (setq persp-emacsclient-init-frame-behaviour-override nil)
  ;; for interactively created frames:
  (setq persp-interactive-init-frame-behaviour-override nil))

;================================= Dired/ranger ================================

;; Set ranger not to override dired
;; (after! ranger
;;   (setq ranger-override-dired nil))


;===================================== Ivy =====================================

(after! ivy
;;   ;; do not display ./ and ../ in counsel
;;   (setq ivy-extra-directories nil)
;;   add mapping for ivy-immediate-done (C-M-j)
  (map! (:map ivy-minibuffer-map
          ("<C-return>" #'ivy-immediate-done))))


;=================================== Company ===================================

;; company settings
;; set completion threshold (default 2)
;; (setq company-minimum-prefix-length 3)
;; global backends
(setq company-backends '(company-dabbrev
                         company-files
                         company-keywords
                         company-yasnippet))


;===================================== Org =====================================

;; lang/org
;; (after! org
;;   ;; fix xdg-open for org
;;   (setq org-file-apps
;;         `(("pdf" . default)
;;           ("\\.x?html?\\'" . default)
;;           (auto-mode . emacs)
;;           (directory . emacs)
;;           (t . ,(cond (IS-MAC "open -R \"%s\"")
;;                       (IS-LINUX "setsid -w xdg-open \"%s\""))))))

;; deft
(setq deft-extensions '("txt" "org"))
(setq deft-directory "~/Dropbox/Org/Notes")
(setq deft-recursive t)
;; (setq deft-use-filename-as-title t)


;; org export custom article using koma class scrartcl
;; fix proper
(after! ox-latex
  (setq org-latex-default-class "koma-article")
  (add-to-list 'org-latex-classes
               '("koma-article"
                 "\\documentclass[a4paper,oneside,
                                  headings=standardclasses,
                                  %headings=normal,
                                  %egregdoesnotlikesansseriftitles,
                                  parskip=full
                                  ]{scrartcl}
                    \\usepackage[sfdefault,light]{roboto}
                    %\\renewcommand{\\familydefault}{\\sfdefault}
                    \\usepackage[T1]{fontenc}
                    \\usepackage[nswissgerman,english]{babel}"
                 ;; \\usepackage{titlesec}
                 ;; \\titleformat*{\section}{\large\bfseries}
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))


;==================================== Latex ====================================

;; pdf viewer (if pdf enabled, pdf-tools is used otherwise)
(setq +latex-viewers '(Evince))

(after! latex
  ;; turn of auto-fill-mode (better way?)
  (add-hook 'latex-mode-hook 'turn-off-auto-fill)
  ;; works better with minted environments
  (setq TeX-parse-self t)
  (add-to-list 'LaTeX-verbatim-environments "minted")
  (add-to-list 'LaTeX-verbatim-environments "Verbatim")
  ;; xetex
  (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' --shell-escape %t" TeX-run-TeX nil t))

  ;; Lifted from spacemacs
  (map!
   (:map (TeX-mode-map LaTeX-mode-map)
     (:localleader
       :desc "TeX-command-master"         :n "," #'TeX-command-master          ;; C-c C-c
       :desc "TeX-command-run-all"        :n "a" #'TeX-command-run-all         ;; C-c C-a
       :desc "TeX-view"                   :n "v" #'TeX-view                    ;; C-c C-v
       :desc "TeX-clean"                  :n "d" #'TeX-clean
       :desc "TeX-kill-job"               :n "k" #'TeX-kill-job                ;; C-c C-k
       :desc "TeX-recenter-output-buffer" :n "l" #'TeX-recenter-output-buffer  ;; C-c C-l
       :desc "TeX-insert-macro"           :n "m" #'TeX-insert-macro            ;; C-c C-m
       :desc "LaTeX-fill-paragraph"       :n "fp" #'LaTeX-fill-paragraph       ;; C-c C-q C-p
       :desc "LaTeX-fill-region"          :n "fr" #'LaTeX-fill-region          ;; C-c C-q C-r
       ;; :desc "TeX-comment-or-uncomment-paragraph"  :n "%" #'TeX-comment-or-uncomment-paragraph   ;; C-c %
       ;; :desc "TeX-comment-or-uncomment-region"     :n ";" #'TeX-comment-or-uncomment-region      ;; C-c ; or C-c :
       ))))

(after! bibtex
  ;; bibliography
  ;; (setq reftex-default-bibliography "~/Zotero/bib.bib")
  ;; Optionally specifying a location for the corresponding PDFs
  ;; (setq bibtex-completion-library-path (list "/your/bib/pdfs"))
  ;; dialect, bibtex vs biblatex
  (setq bibtex-dialect 'BibTeX))

;; (after! LaTeX-mode
;;   (set-company-backend!
;;     'latex-mode
;;     'company-auctex
;;     'company-reftex
;;     'company-capf
;;     'company-lsp
;;     'company-files
;;     'company-dabbrev
;;     'company-keywords
;;     'company-yasnippet))


;===================================== ESS =====================================

(after! ess-mode
  ;; Style convention to RStudio
  (setq ess-style 'RStudio)
  (setq ess-r-backend 'lsp)
  (setq ess-use-flymake nil)
  ;; Disable asking for saving the history on exit and do not restore it
  (setq inferior-R-args "--no-restore-history --no-save " ))

;; (after! ess-mode
;;   (set-company-backend! 'ess-mode
;;     'company-capf
;;     'company-lsp
;;     'company-files
;;     'company-dabbrev
;;     'company-keywords
;;     'company-yasnippet))

;; (after! ess-mode
;;   (setq ess-use-company nil)
;;   (defun my-ess-config ()
;;     (make-variable-buffer-local 'company-backends)
;;     (add-to-list 'company-backends
;;                  '(company-R-args
;;                    company-R-objects
;;                    company-R-library
;;                    company-lsp
;;                    company-capf
;;                    company-dabbrev-code
;;                    company-files
;;                    company-dabbrev
;;                    company-keywords
;;                    company-yasnippet
;;                    :separate)))
;; (add-hook 'ess-mode-hook #'my-ess-config))

;; Upstream this is only ess-eval-line - PR this at some point
(map! :after ess
      :map ess-mode-map
      ;; :map ess-r-mode-map
      :n [C-return] #'ess-eval-region-or-line-visibly-and-step)


;================================== Header.el ==================================

;; not working properly, delete?
;; load header.el (alternative: configure simple auto-insert)
;; not on melpa, just use source file
(load! "+header")
(setq header-date-format "%a %b %e %T %Y")
(setq header-file-name 'buffer-file-name)
(setq make-header-hook
      '(header-end-line
        header-file-name
        header-description
        header-author
        header-creation-date
        header-modification-date
        header-end-line))
(autoload 'auto-update-file-header "+header/header2")
(add-hook! 'before-save-hook 'auto-update-file-header)
(add-hook! 'ess-mode-hook 'auto-make-header)


;; ==================================== Stata ====================================

;; Messy, ado-mode on Windows, ado-mode + own functions and shell scripts on Linux
;; Switch to own functions in ESS on Linux?

(after! ado-mode
  (set-company-backend! 'ado-mode
    'company-files
    'company-capf
    'company-dabbrev
    'company-keywords
    'company-yasnippet))

;; ado-mode for Stata
(require 'ado-mode)
(setq ado-submit-default "dofile")
;; send line to stata and move to next
(defun ado-send-line-to-stata (&optional whole-buffer)
  (interactive)
  (ado-command-to-clip ado-submit-default whole-buffer)
  (ado-send-clip-to-stata ado-submit-default ado-comeback-flag)
  (forward-line 1))
;; (define-key ado-mode-map [(control return)] 'ado-send-line-to-stata)
;; (define-key ado-mode-map [(meta control return)] 'ado-send-buffer-to-stata)
;; (define-key ado-mode-map [(control return)] 'stata-rundolines)
;; (define-key ado-mode-map [(meta control return)] 'stata-rundo)
;; (map! (:map ado-mode-map
;;         ("<C-return>"   #'stata-rundolines
;;          "<C-M-return>" #'stata-rundo)))
(map! :after ado-mode
      :map ado-mode-map
      :n [C-return]   #'stata-rundolines
      :n [C-M-return] #'stata-rundo)

;; get rid of this annoying pop up buffer when sending to stata
(add-to-list 'display-buffer-alist
  (cons "\\*Async Shell Command\\*.*" (cons #'display-buffer-no-window nil)))

(defun stata-rundo ()
  "Wrapper of ~/dotfiles/rundo.sh."
  (interactive)
  (save-buffer)
  (start-process-shell-command "rundo" nil (format "~/dotfiles/rundo.sh %s" buffer-file-name)))

(defun stata-rundolines (beg end)
  "Wrapper of ~/dotfiles/rundo.sh."
  (interactive
   ;; 1. If the region is highlighted
   (if (use-region-p)
       ;; the region
       (list (region-beginning) (region-end))
     ;; the line
     (list (line-beginning-position) (line-end-position))))
  ;; 2. move cursor
  (deactivate-mark)
  (goto-char end)
  (backward-char)
  (beginning-of-line)
  (next-logical-line)
  ;; 3. create a temp file
  (let ((tempfile (make-temp-file nil nil ".do")))
    ;; 4. save text to the file
    (write-region beg end tempfile)
    (write-region "\n" nil tempfile t)
    ;; 5. run the command asynchronously
    ;; (remove '&' to run it synchronously, i.e., blocking Emacs)
    ;; (shell-command (format "~/dotfiles/rundo.sh %s &" tempfile))))
    (start-process-shell-command "rundo" nil (format "~/dotfiles/rundo.sh %s" tempfile))))

;; Fix /* */ line ending for ESS Stata
;; https://stackoverflow.com/questions/8069351/fix-undesirable-emacs-tabbing-behavior-in-ess-stata
;; not working
