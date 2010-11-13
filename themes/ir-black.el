;; IR Black Color Theme for Emacs.
;;
;; Credits due to the excellent TextMate IR_Black theme
;;
(theme-roller-make-theme
 "IR Black"
 ((background-color . "#222222")
  (background-mode . light)
  (border-color . "black")
  (cursor-color . "#FFFFFF")
  (foreground-color . "#EDEDED")
  (mouse-color . "#bcd5fa"))
 :base-font          (:stipple nil :foreground "#EDEDED" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal)
 :selection          (:background "#333333")
 :brief-highlight    (:background "#acc3e6")
 :durable-highlight  (:background "#000000")
 :link               (:foreground "blue1" :underline t)
 :mode-line          (:background "#bcd5fa" :foreground "black")
 :minibuffer-prompt  (:foreground "#FF73FD")
 :code-variable      (:foreground "#C6C5FE")
 :code-reference     (nil)
 :code-constant      (:foreground "#99CC99")
 :code-type          (:foreground "#FFD2A7")
 :code-keyword       (:bold t :weight bold :foreground "#96CBFE")
 :code-string        (:foreground "#A8FF60")
 :code-comment       (:italic t :foreground "#7C7C7C" :slant italic)
 :code-documentation (:foreground "#F67B37")
 :code-function      (:inherit theme-roller--base-font :bold t)
 :code-meta          (:foreground "#8996A8")
 :code-error         (:bold t :background "#562D56BF" :foreground "#FD5FF1")
 :code-warning       (:italic t :underline t :foreground "#FD5FF1")
 ;; TODO: style diff faces
 :diff-removed       (:background "#420E09" :foreground "#F8F8F8")
 :diff-changed       (:background "#4A410D" :foreground "#F8F8F8")
 :diff-info          (:background "#0E2231" :italic t :foreground "#F8F8F8")
 :diff-added         (:background "#253B22" :foreground "#F8F8F8")
 :diff-context       (:inherit theme-roller--base-font)
 :code-escape-char   (:foreground "#FF8000"))
