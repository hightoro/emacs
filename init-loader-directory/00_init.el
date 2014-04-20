;; init.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; enveroment ( encode ) ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; enveroment ( font ) ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Windowsで英数と日本語にMeiryoを指定
;; Linuxで英数と日本語にRictyを指定
;(let ((ws window-system))
;  (cond ((eq ws 'w32)
;	 (set-face-attribute 'default nil
;			     :family "Meiryo" ;; 英数
;			     :height 100)
;	 (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Meiryo"))) ;; 日本語
;	((eq ws 'ns)
;	 (set-face-attribute 'default nil
;			     :family "Ricty" ;; 英数
;			     :height 140)
;	 (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty"))))) ;; 日本語


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; enveroment ( locale ) ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Localeに合わせた環境の設定(Language)
(set-locale-environment nil)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; menu-bar & title & mode line ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; タイトルバーにファイル名を表示
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

;;; ツールバー非表示
;(tool-bar-mode -1)

;;; メニューバーを非表示
;(menu-bar-mode -1)

;;; スクロールバー非表示
(set-scroll-bar-mode nil)

;;; メニューバー日本語化(http://www11.atwiki.jp/s-irie/pages/13.html)
;(load "~/.emacs.d/elisp/menu-tree.el")
;(if (and (= emacs-major-version 22)
;	 (eq window-system 'x))
;    (setq menu-tree-coding-system 'utf-8))
;(require 'menu-tree nil t)



;;;;;;;;;;;;;;;;;;;
;;; Window View ;;;
;;;;;;;;;;;;;;;;;;;
;;; 文字の色を設定
(add-to-list 'default-frame-alist '(foreground-color . "white"))

;;; 背景色を設定
(add-to-list 'default-frame-alist '(background-color . "black"))

;;; ソースファイルに色をつける
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;;; 半透明化
(set-frame-parameter nil 'alpha '80)

;;; 対応する括弧を光らせる
(show-paren-mode t)

;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
;;(set-face-background 'trailing-whitespace "#b14770")




;;;;;;;;;;;;;;;;;;;
;;; color theme ;;;
;;;;;;;;;;;;;;;;;;;
;;; カラーテーマは非推奨 (Emacs24から)
;;; テーマフレームワークを使う　

;;; カラーテーマを使用する
;(add-to-list 'load-path "~/.emacs.d/elisp/color-theme-6.6.0/") ;ディレクトリの指定
;(load "~/.emacs.d/elisp/color-theme-6.6.0/color-theme.el")
;(require 'color-theme)
;(add-to-list 'load-path "~/.emacs.d/theme") ;ディレクトリの指定
;(require 'color-theme)
;(eval-after-load "color-theme"
;  '(progn
;     (color-theme-initialize)
;     (color-theme-molokai)
;))
;(color-theme-initialize)

;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(setq molokai-theme-kit t)
;(load-theme 'molokai t)

;;; テーマフレームワークを使用する
;(setq custom-theme-directory "~/.emacs.d/themes/") ;ディレクトリの指定

;;; [ (load-theme '設定したいテーマの名前 t) ]
;(load-theme 'foobar t)
;(load-theme 'tsdh-dark t)





;;;;;;;;;;;;;;
;;; Cursor ;;;
;;;;;;;;;;;;;;
;; カーソルに関して
(set-cursor-color "white")        ;;カーソルの色
(setq blink-cursor-interval 0.5)  ;;カーソルの点滅間隔
(setq blink-cursor-delay 1.0)     ;;カーソルの点滅開始される放置時間
(blink-cursor-mode 1)             ;;カーソルの点滅on

;; カーソルのある行に関して
(global-hl-line-mode t)           ;;カーソル行のハイライトon
(set-face-background 'hl-line "navy") ;;カーソル行の色



;;;;;;;;;;;;;;;;;
;;; mode line ;;;
;;;;;;;;;;;;;;;;;
;;; モードラインに行番号表示
(line-number-mode t)

;;; モードラインに列番号表示
(column-number-mode t)

;;; emacs-powerlineを使用する
;(require 'powerline)



;;;;;;;;;;;;;;;
;;; Tab Key ;;;
;;;;;;;;;;;;;;;
;; タブをスペースで扱う
(setq-default indent-tabs-mode nil)    ;; tab -> space

;; タブ幅
(custom-set-variables '(tab-width 4))



;;;;;;;;;;;;;;;;;;;;
;;; Resent Files ;;;
;;;;;;;;;;;;;;;;;;;;
;; 最近使ったファイルをメニューに表示
(recentf-mode t)
(setq recentf-max-menu-items 10)    ;; 最近使ったファイルの表示数
(setq recentf-max-saved-items 3000) ;; 最近開いたファイルの保存数を増やす


;;;;;;;;;;;;;;;;;;;;
;;; Mini Buffer ;;;
;;;;;;;;;;;;;;;;;;;;
;; ミニバッファの履歴を保存する
(savehist-mode 1)

;; ミニバッファの履歴の保存数を増やす
(setq history-length 3000)



;;;;;;;;;;;;;;;
;;; back up ;;;
;;;;;;;;;;;;;;;
;;; オートセーブファイルの保存先指定
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backup") t)))

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;; バックアップファイルを作らない
;(setq backup-inhibited t)

;;; バックアップファイルの保存先指定
(setq backup-directory-alist
  (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
    backup-directory-alist))

;;; バックアップファイルの保存数設定
(setq version-control t)
(setq kept-new-versions 5)
;(setq kept-old-versions 5)
(setq delete-old-versions t)



;;;;;;;;;;;;;;;;;
;;; clipboard ;;;
;;;;;;;;;;;;;;;;;
;;; クリップボードの共有
(setq x-select-enable-clipborad t)




;;;;;;;;;;;;;;;
;;; control ;;;
;;;;;;;;;;;;;;;
;;; ホイールマウス
(mouse-wheel-mode t)
(setq mouse-wheel-follow-mouse t)


;;;;;;;;;;;;;
;;; other ;;;
;;;;;;;;;;;;;
;;; ファイルの先頭に#!...があるファイルを保存すると実行権をつける
(add-hook 'after-save-hook
	  'executable-make-buffer-file-executable-if-script-p)

;;; [yes or no]を[y or n]
(fset 'yes-or-no-p 'y-or-n-p)

;;; 自動スペルチェック
(setq-default flyspell-mode t) (setq ispell-dictionary "american")

;;; タブ化
;; http://www.emacswiki.org/emacs/tabbar.el
;;(require 'cl)
(require 'tabbar nil t)
;(setq tabbar-buffer-groups-function  ;; scratch buffer以外をまとめてタブに表示する
;      (lambda (b) (list "All Buffers")))
;(setq tabbar-buffer-list-function
;      (lambda ()
;	(remove-if
;	 (lambda(buffer)
;	   (unless (string-match (buffer-name buffer)
;				 "\\(*scratch*\\|*Apropos*\\|*shell*\\|*eshell*\\|*Customize*\\)")
;	     (find (aref (buffer-name buffer) 0) " *"))
;	   )
;	 (buffer-list))))
;(tabbar-mode 1)  ;; tabbarを有効にする

;;; ボタンをシンプルにする
;(setq tabbar-home-button-enabled "")
;(setq tabbar-scroll-right-button-enabled "")
;(setq tabbar-scroll-left-button-enabled "")
;(setq tabbar-scroll-right-button-disabled "")
;(setq tabbar-scroll-left-button-disabled "")

;; Ctrl-Tab, Ctrl-Shift-Tab でタブを切り替える
;(dolist (func '(tabbar-mode tabbar-forward-tab tabbar-forward-group tabbar-backward-tab tabbar-backward-group))
;  (autoload func "tabbar" "Tabs at the top of buffers and easy control-tab navigation"))
;(defmacro defun-prefix-alt (name on-no-prefix on-prefix &optional do-always)
;  `(defun ,name (arg)
;     (interactive "P")
;     ,do-always
;     (if (equal nil arg)
;	 ,on-no-prefix
;      ,on-prefix)))
;(defun-prefix-alt shk-tabbar-next (tabbar-forward-tab) (tabbar-forward-group) (tabbar-mode 1))
;(defun-prefix-alt shk-tabbar-prev (tabbar-backward-tab) (tabbar-backward-group) (tabbar-mode 1))
;(global-set-key [(control tab)] 'shk-tabbar-next)
;(global-set-key [(control shift tab)] 'shk-tabbar-prev)

;; GUIで直接ファイルを開いた場合フレームを作成しない
;(add-hook 'before-make-frame-hook
;	  (lambda ()
;	    (when (eq tabbar-mode t)
;	      (switch-to-buffer (buffer-name))
;	      (delete-this-frame))))



;;;;;;;;;;;;;;;;;;;;
;;; mode setting ;;;
;;;;;;;;;;;;;;;;;;;;
;; text-modeでバッファーを開いたときに行う設定

;; c-modeやc++-modeなどcc-modeベースのモード共通の設定

;; emacs-lisp-modeでバッファーを開いたときに行う設定

