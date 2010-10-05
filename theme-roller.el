;;; theme-roller.el --- A collection of activly maintained emacs themes

;; Copyright (C) 2010 Yves Senn

;; Author: Yves Senn <yves.senn@gmail.com>
;; URL: http://www.emacswiki.org/emacs/ThemeRoller
;; Version: 0.1
;; Created: 27 September 2010
;; Keywords: emacs color-theme theme
;; EmacsWiki: ThemeRoller

;; This file is NOT part of GNU Emacs.

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; (color-theme-twilight)
;; (color-theme-github)

;;; Code:

(defvar *theme-roller-themes-dir*
  (concat (file-name-directory (or load-file-name buffer-file-name)) "themes"))

(eval-when-compile (require 'color-theme))
(global-font-lock-mode t)
(when (fboundp 'color-theme-initialize)
  (color-theme-initialize))
(setq color-theme-is-global t)

(defmacro* theme-roller-make-theme (name variables
                                  &key
                                  (base-font)
                                  (selection)
                                  (brief-highlight)
                                  (durable-highlight)
                                  (link)
                                  (mode-line)
                                  (minibuffer-prompt)
                                  (code-variable)
                                  (code-reference)
                                  (code-constant)
                                  (code-type)
                                  (code-keyword)
                                  (code-string)
                                  (code-escape-char)
                                  (code-comment)
                                  (code-documentation)
                                  (code-function)
                                  (code-meta)
                                  (code-error)
                                  (code-warning)
                                  (diff-added)
                                  (diff-removed)
                                  (diff-changed)
                                  (diff-context)
                                  (diff-info))
  (let ((color-theme-function-symbol (intern (concat "color-theme-" (downcase name)))))
    `(progn
       (defun ,color-theme-function-symbol ()
       "Color theme by Yves Senn"
       (interactive)
       (color-theme-install
        '(,color-theme-function-symbol
          ,variables
          (theme-roller--base-font ((t ,base-font)))
          (theme-roller--selection ((t ,selection)))
          (theme-roller--brief-highlight ((t ,brief-highlight)))
          (theme-roller--durable-highlight ((t ,durable-highlight)))
          (theme-roller--link ((t ,link)))
          (theme-roller--mode-line ((t ,mode-line)))
          (theme-roller--minibuffer-prompt ((t ,minibuffer-prompt)))
          (theme-roller--code-variable ((t ,code-variable)))
          (theme-roller--code-reference ((t ,code-reference)))
          (theme-roller--code-constant ((t ,code-constant)))
          (theme-roller--code-type ((t ,code-type)))
          (theme-roller--code-keyword ((t ,code-keyword)))
          (theme-roller--code-string ((t ,code-string)))
          (theme-roller--code-escape-char ((t ,code-escape-char)))
          (theme-roller--code-comment ((t ,code-comment)))
          (theme-roller--code-documentation ((t ,code-documentation)))
          (theme-roller--code-function ((t ,code-function)))
          (theme-roller--code-meta ((t ,code-meta)))
          (theme-roller--code-error ((t ,code-error)))
          (theme-roller--code-warning ((t ,code-warning)))
          (theme-roller--diff-added ((t ,diff-added)))
          (theme-roller--diff-removed ((t ,diff-removed)))
          (theme-roller--diff-changed ((t ,diff-changed)))
          (theme-roller--diff-info ((t ,diff-info)))
          (theme-roller--diff-context ((t ,diff-context)))

          (border-glyph ((t (nil)))) ;; flat borders

          (paren-face ((t ,base-font)))
          (esk-paren-face ((t ,base-font)))

          (font-lock-builtin-face ((t (:inherit theme-roller--base-font))))
          (font-lock-comment-face ((t (:inherit theme-roller--code-comment))))
          (font-lock-comment-delimiter-face ((t (:inherit theme-roller--code-comment))))
          (font-lock-constant-face ((t (:inherit theme-roller--code-constant))))
          (font-lock-doc-face ((t (:inherit theme-roller--code-documentation))))
          (font-lock-doc-string-face ((t (:inherit theme-roller--code-documentation))))
          (font-lock-function-name-face ((t (:inherit theme-roller--code-function))))
          (font-lock-keyword-face ((t (:inherit theme-roller--code-keyword))))
          (font-lock-preprocessor-face ((t (:inherit theme-roller--code-meta))))
          (font-lock-reference-face ((t (:inherit theme-roller--code-reference))))

          ;; TODO: assign face
          (font-lock-negation-char-face ((t (nil))))

          (font-lock-regexp-grouping-backslash ((t (:inherit theme-roller--code-comment))))
          (font-lock-regexp-grouping-construct ((t (:foreground "red"))))

          (font-lock-string-face ((t (:inherit theme-roller--code-string))))
          (font-lock-type-face ((t (:inherit theme-roller--code-type))))
          (font-lock-variable-name-face ((t (:inherit theme-roller--code-variable))))
          (font-lock-warning-face ((t (:inherit theme-roller--code-warning))))
          (whitespace-line ((t (:inherit theme-roller--code-warning))))
          (whitespace-tab ((t (:inherit theme-roller--code-warning))))

          (jde-java-font-lock-doc-tag-face ((t (:inherit theme-roller--code-documentation :bold t))))
          (jde-java-font-lock-constant-face ((t (:inherit theme-roller--code-constant))))
          (jde-java-font-lock-link-face ((t (:inherit theme-roller--link))))
          (jde-java-font-lock-modifier-face ((t (:inherit theme-roller--code-keyword))))
          (jde-java-font-lock-package-face ((t (:inherit theme-roller--code-keyword))))
          (jde-java-font-lock-number-face ((t (:inherit theme-roller--code-string))))
          (jde-java-font-lock-code-face ((t (:inherit theme-roller--base-font))))

          ;; TODO: style Breakpoints
          ;; (jde-db-active-breakpoint-face ((t (:inherit (:inherit theme-roller--code-error)))))
          ;; (jde-db-requested-breakpoint-face ((t (:inherit theme-roller--code-warning))))
          ;; (jde-db-spec-breakpoint-face ((t (:inherit theme-roller--diff-added))))

          (ecb-default-highlight-face ((t (:inherit theme-roller--brief-highlight))))

          (log4j-font-lock-info-face ((t (:inherit theme-roller--code-variable))))
          (log4j-font-lock-error-face ((t (:inherit theme-roller--code-constant))))
          (log4j-font-lock-warn-face ((t (:inherit theme-roller--code-keyword))))

          (diff-header ((t (:inherit theme-roller--diff-info))))
          (diff-file-header ((t (:inherit theme-roller--diff-info :bold t))))
          (diff-added ((t (:inherit theme-roller--diff-added))))
          (diff-removed ((t (:inherit theme-roller--diff-removed))))
          (diff-changed ((t (:inherit theme-roller--diff-warning))))
          (diff-context ((t (:inherit theme-roller--diff-context))))
          (diff-index ((t (:inherit theme-roller--code-comment))))
          (diff-refine-change ((t (:inherit theme-roller--code-comment))))

          (magit-item-highlight ((t (:background nil :bold t))))
          (magit-diff-add ((t (:inherit theme-roller--diff-added))))
          (magit-diff-del ((t (:inherit theme-roller--diff-removed))))
          (magit-diff-none ((t (:inherit theme-roller--diff-context))))

          (flymake-errline ((t (:inherit theme-roller--code-error))))
          (flymake-warnline ((t (:inherit theme-roller--code-warning))))

          (ediff-current-diff-A ((((class color) (min-colors 16)) (:background "#01243C" :foreground "white"))))
          (ediff-current-diff-Ancestor ((((class color) (min-colors 16)) (:background "#4D0600" :foreground "white"))))
          (ediff-current-diff-B ((((class color) (min-colors 16)) (:background "#574A00" :foreground "white"))))
          (ediff-current-diff-C ((((class color) (min-colors 16)) (:background "#5C285C" :foreground "white"))))
          (ediff-even-diff-A ((((class color) (min-colors 16)) (:background "#222222"))))
          (ediff-even-diff-Ancestor ((((class color) (min-colors 16)) (:background "#222222"))))
          (ediff-even-diff-B ((((class color) (min-colors 16)) (:background "#222222"))))
          (ediff-even-diff-C ((((class color) (min-colors 16)) (:background "#222222"))))
          (ediff-fine-diff-A ((((class color) (min-colors 16)) (:background "#0B5C00" :foreground "white"))))
          (ediff-fine-diff-Ancestor ((((class color) (min-colors 16)) (:background "#0B5C00" :foreground "white"))))
          (ediff-fine-diff-B ((((class color) (min-colors 16)) (:background "#0B5C00" :foreground "white"))))
          (ediff-fine-diff-C ((((class color) (min-colors 16)) (:background "#0B5C00" :foreground "white"))))
          (ediff-odd-diff-A ((((class color) (min-colors 16)) (:background "#222222"))))
          (ediff-odd-diff-Ancestor ((((class color) (min-colors 16)) (:background "#222222"))))
          (ediff-odd-diff-B ((((class color) (min-colors 16)) (:background "#222222"))))

          (js2-error-face ((t (:inherit theme-roller--code-error))))
          (js2-external-variable-face ((t (:inherit theme-roller--code-variable))))
          (js2-function-param-face ((t (:inherit theme-roller--code-variable))))
          (js2-instance-member-face ((t (:inherit theme-roller--code-variable))))
          (js2-private-function-call-face ((t (:inherit theme-roller--base-font))))
          (js2-private-member-face ((t (:inherit theme-roller--code-variable))))
          (js2-warning-face ((t (:inherit theme-roller--code-warning))))

          (html-tag-face ((t (:inherit theme-roller--code-keyword))))

          (mumamo-background-chunk-major ((t (:inherit background-color))))
          (mumamo-background-chunk-submode ((t (:inherit background-color))))
          (mumamo-background-chunk-submode1 ((t (:inherit theme-roller--durable-highlight))))
          (nxml-delimited-data-face ((t (:inherit theme-roller--code-string))))
          (nxml-name-face ((t (:inherit theme-roller--code-variable))))
          (nxml-ref-face ((t (:inherit theme-roller--code-constant))))
          (nxml-delimiter-face ((t (:inherit theme-roller--code-keyword))))
          (nxml-tag-delimiter-face ((t (:inherit theme-roller--base-font))))
          (nxml-tag-delimiter ((t (:inherit theme-roller--base-font))))
          (nxml-tag-slash-face ((t (:inherit theme-roller--code-keyword))))
          (nxml-text-face ((t (:inherit theme-roller--base-font))))
          (nxml-attribute-local-name-face ((t (:inherit theme-roller--code-variable))))
          (nxml-attribute-value-face ((t (:inherit theme-roller--code-string))))
          (nxml-attribute-value-delimiter-face ((t (:inherit theme-roller--code-string))))
          (nxml-comment-content-face ((t (:inherit theme-roller--code-comment))))
          (nxml-comment-delimiter-face ((t (:inherit theme-roller--code-comment))))
          (nxml-processing-instruction-delimiter-face ((t (:inherit theme-roller--code-meta))))
          (nxml-cdata-section-CDATA-face ((t (:inherit theme-roller--code-constant))))
          (nxml-cdata-section-delimiter-face ((t (:inherit theme-roller--code-keyword))))
          (nxml-element-local-name-face ((t (:inherit theme-roller--code-keyword))))
          (nxml-element-local-name ((t (:inherit theme-roller--code-keyword))))

          (sgml-namespace ((t (:inherit theme-roller--code-type))))
          (css-selector ((t (:inherit theme-roller--code-keyword))))

          (yas/mirror-highlight-face ((t (:inherit theme-roller--code-constant))))
          (yas/field-highlight-face ((t (:inherit theme-roller--code-variable))))

          (org-done ((t (:inherit theme-roller--code-string :bold t))))
          (org-todo ((t (:inherit theme-roller--code-variable :bold t))))
          (org-level-1 ((t (:inherit theme-roller--base-font :underline t :bold t))))
          (org-level-2 ((t (:inherit theme-roller--code-variable))))
          (org-level-3 ((t (:inherit theme-roller--code-keyword))))
          (org-level-4 ((t (:inherit theme-roller--code-type))))
          (org-special-keyword ((t (:inherit theme-roller--code-documentation))))

          (newsticker-treeview-selection-face ((t (:inherit theme-roller--brief-highlight))))
          (newsticker-treeview-face ((t (:inherit theme-roller--base-font))))
          (newsticker-treeview-immortal-face ((t (:inherit theme-roller--code-keyword))))

          (ido-only-match ((t (:inherit theme-roller--code-string))))
          (ido-subdir ((t (:inherit theme-roller--code-constant))))

          (mac-ts-caret-position ((t (:inherit theme-roller--durable-highlight))))

          (erb-comment-face ((t (:inherit theme-roller--code-comment))))
          (erb-comment-delim-face ((t (:inherit theme-roller--code-comment))))
          (erb-exec-face ((t (:inherit theme-roller--durable-highlight))))
          (erb-exec-delim-face ((t (:inherit theme-roller--code-meta))))
          (erb-out-face ((t (:inherit theme-roller--durable-highlight))))
          (erb-out-delim-face ((t (:inherit theme-roller--code-meta))))

          (link ((t (:inherit theme-roller--link))))
          (show-paren-match ((t (:inherit theme-roller--brief-highlight))))
          (show-paren-mismatch ((t (:inherit theme-roller--code-error))))
          (compilation-info ((t (:inherit theme-roller--code-string))))
          (compilation-line-number ((t (:inherit theme-roller--code-constant))))

          (region ((t (:inherit theme-roller--selection))))
          (minibuffer-prompt ((t (:inherit theme-roller--minibuffer-prompt))))
          (minibuffer-noticeable-prompt ((t (:inherit theme-roller--minibuffer-prompt))))
          (mode-line ((t (:inherit theme-roller--mode-line))))
          (highlight ((t (:inherit theme-roller--brief-highlight))))
          (hl-line ((t (:inherit theme-roller--durable-highlight))))
          (left-margin ((t (nil)))))))
       (add-to-list 'color-themes '(,color-theme-function-symbol ,name "Theme Roller"))
       )))

(if (file-exists-p *theme-roller-themes-dir*)
  (mapc #'load (directory-files *theme-roller-themes-dir* t ".*elc?$")))

(provide 'theme-roller)
