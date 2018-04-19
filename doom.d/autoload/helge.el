;;; private/helge.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +helge/find-in-dotfiles ()
  "Open a file somewhere in ~/.dotfiles via a fuzzy filename search."
  (interactive)
  (doom-project-find-file (expand-file-name "~/dotfiles")))

;;;###autoload
(defun +helge/browse-dotfiles ()
  "Browse the files in ~/dotfiles."
  (interactive)
  (doom-project-browse (expand-file-name "~/dotfiles")))

;;;###autoload
(defun +helge/toggle-maximize-buffer ()
  "Maximize buffer"
  (interactive)
  (if (and (= 1 (length (window-list)))
           (assoc ?_ register-alist))
      (jump-to-register ?_)
    (progn
      (window-configuration-to-register ?_)
      (delete-other-windows))))

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
