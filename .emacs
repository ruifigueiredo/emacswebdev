(add-to-list 'load-path "~/.emacs.d/eproject")
(require 'eproject)
(require 'eproject-extras)
(require 'darkroom-mode)

(autoload 'geben "geben" "DBGp protocol front-end" t)
(add-to-list 'load-path "~/.emacs.d")
; drupal mode
(require 'drupal-mode)
(drupal-mode)

; symfony mode
(require 'sf)

; My PHP setup
(require 'setup-php)
(setup-php)

; geben
;(require 'geben)
;(geben)
; (Autoload 'geben "geben" "DBGp protocol front-end" t)


;(defun my-geben-breakpoints (session)
;  (geben-set-breakpoint-call "debugger"))
;(add-hook 'geben-dbgp-init-hook #'my-geben-breakpoints t) ; set breakpoints when geben starts
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;; eproject global bindings
(defmacro .emacs-curry (function &rest args)
  `(lambda () (interactive)
     (,function ,@args)))

(defmacro .emacs-eproject-key (key command)
  (cons 'progn
        (loop for (k . p) in (list (cons key 4) (cons (upcase key) 1))
              collect
              `(global-set-key
                (kbd ,(format "C-x p %s" k))
                (.emacs-curry ,command ,p)))))

(.emacs-eproject-key "k" eproject-kill-project-buffers)
(.emacs-eproject-key "v" eproject-revisit-project)
(.emacs-eproject-key "b" eproject-ibuffer)
(.emacs-eproject-key "o" eproject-open-all-project-files)
