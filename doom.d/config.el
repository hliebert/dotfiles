;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Filename: config.el
;; Description: config file for doom-emacs
;; Author: Helge Liebert
;; Created: Mon Apr 16 23:56:45 2018
;; Last-Updated: Mi Jan  9 14:23:51 2019
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;; Basic settings
;;

;; fix for lag bug due to double-buffering,
;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=28695
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;; user
(setq user-mail-address "helge.liebert@gmail.com"
      user-full-name    "Helge Liebert")

;; org
(setq +org-dir (expand-file-name "~/Dropbox/org/")
      ;; org-projectile-file (expand-file-name "~/Dropbox/org/projects.org")
      org-ellipsis " ▼ ")


;; Doom ui settings
(setq doom-theme 'doom-vibrant)
(setq doom-org-special-tags nil)
;; (setq doom-font (font-spec :family "Fura Mono Nerd Font" :size 12))
(setq +doom-modeline-buffer-file-name-style 'relative-from-project
      show-trailing-whitespace t)
(add-hook! minibuffer-setup (setq-local show-trailing-whitespace nil))

;; localleader (try to designate both SPC m  and , as localleader at some point)
;; (setq doom-localleader-key ",")
;; (setq +default-repeat-forward-key ";")
;; (setq +default-repeat-backward-key ",")

;; Basic misc settings, probably a better solution available
(setq-default split-width-threshold 80)
;; (setq-default tab-width 2)
;; (setq-default evil-shift-width 2)
;; Spaces over tabs
;; (setq c-basic-indent 2)
;; (setq c-default-style "linux")
;; (setq tab-width 2)
;; (setq-default indent-tabs-mode nil)
;; always delete trailing whitespace on save
(add-hook 'before-save-hook #'delete-trailing-whitespace)


;;
;; Keybindings
;;

;; separate into a different file?

(map!
 "C-=" 'text-scale-increase ;; also SPC  ]]
 "C--" 'text-scale-decrease ;; also SPC  [[, masks negative prefix
 (:leader
   :desc "Comment"                      :nv ";"   #'evil-commentary
   :desc "M-x"                          :nv "SPC" #'counsel-M-x
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
     :desc "Find file jump"             :n  "j"   #'counsel-file-jump
     :desc "Find file"                  :n  "f"   #'counsel-find-file
     :desc "Find file fzf"              :n  "z"   #'counsel-fzf
     :desc "Find file rg"               :n  "g"   #'counsel-rg
     :desc "Find file ag"               :n  "a"   #'counsel-ag
     :desc "Find file in project"       :n  "p"   #'counsel-projectile
     :desc "Treemacs"                   :n  "t"   #'+treemacs/toggle)
     ;; :desc "Find file in dotfiles"      :n  "t"   #'+helge/find-in-dotfiles
     ;; :desc "Browse dotfiles"            :n  "T"   #'+helge/browse-dotfiles)
   (:prefix "b"
     :desc "Open agenda file in buffer" :n  "a"   #'org-cycle-agenda-files
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
   (:prefix "p"
     :desc "Projectile find file"       :n  "f"   #'counsel-projectile-find-file)
   (:prefix "t"
     ;; create toggle for this, lift from spacemacs
     ;; :desc "Toggle visual line mode"   :n  "L"   #'visual-line-mode
     :desc "Toggle flyspell dictionary" :n  "l"   #'ispell-change-dictionary
     :desc "Toggle truncate lines"      :n  "l"   #'toggle-truncate-lines)
   (:prefix "/"
     :desc "Find file"                  :n  "d"   #'counsel-find-file
     :desc "Find file jump"             :n  "j"   #'counsel-file-jump
     :desc "Find file fzf"              :n  "z"   #'counsel-fzf
     :desc "Swiper"                     :n  "/"   #'swiper
     :desc "Find file rg"               :n  "g"   #'counsel-rg
     :desc "Find file ag"               :n  "a"   #'counsel-ag)))



;;
;; Modules
;;

;; helm delete whole directory
;; (map! :after helm-files
;;       :map helm-find-files-map
;;       "<DEL>" #'helm-find-files-up-one-level)

;; ivy
(after! ivy
  ;; do not display ./ and ../ in counsel
  (setq ivy-extra-directories nil)
  ;; RET also completes directory and doesn't open dired (ivy-done before)
  (map! (:map ivy-minibuffer-map
          ("<C-return>" #'ivy-immediate-done))))

;; feature/evil
(after! evil-mc
  ;; Make evil-mc resume its cursors when I switch to insert mode
  (add-hook! 'evil-mc-before-cursors-created
    (add-hook 'evil-insert-state-entry-hook #'evil-mc-resume-cursors nil t))
  (add-hook! 'evil-mc-after-cursors-deleted
    (remove-hook 'evil-insert-state-entry-hook #'evil-mc-resume-cursors t)))

;; dired
;; enable `a' for dired-find-alternate-file
(put 'dired-find-alternate-file 'disabled nil)

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

(after! org-bullets
  ;; The standard unicode characters are usually misaligned depending on the
  ;; font. This bugs me. Personally, markdown #-marks for headlines are more
  ;; elegant, so we use those.
  (setq org-bullets-bullet-list '("#")))

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
  ;; (setq TeX-view-program-selection '((output-pdf "Evince")))
  (setq TeX-view-program-selection '((output-pdf "xdg-open")))
  (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))

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


;; language tool location
(setq langtool-language-tool-jar
      "/snap/languagetool/13/usr/bin/languagetool-commandline.jar")

;; activate multiple dictionaries to avoid switching between German and English
;; lifted this from emacs.stackexchange.com
;; broken due to upstream naming bug in hunspell
; (after! ispell
  ; (setq ispell-program-name "hunspell")
  ; (setq ispell-dictionary "de_CH,en_US")
  ; ;; ispell-set-spellchecker-params has to be called
  ; ;; before ispell-hunspell-add-multi-dic will work
  ; (ispell-set-spellchecker-params)
  ; (ispell-hunspell-add-multi-dic "de_CH,en_US"))

;; center search results
(advice-add 'evil-ex-search-next :after
            (lambda (&rest x) (evil-scroll-line-to-center (line-number-at-pos))))
(advice-add 'evil-ex-search-previous :after
            (lambda (&rest x) (evil-scroll-line-to-center (line-number-at-pos))))

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
(define-key ado-mode-map [(control return)] 'ado-send-line-to-stata)
(define-key ado-mode-map [(meta control return)] 'ado-send-buffer-to-stata)

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
;; disabled for now, corrupts undo history
(global-undo-tree-mode)
(setq undo-tree-enable-undo-in-region nil)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist '(("." . "~/.undo-emacs/")))
(unless (file-exists-p "~/.undo-emacs/")
  (make-directory "~/.undo-emacs/"))









;; (after! org-projectile
;;   (require 'org-projectile)
;;   (org-projectile-per-project)
;;   (setq org-projectile-per-project-filepath "todo.org")
;;   (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
;;   (global-set-key (kbd "C-c c") 'org-capture)
;;   (global-set-key (kbd "C-c n p") 'org-projectile-project-todo-completing-read))


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
