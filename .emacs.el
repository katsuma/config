(when (eq window-system 'mac)
  (add-hook 'window-setup-hook
   (lambda ()
;;              (setq mac-autohide-menubar-on-maximize t)
    (set-frame-parameter nil 'fullscreen 'fullboth)
    )))

(defun mac-toggle-max-window ()
  (interactive)
  (if (frame-parameter nil 'fullscreen)
      (set-frame-parameter nil 'fullscreen nil)
    (set-frame-parameter nil 'fullscreen 'fullboth)))

;; Carbon Emacsの設定で入れられた. メニューを隠したり．
(custom-set-variables
 '(display-time-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode t))
(custom-set-faces)

;; Color
(if window-system (progn
   (set-background-color "Black")
   (set-foreground-color "LightGray")
   (set-cursor-color "Gray")
   (set-frame-parameter nil 'alpha 80)
   ))

;; Macのキーバインドを使う。optionをメタキーにする。
(mac-key-mode 1)
(setq mac-option-modifier 'meta)

;; タブキー
(setq default-tab-width 4)
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

;; elisp
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;; install-elisp
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp")

;; auto-compleyte-mode
(require 'auto-complete)
(global-auto-complete-mode t)



;; ElScreenの有効化
(require 'elscreen)
;; PrefixキーをC-zに割り当て
(if window-system
 (define-key elscreen-map "\C-z" 'iconify-or-deiconify-frame)
  (define-key elscreen-map "\C-z" 'suspend-emacs))


;; linumを有効化
(require 'linum)
;; デフォルトでONにする
(global-linum-mode 1)
;; F5キーにON/OFFの切り替えを割り当てる
(global-set-key [f5] 'linum-mode)
;; 5桁とスペースの領域を割り当てる
(setq linum-format "%5d ")



;; jaspaceを有効化
(require 'jaspace)
;; 全角空白を表示させる
(setq jaspace-alternate-jaspace-string "□")
;; 改行記号を表示させる
(setq jaspace-alternate-eol-string "↓\n")
;; タブを表示
(setq jaspace-highlight-tabs t)
;; フック
(add-hook 'text-mode-hook 'jaspace-mode)


;; ri-emacs
(setq ri-ruby-script "ri-emacs.rb")
(autoload 'ri "ri-ruby.el" nil t)
(add-hook 'ruby-mode-hook (lambda ()
(local-set-key "\M-r" 'ri)
(local-set-key "\M-c" 'ri-ruby-complete-symbol)
;(local-set-key "\M-g" 'ri-ruby-show-args)
))

;; rcodetools
;(require 'anything-rcodetools)
