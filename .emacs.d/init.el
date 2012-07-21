; 言語を日本語にする
(set-language-environment 'Japanese)
; 極力UTF-8とする
(prefer-coding-system 'utf-8)
; Drag & Drop
(define-key global-map [ns-drag-file] 'ns-find-file)

;; Carbon Emacsの設定で入れられた. メニューを隠したり．
(custom-set-variables
 '(display-time-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode t))
(custom-set-faces)

(setq mac-option-modifier 'meta)

;; タブキー
(setq-default tab-width 2 indent-tabs-mode nil)
(setq indent-line-function 'indent-relative-maybe)

;; シフト + 矢印で範囲選択
(setq pc-select-selection-keys-only t)
(pc-selection-mode 1)

;; 行数を表示
 (setq line-number-mode t)

;; ビープ音を消す
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;; 対応する括弧を光らせる。
(show-paren-mode 1)

;; 編集行のハイライト
(global-hl-line-mode)

;; C-hをBSに割当
(global-set-key "\C-h" 'delete-backward-char)

;; 自動保存しない
(setq make-backup-files nil)

;; C-oの逆動作
(global-set-key "\C-xp" (lambda () (interactive) (other-window -1)))


;; indent
(global-set-key "\C-xi" 'indent-region)

;; comment / uncomment
(global-set-key "\C-c#" 'comment-region)
(global-set-key "\C-c!" 'uncomment-region)

;; backward kill
(global-set-key "\C-w" 'backward-kill-word)

;; IME
;; (setq default-input-method "MacOSX")
;; (mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `title "漢")
;; (if (and (boundp 'input-method-activate-hook)
;; 		 (boundp 'input-method-inactivate-hook))
;; 	(progn
;; 	  (add-hook 'input-method-activate-hook
;; 				(function (lambda () (set-cursor-color "RosyBrown1"))))
;; 	  (add-hook 'input-method-inactivate-hook
;; 				(function (lambda () (set-cursor-color "ForestGreen"))))
;; 	  ))

;; カーソル点滅
(blink-cursor-mode t)

;; 行末のホワイトスペースを表示
(when (boundp 'show-trailing-whitespace) (setq-default
                      show-trailing-whitespace t))
(set-face-background 'trailing-whitespace "plum")

;; 行末のホワイトスペースを保存時に削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; for ruby
(add-hook 'ruby-mode-hook 'jaspace-mode)

;; font
(create-fontset-from-ascii-font "Monaco-12:weight=normal:slant=normal" nil "monaco")
(set-fontset-font "fontset-monaco"
                  'unicode
                  (font-spec :family "Hiragino Maru Gothic ProN" :size 12)
                  nil
                  'append)
(add-to-list 'default-frame-alist '(font . "fontset-monaco"))





;;; load-pathの追加関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "elisp")

;; elispのインストール自動化
;; http://www.emacswiki.org/emacs/download/auto-install.el
;; (require 'auto-install)
;;   (setq auto-install-directory "~/.emacs.d/elisp/")
;;   (auto-install-update-emacswiki-package-name t)
;;   (auto-install-compatibility-setup)




(require 'package)
;;リポジトリにMarmaladeを追加
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;;インストールするディレクトリを指定
(setq package-user-dir (concat user-emacs-directory "vendor/elpa"))
;;インストールしたパッケージにロードパスを通してロードする
(package-initialize)


;;;
;;; elisp
;;;

;;
;; linum
(require 'linum)
;; デフォルトでONにする
(global-linum-mode 1)
;; F5キーにON/OFFの切り替えを割り当てる
(global-set-key [f5] 'linum-mode)
;; 5桁とスペースの領域を割り当てる
(setq linum-format "%5d ")

;;
;; zlc
;;
(require 'zlc)
;(setq zlc-select-completion-immediately t)
(let ((map minibuffer-local-map))
  ;;; like menu select
  (define-key map (kbd "<down>")  'zlc-select-next-vertical)
  (define-key map (kbd "<up>")    'zlc-select-previous-vertical)
  (define-key map (kbd "<right>") 'zlc-select-next)
  (define-key map (kbd "<left>")  'zlc-select-previous)

  ;;; reset selection
  (define-key map (kbd "C-c g") 'zlc-reset))


;;
;; redo+.el
;; kbd -> C-.
;; http://www.emacswiki.org/emacs/download/redo+.el
(when (require 'redo+ nil t)
  (define-key global-map (kbd "C-.") 'redo))

;;
;; Auto Complete Mode
;; 自動補完機能
;; http://cx4a.org/software/auto-complete/index.ja.html
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
(ac-config-default)

;; jaspaceを有効化
(require 'jaspace)
;; 全角空白を表示させる
(setq jaspace-alternate-jaspace-string "□")
;; 改行記号を表示させる
(setq jaspace-alternate-eol-string "↓\n")


;; Auto Complete Mode
;; 自動補完機能
;; http://cx4a.org/software/auto-complete/index.ja.html
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
(ac-config-default)

;; jaspaceを有効化
(require 'jaspace)
;; 全角空白を表示させる
(setq jaspace-alternate-jaspace-string "□")
;; 改行記号を表示させる
(setq jaspace-alternate-eol-string "↓\n")

;; タブを表示
;; Draw tabs with the same color as trailing whitespace
(add-hook 'font-lock-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("\t" 0 'trailing-whitespace prepend)))))

;; フック
(add-hook 'text-mode-hook 'jaspace-mode)
(add-hook 'ruby-mode-hook 'jaspace-mode)
(add-hook 'html-mode-hook 'jaspace-mode)

;;
;; Anything
;;
(require 'anything-config)
(setq anything-sources (list anything-c-source-buffers
                             anything-c-source-bookmarks
                             anything-c-source-recentf
                             anything-c-source-file-name-history
                             anything-c-source-locate))
(define-key anything-map (kbd "C-p") 'anything-previous-line)
(define-key anything-map (kbd "C-n") 'anything-next-line)
(define-key anything-map (kbd "C-v") 'anything-next-source)
(define-key anything-map (kbd "M-v") 'anything-previous-source)
(global-set-key (kbd "C-;") 'anything)

;;
;; javascript
;;
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)
(setq javascript-indent-level 2)

;;
;; ruby
;;
; ruby-mode.el
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda () (inf-ruby-keys)))
 (add-to-list 'auto-mode-alist '("Capfile'" . ruby-mode))

;; ruby-electric.el
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; rubydbnx.el
(autoload 'rubydb "rubydb2x"
  "run rubydb on program file in buffer *gud-file*.
the directory containing file becomes the initial working directory
and source-file directory for your debugger." t)

;; ruby-block.el
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;; rinari
(add-to-list 'load-path "~/.emacs.d/elisp/rinari")
(require 'rinari)


;; markdown-mode
;; http://jblevins.org/projects/markdown-mode/
(autoload 'markdown-mode "markdowxn-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.markdown$" . markdown-mode) auto-mode-alist))


;; scss
(add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))