;;; private/helge.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +helge/alternate-buffer (&optional window)
  "Switch back and forth between current and last buffer in the
current window."
  (interactive)
  (let ((current-buffer (window-buffer window)))
    ;; if no window is found in the windows history, `switch-to-buffer' will
    ;; default to calling `other-buffer'.
    (switch-to-buffer
     (cl-find-if (lambda (buffer)
                   (not (eq buffer current-buffer)))
                 (mapcar #'car (window-prev-buffers window))))))

;;;###autoload
(defun +helge/alternate-window ()
  "Switch back and forth between current and last window in the
current frame."
  (interactive)
  (let (;; switch to first window previously shown in this frame
        (prev-window (get-mru-window nil t t)))
    ;; Check window was not found successfully
    (unless prev-window (user-error "Last window not found."))
    (select-window prev-window)))


;;;###autoload
(defun +helge/move-this-file (new-location &optional confirm)
  "Write current file to NEW-LOCATION, and delete the old one.
This makes the buffer visit that file, and marks it as not modified.

If you specify just a directory name as NEW-LOCATION, that means
to use the default file name but in that directory. You can also
yank the default file name into the minibuffer to edit it, using
\\<minibuffer-local-map>\\[next-history-element].

If the buffer is not already visiting a file, the default file name
for the output file is the buffer name.

If optional second arg CONFIRM is non-nil, this function asks for
confirmation before overwriting an existing file. Interactively,
confirmation is required unless you supply a prefix argument."
  (interactive (list (if buffer-file-name
                         (read-file-name "Move file to: ")
                       (read-file-name "Move file to: "
                                       default-directory
                                       (expand-file-name
                                        (file-name-nondirectory (buffer-name))
                                        default-directory)))
                     (not current-prefix-arg)))
  ;; normalise filenames to make sure equality check works
  (setq new-location (expand-file-name new-location))
  (let ((old-location (expand-file-name (buffer-file-name))))
    (unless (string= new-location old-location)
      (write-file new-location confirm)
      (when (and old-location (file-exists-p new-location))
        (delete-file old-location)))))


;;;###autoload
(defun helge/change-window-width (width)
  "Adjust margins so that window is centered.
Allows editing text using fixed linewidth (80 char) without forcing
linebreaks as in auto-fill-mode. "
  (interactive "NWindow width: ")
  (if (= 0 width)
      (set-window-margins nil 0 0)
    (let* ((cur-width (window-width))
           (cur-m (window-margins))
           (cur-l (if (and cur-m (car cur-m)) (car cur-m) 0))
           (cur-r (if (and cur-m (cdr cur-m)) (cdr cur-m) 0))
           (lr (- (+ cur-l cur-r cur-width) width))
           (left (/ lr 2))
           (right (if (= 0 (% lr 2)) left (1+ left))))
      (set-window-margins nil (max left 0) (max right 0)))))


;; kill-all-buffers function, also closes other windows and frames
;; there is also the inbuilt kill-some-buffers
;;;###autoload
(defun kill-all-buffers ()
  "Kill all buffers and close other windows and frames."
  (interactive)
  (mapc 'kill-buffer (buffer-list))
  (delete-other-windows)
  (delete-other-frames))

;; kill all buffers except current one
;;;###autoload
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
  (delete-other-windows)
  (delete-other-frames))

;; copby buffer filename to clipboard
;;;###autoload
(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))


;; ;;;###autoload
;; (defun stata-rundolines (beg end)
;;   "Wrapper of ~/dotfiles/rundo.sh."
;;   (interactive
;;    ;; 1. If the region is highlighted
;;    (if (use-region-p)
;;        ;; the region
;;        (progn
;;          (list (region-beginning) (region-end))
;;          (goto-char (region-end))
;;          (deactivate-mark))
;;      ;; the line
;;      (progn
;;       (list (line-beginning-position) (line-end-position))
;;       (next-logical-line))))
;;   ;; 2. create a temp file
;;   (let ((tempfile (make-temp-file nil nil ".do")))
;;     ;; 3. save text to the file
;;     (write-region beg end tempfile)
;;     (write-region "\n" nil tempfile t)
;;     ;; 4. run the command asynchronously
;;     ;; (remove '&' to run it synchronously, i.e., blocking Emacs)
;;     ;; (shell-command (format "~/dotfiles/rundo.sh %s &" tempfile))))
;;     (start-process-shell-command "rundo" nil (format "~/dotfiles/rundo.sh %s" tempfile))))


;; ;;;###autoload
;; (defun stata-rundo ()
;;   "Runs current buffer in Stata. Wrapper of ~/dotfiles/rundo.sh."
;;   (interactive)
;;   (save-buffer)
;;   (start-process-shell-command "rundo" nil (format "~/dotfiles/rundo.sh %s" buffer-file-name)))



;; ;; original
;; ;;;###autoload
;; ;; (defun rundo (beg end)
;; ;;   "Wrapper of ~/dotfiles/rundo.sh."
;; ;;   (interactive
;; ;;    ;; 1. If the region is highlighted
;; ;;    (if (use-region-p)
;; ;;        ;; the region
;; ;;        (list (region-beginning) (region-end))
;; ;;      ;; the line
;; ;;      (list (line-beginning-position) (line-end-position))))
;; ;;   ;; 2. create a temp file
;; ;;   (let ((tempfile (make-temp-file nil nil ".do")))
;; ;;     ;; 3. save text to the file
;; ;;     (write-region beg end tempfile)
;; ;;     (write-region "\n" nil tempfile t)
;; ;;     ;; 4. run the command asynchronously
;; ;;     ;; (remove '&' to run it synchronously, i.e., blocking Emacs)
;; ;;     ;; (shell-command (format "~/dotfiles/rundo.sh %s &" tempfile))))
;; ;;     (start-process-shell-command "rundo" nil (format "~/dotfiles/rundo.sh %s" tempfile))))
