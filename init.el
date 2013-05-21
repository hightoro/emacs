;; init.el

;;;;;;;;;;;;;;;;;;
;;; enveroment ;;;
;;;;;;;;;;;;;;;;;;
;;;load-path 追加用の関数の定義(http://sakito.jp/emacs/emacs23.html)
;(defun add-to-load-path (&rest paths) 
;  (let (path) 
;    (dolist (path paths paths) 
;      (let ((default-directory 
;	      (expand-file-name (concat user-emacs-directory path)))) 
;	(add-to-list 'load-path default-directory) 
;	(if (fboundp 'normal-top-level-add-subdirs-to-loadpath) 
;	    (normal-top-level-add-subdirs-to-load-path))))))
;;; load-pathに追加するフォルダ(上記関数を使用)
;(add-to-load-path
;"~/.emacs.d"
;
;)

;;; load-pathに追加するフォルダ(通常手法)
(setq load-path (append '("~/.emacs.d") load-path))

;;; Localeに合わせた環境の設定(Language)
(set-locale-environment nil)

;;;;;;;;;;;;;;;;;;;
;;; window view ;;;
;;;;;;;;;;;;;;;;;;;
;;; 文字の色を設定
(add-to-list 'default-frame-alist '(foreground-color . "white"))

;;; 背景色を設定
(add-to-list 'default-frame-alist '(background-color . "black"))

;;; ソースファイルに色をつける
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;;; 行番号追加(linum使用)
(load "~/.emacs.d/script/linum.el")
(require 'linum)
(global-linum-mode t)
(setq linum-format "%5d")

;;; 半透明化
(set-frame-parameter nil 'alpha '80)

;;; 対応する括弧を光らせる
(show-paren-mode 1)

;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)

;;; 自動スペルチェック
(setq-default flyspell-mode t) (setq ispell-dictionary "american")

;;; タイトルバーにファイル名を表示
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

;;;;;;;;;;;;;;;;;;;
;;; color theme ;;;
;;;;;;;;;;;;;;;;;;;
;(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0") 
;(require 'color-theme)
;(eval-after-load "color-theme" 
;  '(progn
;     (color-theme-initialize)
;
;     (color-theme-molokai)
;
;))

;;;;;;;;;;;;;;;
;;; back up ;;;
;;;;;;;;;;;;;;;
;;; バックアップファイルを作らない 
;(setq backup-inhibited t)

;;; 終了時にオートセーブファイルを消す 
(setq delete-auto-save-files t)

;;;;;;;;;;;;;;;
;;; control ;;;
;;;;;;;;;;;;;;;
;;; ホイールマウス
(mouse-wheel-mode t)
(setq mouse-wheel-follow-mouse t)

;;; キーバインド
;(define-key global-map "\C-h" 'delete-backward-char) ; 削除
(global-set-key "\C-z" 'undo) ; C-z で undo

;;;;;;;;;;;;;
;;; other ;;;
;;;;;;;;;;;;;
;;;ファイルの先頭に#!...があるファイルを保存すると実行権をつける
(add-hook 'after-save-hook 
	  'executable-make-buffer-file-executable-if-script-p)

;;;;;;;;;;;;;;;;;;;;
;;; mode setting ;;;
;;;;;;;;;;;;;;;;;;;;
;; text-modeでバッファーを開いたときに行う設定

;; c-modeやc++-modeなどcc-modeベースのモード共通の設定

;; emacs-lisp-modeでバッファーを開いたときに行う設定



