(setq +doom-modeline-buffer-file-name-style 'relative-from-project
      show-trailing-whitespace t)
(add-hook! minibuffer-setup (setq-local show-trailing-whitespace nil))


;;
;; Keybindings
;;

(map!
 (:leader
   :desc "Comment"                     :n ";"   #'evil-commentary
   ;; caution, remapping tab removes all workspace keybindings
   :desc "Other buffer"                :n "TAB" #'+helge/alternate-buffer
   ;; :desc "Previous buffer"             :n "TAB" #'previous-buffer
   ;; :desc "Next buffer"                 :n "ESC" #'next-buffer
   (:prefix "f"
     :desc "Find file"                 :n "f"   #'counsel-find-file
     :desc "Find file rg"              :n "g"   #'counsel-rg
     :desc "Find file ag"              :n "a"   #'counsel-ag
     :desc "Find file in dotfiles"     :n "t"   #'+neotree/open)
     ;; :desc "Find file in dotfiles"     :n "t"   #'+helge/find-in-dotfiles
     ;; :desc "Browse dotfiles"           :n "T"   #'+helge/browse-dotfiles)
   (:prefix "b"
     :desc "Kill buffer"               :n "d"   #'kill-this-buffer
     :desc "Kill other buffers"        :n "m"   #'kill-other-buffers
     :desc "Kill buffer and window"    :n "q"   #'kill-buffer-and-window)
   (:prefix "w"
     :desc "Delete window"             :n "d"   #'delete-window
     :desc "Kill buffer and window"    :n "q"   #'kill-buffer-and-window
     :desc "Maximize buffer"           :n "m"   #'+helge/toggle-maximize-buffer
     :desc "Other window"              :n "w"   #'other-window
     :desc "Alternate window"          :n "TAB" #'+helge/alternate-window
     :desc "Split window vertically"   :n "/"   #'split-window-right
     :desc "Split window horizontally" :n "-"   #'split-window-below)
   (:prefix "p"
     :desc "Projectile find file"      :n "f"   #'counsel-projectile-find-file)
   (:prefix "/"
     :desc "Find file"                 :n "d"   #'counsel-find-file
     :desc "Find file rg"              :n "g"   #'counsel-rg
     :desc "Find file ag"              :n "a"   #'counsel-ag)))


;;
;; Modules
;;

;; feature/evil
(after! evil-mc
  ;; Make evil-mc resume its cursors when I switch to insert mode
  (add-hook! 'evil-mc-before-cursors-created
    (add-hook 'evil-insert-state-entry-hook #'evil-mc-resume-cursors nil t))
  (add-hook! 'evil-mc-after-cursors-deleted
    (remove-hook 'evil-insert-state-entry-hook #'evil-mc-resume-cursors t)))

;; completion/helm
(after! helm
  ;; Hide header lines in helm. I don't like them
  (set-face-attribute 'helm-source-header nil :height 0.1))

;; lang/org
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
                                  egregdoesnotlikesansseriftitles,
                                  parskip=full
                                  ]{scrartcl}
                    \\usepackage{lmodern}
                    \\usepackage{mathptmx}
                    \\usepackage[T1]{fontenc}
                    \\usepackage[nswissgerman,english]{babel}"
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
  (setq TeX-view-program-selection '((output-pdf "Evince")))
  (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t)))

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

;; set completion threshold
(setq company-minimum-prefix-length 3)

