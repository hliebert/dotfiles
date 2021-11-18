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
(defun +helge/er-sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;;;###autoload
(defun +helge/my-search-or-browse ()
  "If selected region, or thing at point, is a url, go there. Otherwise,
use region/thing as a keyword for a google search."
  (interactive)
  (let ((target
         (if (use-region-p)
             (buffer-substring (region-beginning) (region-end))
           (thing-at-point 'symbol))))
    (if (ffap-url-p target)
        (browse-url target)
      (browse-url (concat "http://www.google.com/search?q="
                          (url-hexify-string target))))))

;;;###autoload
(defun +helge/browse-file-directory ()
  "Open the current file's directory however the OS would."
  (interactive)
  (if default-directory
      ;; (browse-url-of-file (expand-file-name default-directory))
      (browse-url-xdg-open (expand-file-name default-directory))
    (error "No `default-directory' to open")))

;;;###autoload
(defun +helge/sort-lines-nocase ()
  "Sort lines, case insensitive."
  (interactive)
  (let ((sort-fold-case t))
    (call-interactively 'sort-lines)))

;;;###autoload
(eval
 `(defun +helge/ediff-buffers-wordwise (buffer-A buffer-B &optional startup-hooks job-name)
    ,(concat (documentation 'ediff-buffers) "\nComparison is done word-wise.")
    ,(interactive-form 'ediff-buffers)
    (setq bufA (get-buffer buffer-A)
          bufB (get-buffer buffer-B)
          job-name (or job-name 'ediff-buffers-wordwise))
    (cl-assert bufA nil
               "Not a live buffer: %s" buffer-A)
    (cl-assert bufB nil
               "Not a live buffer: %s" buffer-B)
    (ediff-regions-internal bufA
                            (with-current-buffer bufA
                              (point-min))
                            (with-current-buffer bufA
                              (point-max))
                            bufB
                            (with-current-buffer bufB
                              (point-min))
                            (with-current-buffer bufB
                              (point-max))
                            startup-hooks
                            job-name
                            'word-mode
                            nil)))

;;;###autoload
(eval
 `(defun +helge/ediff-files-wordwise (file-A file-B &optional startup-hooks)
    ,(concat (documentation 'ediff-files)
             "\nComparison is done wordwise.")
    ,(interactive-form 'ediff-files)
    (cl-letf* ((oldfun (symbol-function 'ediff-setup))
               ((symbol-function 'ediff-setup)
                (lambda (buffer-A file-A buffer-B file-B buffer-C file-C startup-hooks setup-parameters &optional merge-buffer-file)
                  (let* ((tmp-buffer (get-buffer-create ediff-tmp-buffer)))
                    (with-current-buffer buffer-A
                      (ediff-wordify (point-min) (point-max) buffer-A tmp-buffer))
                    (setq file-A (ediff-make-temp-file tmp-buffer "regA"))
                    (with-current-buffer buffer-B
                      (ediff-wordify (point-min) (point-max) buffer-B tmp-buffer))
                    (setq file-B (ediff-make-temp-file tmp-buffer "regB"))
                    (setq overl-A (with-current-buffer buffer-A
                                    (ediff-make-bullet-proof-overlay (point-min) (point-max) buffer-A))
                          overl-B (with-current-buffer buffer-B
                                    (ediff-make-bullet-proof-overlay (point-min) (point-max) buffer-B)))
                    (funcall oldfun
                             buffer-A file-A buffer-B file-B buffer-C file-C startup-hooks
                             (append
                              (list (cons 'ediff-word-mode 'word-mode)
                                    (cons 'ediff-narrow-bounds (list overl-A overl-B)))
                              setup-parameters)
                             merge-buffer-file)))))
     (ediff-files file-A file-B startup-hooks))))

