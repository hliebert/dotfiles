;===============================================================================
;; Filename: config.el
;; Description: config file for doom-emacs
;; Author: Helge Liebert
;; Created: Mon Apr 16 23:56:45 2018
;; Last-Updated: Mo Feb 17 23:14:22 2020
;===============================================================================

;================================ Basic settings ===============================

;; User
(setq user-mail-address "helge.liebert@gmail.com"
      user-full-name    "Helge Liebert")

;; Org
(setq +org-dir (expand-file-name "~/Dropbox/Org/")
      org-projectile-file (expand-file-name "~/Dropbox/Org/projects.org"))

;; Doom UI settings
(setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-vibrant)
;; (setq doom-theme 'rebecca)
(setq doom-font (font-spec :family "MesloLGS NF"))

;; Disable emacs asking for confirmation on quit if there are no modified buffers
;; (setq confirm-kill-emacs t)


;================================== Dictionary =================================

;; dictionaries
;; (setq ispell-dictionary "american")
;; activate multiple dictionaries to avoid switching between German and English
(after! ispell
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "de_CH,en_US")
  ;; ispell-set-spellchecker-params has to be called
  ;; before ispell-hunspell-add-multi-dic will work
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "de_CH,en_US"))

;; language tool location
(setq langtool-language-tool-jar
      "/snap/languagetool/13/usr/bin/languagetool-commandline.jar")


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

;; Center search results
;; (advice-add 'evil-ex-search-next :after
;;             (lambda (&rest x) (evil-scroll-line-to-center (line-number-at-pos))))
;; (advice-add 'evil-ex-search-previous :after
;;             (lambda (&rest x) (evil-scroll-line-to-center (line-number-at-pos))))


;================================= Key mappings ================================

;; These are old, set before doom moved to general.el.
;; Probably need fixing. Try without them?
(map!
 :nv "C-=" 'text-scale-increase ;; also SPC  ]]
 :nv "C--" 'text-scale-decrease ;; also SPC  [[, masks negative prefix
 (:leader
   :desc "Comment"                      :nv ";"   #'evilnc-comment-operator
   (:prefix "f"
     :desc "Save file"                  :n  "s"   #'save-buffer
     :desc "Save file as"               :n  "S"   #'write-file
     :desc "Copy this file"             :n  "c"   #'doom/copy-this-file
     :desc "Copy a file"                :n  "C"   #'copy-file
     :desc "Move this file"             :n  "m"   #'doom/move-this-file
     ;; :desc "Find file jump"             :n  "j"   #'counsel-file-jump
     :desc "Find file jump"             :n  "j"   #'dired-jump
     :desc "Find file"                  :n  "f"   #'counsel-find-file
     :desc "Find file fzf"              :n  "z"   #'counsel-fzf
     :desc "Find file rg"               :n  "g"   #'counsel-rg
     :desc "Find file ag"               :n  "a"   #'counsel-ag
     :desc "Find file in project"       :n  "p"   #'counsel-projectile
     :desc "Treemacs"                   :n  "t"   #'+treemacs/toggle)
   (:prefix "b"
     :desc "Open agenda file in buffer" :n  "a"   #'org-cycle-agenda-files
     :desc "Open ibuffer"               :n  "I"   #'ibuffer
     :desc "Save buffer"                :n  "s"   #'save-buffer
     :desc "Save buffer as"             :n  "S"   #'write-file
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
   (:prefix "t"
     :desc "Toggle flyspell dictionary" :n  "l"   #'ispell-change-dictionary
     :desc "Toggle truncate lines"      :n  "l"   #'toggle-truncate-lines)
   (:prefix "i"
     :desc "Org-capture"                         :n  "c"   #'org-capture
     :desc "Org-projectile todo current project" :n  "t"   #'org-projectile-capture-for-current-project
     :desc "Org-projectile todo any project"     :n  "i"   #'org-projectile-project-todo-completing-read
     :desc "Banner-comment"                      :n  "h"   #'banner-comment)
     ))

;================================= Dired/ranger ================================

;; Set ranger not to override dired
;; (after! ranger
;;   (setq ranger-override-dired nil))


;===================================== Ivy =====================================

;; (after! ivy
;;   ;; do not display ./ and ../ in counsel
;;   (setq ivy-extra-directories nil)
;;   ;; RET also completes directory and doesn't open dired (ivy-done before)
;;   (map! (:map ivy-minibuffer-map
;;           ("<C-return>" #'ivy-immediate-done))))


;=================================== Company ===================================

;; company settings
;; set completion threshold
(setq company-minimum-prefix-length 3)
;; global backends
(setq company-backends '(company-dabbrev
                         company-files          ; files & directory
                         company-keywords       ; keywords
                         ;; company-capf
                         company-yasnippet))


;===================================== Org =====================================

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


;==================================== Latex ====================================

;; latex
(after! latex
  ;; works better with minted environments
  (setq TeX-parse-self t)
  (add-to-list 'LaTeX-verbatim-environments "minted")
  ;; pdf viewer
  ;; (setq TeX-view-program-selection '((output-pdf "Evince")))
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

        :desc "TeX-comment-or-uncomment-paragraph"  :n "%" #'TeX-comment-or-uncomment-paragraph   ;; C-c %
        :desc "TeX-comment-or-uncomment-region"     :n ";" #'TeX-comment-or-uncomment-region))))     ;; C-c ; or C-c :

(after! bibtex
  ;; bibliography
  ;; (setq reftex-default-bibliography "~/Zotero/bib.bib")
  ;; Optionally specifying a location for the corresponding PDFs
  ;; (setq bibtex-completion-library-path (list "/your/bib/pdfs"))
  ;; dialect, bibtex vs biblatex
  (setq bibtex-dialect 'BibTeX))

(after! LaTeX-mode
  (set-company-backend!
    'latex-mode
    'company-auctex
    'company-reftex
    'company-capf
    'company-lsp
    'company-files
    'company-dabbrev
    'company-keywords
    'company-yasnippet))


;===================================== ESS =====================================

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

;; Upstream this is only ess-eval-line - PR this at some point
(map! :after ess
      :map ess-mode-map
      :n [C-return] #'ess-eval-line-visibly-and-step)

;; lintr
(after! flycheck
(customize-set-variable 'flycheck-lintr-linters
                        "with_defaults(commented_code_linter = NULL,
                                       snake_case_linter     = NULL,
                                       object_name_linter    = dotted.case,
                                       line_length_linter    = NULL)"))

(after! ess-mode
  ;; Style convention to RStudio
  (ess-set-style 'RStudio)
  ;; Disable asking for saving the history on exit and do not restore it
  (setq inferior-R-args "--no-restore-history --no-save " ))


;==================================== Stata ====================================

;; Messy, ado-mode on Windows, own functions and shell scripts on Linux

(after! ado-mode
  (set-company-backend! 'ado-mode
    'company-files
    'company-capf
    'company-dabbrev
    'company-keywords
    'company-yasnippet))

;; ado-mode for Stata
;; (require 'ado-mode)
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




