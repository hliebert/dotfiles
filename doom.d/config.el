;===============================================================================
;; Filename: config.el
;; Description: config file for doom-emacs
;; Author: Helge Liebert
;; Created: Mon Apr 16 23:56:45 2018
;; Last-Updated: Do Feb 13 16:31:51 2020
;===============================================================================

;;
;; Basic settings
;;

;; user
(setq user-mail-address "helge.liebert@gmail.com"
      user-full-name    "Helge Liebert")

;; org
(setq +org-dir (expand-file-name "~/Dropbox/Org/")
      ;; org-projectile-file (expand-file-name "~/Dropbox/org/projects.org")
      org-ellipsis " ▼ ")


;; Doom ui settings
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-vibrant)
(setq doom-theme 'rebecca)
;; (setq doom-org-special-tags nil)
;; (setq doom-font (font-spec :family "FuraMono Nerd Font"))
;; (setq doom-font (font-spec :family "UbuntuMono Nerd Font"))
(setq doom-font (font-spec :family "MesloLGS NF"))
(setq +doom-modeline-buffer-file-name-style 'relative-from-project
      show-trailing-whitespace t)
(add-hook! minibuffer-setup (setq-local show-trailing-whitespace nil))

;; leader keys (get , to be shortcut for SPC-m?)
;; (setq doom-localleader-key ",")
;; (setq +default-repeat-forward-key ";")
;; (setq +default-repeat-backward-key ",")

;; Basic misc settings, probably a better solution available
(setq-default split-width-threshold 80)
;; (setq-default tab-width 2)
;; (setq-default evil-shift-width 2)
(setq-default evil-kill-on-visual-paste nil)

;; Spaces over tabs
;; (setq c-basic-indent 2)
;; (setq c-default-style "linux")
;; (setq tab-width 2)
;; (setq-default indent-tabs-mode nil)
;; always delete trailing whitespace on save
(add-hook 'before-save-hook #'delete-trailing-whitespace)

;; delete things by moving them to trash
(setq delete-by-moving-to-trash t)

;; ediff
;; (setq-default ediff-auto-refine 'on)
;; ediff whitespace/newline settings
;; (setq-default ediff-ignore-similar-regions t)
;; (setq ediff-diff-options "-w")

;;
;; Keybindings
;;

;; separate into a different file?

(map!
 :nv "C-=" 'text-scale-increase ;; also SPC  ]]
 :nv "C--" 'text-scale-decrease ;; also SPC  [[, masks negative prefix
 (:leader
   :desc "Comment"                      :nv ";"   #'evilnc-comment-operator
   ;; :desc "M-x"                          :nv "SPC" #'counsel-M-x
   ;; :desc "M-x"                          :nv "SPC" #'helm-M-x
   ;; caution, remapping tab removes all workspace keybindings
   ;; :desc "Other buffer"               :n  "TAB" #'+helge/alternate-buffer
   ;; :desc "Previous buffer"            :n  "TAB" #'previous-buffer
   ;; :desc "Next buffer"                :n  "ESC" #'next-buffer
   (:prefix "f"
     :desc "Save file"                  :n  "s"   #'save-buffer
     :desc "Save file as"               :n  "S"   #'write-file
     :desc "Copy this file"             :n  "c"   #'doom/copy-this-file
     :desc "Copy a file"                :n  "C"   #'copy-file
     ;; :desc "Move this file"             :n  "m"   #'+helge/move-this-file
     :desc "Move this file"             :n  "m"   #'doom/move-this-file
     ;; :desc "Find file jump"             :n  "j"   #'counsel-file-jump
     :desc "Find file jump"             :n  "j"   #'dired-jump
     :desc "Find file"                  :n  "f"   #'counsel-find-file
     :desc "Find file fzf"              :n  "z"   #'counsel-fzf
     :desc "Find file rg"               :n  "g"   #'counsel-rg
     :desc "Find file ag"               :n  "a"   #'counsel-ag
     :desc "Find file in project"       :n  "p"   #'counsel-projectile
     ;; :desc "Find file jump"             :n  "j"   #'helm-file-jump
     ;; :desc "Find file"                  :n  "f"   #'helm-find-files
     ;; :desc "Find file ag"               :n  "a"   #'helm-ag
     ;; :desc "Find file in project"       :n  "p"   #'helm-projectile
     :desc "Treemacs"                   :n  "t"   #'+treemacs/toggle)
     ;; :desc "Find file in dotfiles"      :n  "t"   #'+helge/find-in-dotfiles
     ;; :desc "Browse dotfiles"            :n  "T"   #'+helge/browse-dotfiles)
   (:prefix "b"
     :desc "Open agenda file in buffer" :n  "a"   #'org-cycle-agenda-files
     :desc "Open ibuffer"               :n  "I"   #'ibuffer
     :desc "Save buffer"                :n  "s"   #'save-buffer
     :desc "Save buffer as"             :n  "S"   #'write-file
     ;; :desc "Switch buffer"              :n  "b"   #'ivy-switch-buffer
     ;; :desc "Switch workspace buffer"    :n  "B"   #'+ivy/switch-workspace-buffer
     :desc "Next buffer"                :n  "l"   #'next-buffer
     :desc "Previous buffer"            :n  "h"   #'previous-buffer
     :desc "Other buffer"               :n  "TAB" #'+helge/alternate-buffer
     :desc "Kill buffer"                :n  "d"   #'kill-this-buffer
     :desc "Kill other buffers"         :n  "m"   #'kill-other-buffers
     :desc "Kill buffer and window"     :n  "q"   #'kill-buffer-and-window)
   (:prefix "w"
     :desc "Delete window"              :n  "d"   #'delete-window
     :desc "Kill buffer and window"     :n  "q"   #'kill-buffer-and-window
     :desc "Maximize buffer"            :n  "m"   #'+helge/toggle-maximize-buffer
     :desc "Other window"               :n  "w"   #'other-window
     :desc "Alternate window"           :n  "TAB" #'+helge/alternate-window
     :desc "Split window vertically"    :n  "/"   #'split-window-right
     :desc "Split window horizontally"  :n  "-"   #'split-window-below)
   (:prefix "s"
     :desc "Search clear"               :n  "c"   #'evil-ex-nohighlight)
   ;; (:prefix "p"
   ;;   :desc "Projectile find file"       :n  "f"   #'projectile-find-file)
   (:prefix "t"
     ;; create toggle for this, lift from spacemacs
     ;; :desc "Toggle visual line mode"   :n  "L"   #'visual-line-mode
     :desc "Toggle flyspell dictionary" :n  "l"   #'ispell-change-dictionary
     :desc "Toggle truncate lines"      :n  "l"   #'toggle-truncate-lines)
   (:prefix "i"
     :desc "Org-capture"                         :n  "c"   #'org-capture
     :desc "Org-projectile todo current project" :n  "t"   #'org-projectile-capture-for-current-project
     :desc "Org-projectile todo any project"     :n  "i"   #'org-projectile-project-todo-completing-read
     :desc "Banner-comment"                      :n  "h"   #'banner-comment)
   ;; (:prefix "/"
     ;; :desc "Find file"                  :n  "d"   #'counsel-find-file
     ;; :desc "Find file jump"             :n  "j"   #'counsel-file-jump
     ;; :desc "Find file fzf"              :n  "z"   #'counsel-fzf
     ;; :desc "Swiper"                     :n  "/"   #'swiper
     ;; :desc "Find file rg"               :n  "g"   #'counsel-rg
     ;; :desc "Find file ag"               :n  "a"   #'counsel-ag)
     ))



;;
;; Modules
;;

;; turn off creating a new workspace when opening a new frame
;; (after! persp-mode
  ;; for emacsclient spawned frames:
  ;; (setq persp-emacsclient-init-frame-behaviour-override nil))
  ;; for interactively created frames:
  ;; (setq persp-interactive-init-frame-behaviour-override t))

;; helm delete whole directory
;; (map! :after helm-files
;;       :map helm-find-files-map
;;       "<DEL>" #'helm-find-files-up-one-level)

;; ;; ivy
(after! ivy
  ;; do not display ./ and ../ in counsel
  (setq ivy-extra-directories nil)
  ;; RET also completes directory and doesn't open dired (ivy-done before)
  (map! (:map ivy-minibuffer-map
          ("<C-return>" #'ivy-immediate-done))))

;; dired
;; enable `a' for dired-find-alternate-file

;; disable ranger in init.el, load as package
;; ranger
;; (after! dired
;;   (put 'dired-find-alternate-file 'disabled nil)
;;   (define-key ranger-normal-mode-map (kbd "+") #'dired-create-directory))
;; (after! dired
;;   (setq ranger-override-dired nil))

;; ;; dired-x
;; (add-hook 'dired-load-hook
;;                (lambda ()
;;                  (load "dired-x")
;;                  ;; Set dired-x global variables here.  For example:
;;                  ;; (setq dired-guess-shell-gnutar "gtar")
;;                  ;; (setq dired-x-hands-off-my-keys nil)
;;                  ))
;;      (add-hook 'dired-mode-hook
;;                (lambda ()
;;                  ;; Set dired-x buffer-local variables here.  For example:
;;                  ;; (dired-omit-mode 1)
;;                  ))

;; lang/org
(after! org
  ;; fix xdg-open for org
  (setq org-file-apps
        `(("pdf" . default)
          ("\\.x?html?\\'" . default)
          (auto-mode . emacs)
          (directory . emacs)
          (t . ,(cond (IS-MAC "open -R \"%s\"")
                      (IS-LINUX "setsid -w xdg-open \"%s\""))))))

;; (after! org
;;   (setq org-directory "~/Dropbox/org")
;;   (setq org-default-notes-file (concat org-directory "/capture.org")))

(after! org-bullets
  ;; The standard unicode characters are usually misaligned depending on the
  ;; font. This bugs me. Personally, markdown #-marks for headlines are more
  ;; elegant, so we use those.
  (setq org-bullets-bullet-list '("#")))

;; deft
(setq deft-extensions '("txt" "org"))
(setq deft-directory "~/Dropbox/Org/Notes")
(setq deft-recursive t)
;; (setq deft-use-filename-as-title t)


;; org export custom article using koma class scrartcl
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
                    %\\usepackage{mathptmx}
                    %\\usepackage{charter}
                    %\\usepackage[garamond]{mathdesign}
                    \\usepackage[sfdefault,light]{roboto}
                    %\\renewcommand{\\familydefault}{\\sfdefault}
                    \\usepackage[T1]{fontenc}
                    \\usepackage[nswissgerman,english]{babel}"
                 ;; \\usepackage{PTSans}
                 ;; \usepackage[charter]{mathdesign}
                 ;; \\usepackage[garamond]{mathdesign}
                 ;; \\usepackage[full]{textcomp}
                 ;; \\usepackage{garamondx}
                 ;; \\usepackage[varqu,varl,var0,scaled=0.97]{inconsolata}
                 ;; \\usepackage{FiraSans}
                 ;; \\usepackage{newpxtext}
                 ;; \\usepackage{newpxmath}
                 ;; \\usepackage{roboto}
                 ;; \\usepackage{charter}
                 ;; \\renewcommand\sfdefault{\rmdefault}
                 ;; \\usepackage{cmbright}
                 ;; \\usepackage[sfdefault]{roboto}
                 ;; \\usepackage{mathptmx}
                 ;; \\usepackage{lmodern}
                 ;; \\usepackage[defaultsans]{droidsans}
                 ;; \\usepackage{titlesec}
                 ;; \\titleformat*{\section}{\large\bfseries}
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

;; latex
(after! latex
  ;; works better with minted environments
  (setq TeX-parse-self t)
  (add-to-list 'LaTeX-verbatim-environments "minted")
  ;; pdf viewer
  (setq TeX-view-program-selection '((output-pdf "Evince")))
  ;; (setq TeX-view-program-selection '((output-pdf "xdg-open")))
  (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
  ;; (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' --shell-escape %t" TeX-run-TeX nil t))

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

        :desc "TeX-comment-or-uncomment-paragraph"  :n "%" #'TeX-comment-or-uncomment-paragraph   ;; C-c %
        :desc "TeX-comment-or-uncomment-region"     :n ";" #'TeX-comment-or-uncomment-region))))     ;; C-c ; or C-c :

(after! bibtex
  ;; bibliography
  ;; (setq reftex-default-bibliography "~/Zotero/bib.bib")
  ;; Optionally specifying a location for the corresponding PDFs
  ;; (setq bibtex-completion-library-path (list "/your/bib/pdfs"))
  ;; dialect, bibtex vs biblatex
  (setq bibtex-dialect 'BibTeX)
)

;; fix evil paragraph to behave like vim
;; works for latex, not for org-mode
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

;; company settings
;; set completion threshold
(setq company-minimum-prefix-length 3)
;; global backends
(setq company-backends '(company-dabbrev
                         company-files          ; files & directory
                         company-keywords       ; keywords
                         ;; company-capf
                         company-yasnippet))


(after! LaTeX-mode
  (set-company-backend!
    'latex-mode
    'company-auctex
    'company-capf
    'company-lsp
    'company-files
    'company-dabbrev
    'company-keywords
    'company-yasnippet))


;; (after! ess-mode
;;   (set-company-backend! 'ess-mode
;;     'company-capf
;;     'company-lsp
;;     'company-files
;;     'company-dabbrev
;;     'company-keywords
;;     'company-yasnippet))

(after! ess-mode
  (setq ess-use-company nil)
  (defun my-ess-config ()
    (make-variable-buffer-local 'company-backends)
    (add-to-list 'company-backends
                 '(company-R-args
                   company-R-objects
                   company-R-library
                   company-lsp
                   company-capf
                   company-dabbrev-code
                   company-files
                   company-dabbrev
                   company-keywords
                   company-yasnippet
                   :separate)))
(add-hook 'ess-mode-hook #'my-ess-config))




;; Henrik will upstream this at some point - done
;; but only eval-line - PR this at some point
(map! :after ess
      :map ess-mode-map
      :n [C-return] #'ess-eval-line-visibly-and-step)

(after! flycheck
(customize-set-variable 'flycheck-lintr-linters
                        "with_defaults(commented_code_linter = NULL,
                                       snake_case_linter     = NULL,
                                       object_name_linter    = dotted.case,
                                       line_length_linter    = NULL)"))

(after! ado-mode
  (set-company-backend! 'ado-mode
    'company-files
    'company-capf
    'company-dabbrev
    'company-keywords
    'company-yasnippet))

;; whitespace
;; (setq-default whitespace-style
;;               '(face indentation tabs tab-mark spaces space-mark newline
;;                      newline-mark trailing lines-tail))
(setq whitespace-line-column 80)
;; (add-hook   'find-file-hook #'whitespace-mode)
;; (add-hook! 'before-save-hook #'whitespace-cleanup)

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


;; Magit rules
;; Keeps it on the side
;; Thanks to https://github.com/fuxialexander/doom-emacs-private-xfu
;; (after! magit
;;   (set! :popup "^\\(?: ?\\*\\)?magit.*: "
;;     '((slot . -1) (side . right) (size . 80))
;;     '((select . t) (quit . nil)))
;;   (set! :popup "^\\*magit.*popup\\*"
;;     '((slot . 0) (side . right))
;;     '((select . t)))
;;   (set! :popup "^\\(?: ?\\*\\)?magit-revision:.*"
;;     '((slot . 2) (side . right) (window-height . 0.6))
;;     '((select . t)))
;;   (set! :popup "^\\(?: ?\\*\\)?magit-diff:.*"
;;     '((slot . 2) (side . right) (window-height . 0.6))
;;     '((select . nil)))
;;   )


;; Neotree
(after! neotree
  ;; When switching to a file in the current project, expand the directory
  ;; tree to the new file buffer
  (add-hook! 'find-file-hook
    (if (and (buffer-file-name) (neo-global--window-exists-p))
        ;; And only if the file is a child of the current neotree root
        (if (neo-global--file-in-root-p (buffer-file-name))
            ;; We need to trigger neotree-find then switch back to the buffer we just opened
            (save-current-buffer (neotree-find))
          ))
    ))

;; disable emacs asking for confirmation on quit if there are no modified buffers
;; (defun doom-quit-if-no-modified-buffers-p (&optional prompt)
;;   (if (cl-find-if #'buffer-modified-p (buffer-list))
;;       (or (yes-or-no-p (format "››› %s" (or prompt "Quit Emacs?")))
;;           (ignore (message "Aborted")))
;;     t))
;; (setq confirm-kill-emacs #'doom-quit-if-no-modified-buffers-p)
(setq confirm-kill-emacs nil)


;; ;; ess
(after! ess-mode
  (ess-set-style 'RStudio)
  (setq inferior-R-args "--no-restore-history --no-save " ))
;;   (map!
;;    (:map (ess-mode)
;;      :nv "<C-return>" 'ess-eval-region-or-line-visibly-and-step
;;       ;; (:localleader
;;       ;;   :desc "TeX-command-master"         :n "," #'TeX-command-master))))
;; )))

;; lsp server for R - works without setting it up here now?
;; (after! lsp-mode
;;   (lsp-register-client
;;       (make-lsp-client :new-connection
;;           (lsp-stdio-connection '("R" "--slave" "-e" "languageserver::run()"))
;;           :major-modes '(ess-r-mode inferior-ess-r-mode)
;;           :server-id 'lsp-R)))

;; language tool location
(setq langtool-language-tool-jar
      "/snap/languagetool/13/usr/bin/languagetool-commandline.jar")

;; dictionaries
(setq ispell-dictionary "american")
;; activate multiple dictionaries to avoid switching between German and English
;; lifted this from emacs.stackexchange.com
;; broken due to upstream naming bug in hunspell
;; (after! ispell
;;   (setq ispell-program-name "hunspell")
;;   (setq ispell-dictionary "de_CH,en_US")
;;   ;; ispell-set-spellchecker-params has to be called
;;   ;; before ispell-hunspell-add-multi-dic will work
;;   (ispell-set-spellchecker-params)
;;   (ispell-hunspell-add-multi-dic "de_CH,en_US"))

;; center search results
(advice-add 'evil-ex-search-next :after
            (lambda (&rest x) (evil-scroll-line-to-center (line-number-at-pos))))
(advice-add 'evil-ex-search-previous :after
            (lambda (&rest x) (evil-scroll-line-to-center (line-number-at-pos))))
;; remove evil-ex-search-next from ;
;; (map! :after evil-mode :n ";" nil)

;; python
;; (setq python-remove-cwd-from-path nil)
;; (setq python-shell-interpreter "python3")
 ;; (setq python-shell-interpreter "ipython"
    ;; python-shell-interpreter-args "-i")
;; (setq python-shell-interpreter "~/anaconda3/bin/ipython3"
;;       python-shell-interpreter-args "-i --simple-prompt --pprint")
    ;; python-shell-interpreter-args "-i --pprint")
      ;; python-shell-interpreter-args "--simple-prompt --pprint")
;; (setq python-shell-interpreter "jupyter"
;;       python-shell-interpreter-args "console --simple-prompt")

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
(map! (:map ado-mode-map
        ("<C-return>"   #'stata-rundolines
         "<C-M-return>" #'stata-rundo)))

;; get rid of this annoying pop up buffer when sending to stata
;; none of this works
;; (set-popup-rule! "^\\*Async Shell Command\\*.*" :ignore t :ttl 0)
(add-to-list 'display-buffer-alist
  (cons "\\*Async Shell Command\\*.*" (cons #'display-buffer-no-window nil)))
;; (defun async-shell-command-no-window
;;     (command)
;;   (interactive)
;;   (let
;;       ((display-buffer-alist
;;         (list
;;          (cons
;;           "\\*Async Shell Command\\*.*"
;;           (cons #'display-buffer-no-window nil)))))
;;     (async-shell-command
;;      command)))


;; text mode wrap
;; (add-hook 'text-mode-hook 'auto-fill-mode)
;; (setq-default fill-column 80)
;; use change-window-with function

;; persistent undo
;; still broken, disabled for now, corrupts undo history
;; (global-undo-tree-mode)
;; (setq undo-tree-enable-undo-in-region nil)
;; (setq undo-tree-auto-save-history t)
;; (setq undo-tree-history-directory-alist '(("." . "~/.undo-emacs/")))
;; (unless (file-exists-p "~/.undo-emacs/")
;;   (make-directory "~/.undo-emacs/"))


;; rebox 2
(setq rebox-style-loop '(24 16))
(require 'rebox2)
;; (global-set-key [(meta q)] 'rebox-dwim)

;; simple comment box
(defun full-comment-box (b e)
  "Draw a box comment around the region but arrange for the region
to extend to at least the fill column. Place the point after the
comment box."
  (interactive "r")
  (let ((e (copy-marker e t)))
    (goto-char b)
    (end-of-line)
    (insert-char ?  (- fill-column
                       (current-column)
                       (* 2 (+ comment-add
                               (length comment-start)
                               (length comment-padding)))))
    (comment-box b e 1)
    (goto-char e)
    (set-marker e nil)))
;; (global-set-key (kbd "C-c b b") 'full-comment-box)


;; (after! org-projectile
;;   (setq org-projectile-projects-file "~/Dropbox/Org/projects.org")
;;   (push (org-projectile-project-todo-entry) org-capture-templates)
;;   (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files))))
;;   ;; (global-set-key (kbd "C-c c") 'org-capture)
;;   ;; (global-set-key (kbd "C-c n p") 'org-projectile-project-todo-completing-read))


;; ;;;; hledger mode
;; (after! hledger-mode
;;   ;; To open files with .journal extension in hledger-mode
;;   (add-to-list 'auto-mode-alist '("\\.journal\\'" . hledger-mode))
;;   ;; Provide the path to you journal file.
;;   ;; The default location is too opinionated.
;;   (setq hledger-jfile "~/Dropbox/org/hledger.journal")
;;   ;;; Auto-completion for account names
;;   ;; For company-mode users,
;;   (add-to-list 'company-backends 'hledger-company))

;; ;; Personal Accounting
;; (global-set-key (kbd "C-c e") 'hledger-jentry)
;; (global-set-key (kbd "C-c j") 'hledger-run-command)


;; (defun rundo (beg end)
;;   "Wrapper of ~/dotfiles/rundo.sh."
;;   (interactive
;;    ;; 1. If the region is highlighted
;;    (if (use-region-p)
;;        ;; the region
;;        (list (region-beginning) (region-end))
;;      ;; the line
;;      (list (line-beginning-position) (line-end-position))))
;;   ;; 2. create a temp file
;;   (let ((tempfile (make-temp-file nil nil ".do")))
;;     ;; 3. save text to the file
;;     (write-region beg end tempfile)
;;     (write-region "\n" nil tempfile t)
;;     ;; 4. run the command asynchronously
;;     ;; (remove '&' to run it synchronously, i.e., blocking Emacs)
;;     ;; (shell-command (format "~/dotfiles/rundo.sh %s &" tempfile))))
;;     (start-process-shell-command "rundo" nil (format "~/dotfiles/rundo.sh %s" tempfile))))


;; (defun stata-rundolines (beg end)
;;   "Wrapper of ~/dotfiles/rundo.sh."
;;   (interactive
;;    ;; 1. If the region is highlighted
;;    (if (use-region-p)
;;        ;; the region
;;        (list (region-beginning) (region-end))
;;      ;; the line
;;      (list (line-beginning-position) (line-end-position))))
;;   ;; Unselect region, move cursor down one line
;;   (deactivate-mark)
;;   ;; (forward-line 1)
;;   (next-logical-line)
;;   (beginning-of-line)
;;   ;; 2. create a temp file
;;   (let ((tempfile (make-temp-file nil nil ".do")))
;;     ;; 3. save text to the file
;;     (write-region beg end tempfile)
;;     (write-region "\n" nil tempfile t)
;;     ;; 4. run the command asynchronously
;;     ;; (remove '&' to run it synchronously, i.e., blocking Emacs)
;;     ;; (shell-command (format "~/dotfiles/rundo.sh %s &" tempfile))))
;;     (start-process-shell-command "rundo" nil (format "~/dotfiles/rundo.sh %s" tempfile))))

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
