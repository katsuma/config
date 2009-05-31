(when (eq window-system 'mac)
  (add-hook 'window-setup-hook
   (lambda ()
      (setq mac-autohide-menubar-on-maximize t)
;;    (set-frame-parameter nil 'fullscreen 'fullboth)
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




;; anything.el
;; http://yamashita.dyndns.org/blog/anythingel/参考
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


;; rails.el
;; http://d.hatena.ne.jp/higepon/20061222/1166774270 参考
(defun try-complete-abbrev (old)
  (if (expand-abbrev) t nil))

(setq hippie-expand-try-functions-list
      '(try-complete-abbrev
        try-complete-file-name
        try-expand-dabbrev))
(setq rails-use-mongrel t)

(require 'rails)
;; 対応するファイルへの切り替え(C-c C-p)
(define-key rails-minor-mode-map "\C-c\C-p" 'rails-lib:run-primary-switch)
;; 行き先を選べるファイル切り替え(C-c C-n)
(define-key rails-minor-mode-map "\C-c\C-n" 'rails-lib:run-secondary-switch)

(setq auto-mode-alist  (cons '("\\.rhtml$" . html-mode) auto-mode-alist))





;; anything-rcodetools.el
;; http://blogs.dion.ne.jp/moe_moe/archives/7481321.html 参考
;; > gem install rcodetools -v='0.8.5'
;; > gem install fastri
;; > copy ~/.gem/ruby/1.8/gems/rcodetools-0.8.5.0/anything-rcodetools.el ./emacs.d/elisp
(require 'anything)
(require 'anything-rcodetools)
;; Command to get all RI entries.
(setq rct-get-all-methods-command "PAGER=cat fri -l")
;; See docs
(define-key anything-map "\C-e" 'anything-execute-persistent-action)
