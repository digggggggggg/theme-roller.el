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
                                  (code-info)
                                  (code-addition))
  (let ((color-theme-function-symbol (intern (concat "color-theme-" (downcase name)))))
    `(progn
       (defun ,color-theme-function-symbol ()
       "Color theme by Yves Senn"
       (interactive)
       (color-theme-install
        '(,color-theme-function-symbol
          ,variables
          (senny-base-font ((t ,base-font)))
          (senny-selection ((t ,selection)))
          (senny-brief-highlight ((t ,brief-highlight)))
          (senny-durable-highlight ((t ,durable-highlight)))
          (senny-link ((t ,link)))
          (senny-mode-line ((t ,mode-line)))
          (senny-minibuffer-prompt ((t ,minibuffer-prompt)))
          (senny-code-variable ((t ,code-variable)))
          (senny-code-reference ((t ,code-reference)))
          (senny-code-constant ((t ,code-constant)))
          (senny-code-type ((t ,code-type)))
          (senny-code-keyword ((t ,code-keyword)))
          (senny-code-string ((t ,code-string)))
          (senny-code-escape-char ((t ,code-escape-char)))
          (senny-code-comment ((t ,code-comment)))
          (senny-code-documentation ((t ,code-documentation)))
          (senny-code-function ((t ,code-function)))
          (senny-code-meta ((t ,code-meta)))
          (senny-code-error ((t ,code-error)))
          (senny-code-warning ((t ,code-warning)))
          (senny-code-info ((t ,code-info)))
          (senny-code-addition ((t ,code-addition)))

          (border-glyph ((t (nil)))) ;; flat borders

          (paren-face ((t ,base-font)))
          (esk-paren-face ((t ,base-font)))

          (font-lock-builtin-face ((t (:inherit senny-base-font))))
          (font-lock-comment-face ((t (:inherit senny-code-comment))))
          (font-lock-comment-delimiter-face ((t (:inherit senny-code-comment))))
          (font-lock-constant-face ((t (:inherit senny-code-constant))))
          (font-lock-doc-face ((t (:inherit senny-code-documentation))))
          (font-lock-doc-string-face ((t (:inherit senny-code-documentation))))
          (font-lock-function-name-face ((t (:inherit senny-code-function))))
          (font-lock-keyword-face ((t (:inherit senny-code-keyword))))
          (font-lock-preprocessor-face ((t (:inherit senny-code-meta))))
          (font-lock-reference-face ((t (:inherit senny-code-reference))))

          ;; TODO: assign face
          (font-lock-negation-char-face ((t (nil))))

          (font-lock-regexp-grouping-backslash ((t (:inherit senny-code-comment))))
          (font-lock-regexp-grouping-construct ((t (:foreground "red"))))

          (font-lock-string-face ((t (:inherit senny-code-string))))
          (font-lock-type-face ((t (:inherit senny-code-type))))
          (font-lock-variable-name-face ((t (:inherit senny-code-variable))))
          (font-lock-warning-face ((t (:inherit senny-code-warning))))

          (jde-java-font-lock-doc-tag-face ((t (:inherit senny-code-documentation :bold t))))
          (jde-java-font-lock-constant-face ((t (:inherit senny-code-constant))))
          (jde-java-font-lock-link-face ((t (:inherit senny-link))))
          (jde-java-font-lock-modifier-face ((t (:inherit senny-code-keyword))))
          (jde-java-font-lock-package-face ((t (:inherit senny-code-keyword))))
          (jde-java-font-lock-number-face ((t (:inherit senny-code-string))))
          (jde-java-font-lock-code-face ((t (:inherit senny-base-font))))
          (jde-db-spec-breakpoint-face ((t (:inherit diff-header))))
          (jde-db-requested-breakpoint-face ((t (:inherit diff-changed))))
          (jde-db-active-breakpoint-face ((t (:inherit diff-added))))

          (ecb-default-highlight-face ((t (:inherit senny-brief-highlight))))

          (log4j-font-lock-info-face ((t (:inherit senny-code-variable))))
          (log4j-font-lock-error-face ((t (:inherit senny-code-constant))))
          (log4j-font-lock-warn-face ((t (:inherit senny-code-keyword))))

          (diff-header ((t (:inherit senny-code-info))))
          (diff-added ((t (:inherit senny-code-addition))))
          (diff-removed ((t (:inherit senny-code-error))))
          (diff-changed ((t (:inherit senny-code-warning))))
          (diff-context ((t (:inherit senny-code-comment))))
          (diff-index ((t (:inherit senny-code-comment))))

          (jde-db-active-breakpoint-face ((t (:inherit (:inherit senny-code-error)))))
          (jde-db-requested-breakpoint-face ((t (:inherit senny-code-warning))))
          (jde-db-spec-breakpoint-face ((t (:inherit senny-code-addition))))

          (flymake-errline ((t (:inherit senny-code-error))))
          (flymake-warnline ((t (:inherit senny-code-warning))))

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

          (js2-error-face ((t (:inherit senny-code-error))))
          (js2-external-variable-face ((t (:inherit senny-code-variable))))
          (js2-function-param-face ((t (:inherit senny-code-variable))))
          (js2-instance-member-face ((t (:inherit senny-code-variable))))
          (js2-private-function-call-face ((t (:inherit senny-base-font))))
          (js2-private-member-face ((t (:inherit senny-code-variable))))
          (js2-warning-face ((t (:inherit senny-code-warning))))

          (html-tag-face ((t (:inherit senny-code-keyword))))

          (mumamo-background-chunk-major ((t (:inherit background-color))))
          (mumamo-background-chunk-submode ((t (:inherit background-color))))
          (mumamo-background-chunk-submode1 ((t (:inherit senny-durable-highlight))))
          (nxml-delimited-data-face ((t (:inherit senny-code-string))))
          (nxml-name-face ((t (:inherit senny-code-variable))))
          (nxml-ref-face ((t (:inherit senny-code-constant))))
          (nxml-delimiter-face ((t (:inherit senny-code-keyword))))
          (nxml-tag-delimiter-face ((t (:inherit senny-base-font))))
          (nxml-tag-delimiter ((t (:inherit senny-base-font))))
          (nxml-tag-slash-face ((t (:inherit senny-code-keyword))))
          (nxml-text-face ((t (:inherit senny-base-font))))
          (nxml-attribute-local-name-face ((t (:inherit senny-code-variable))))
          (nxml-attribute-value-face ((t (:inherit senny-code-string))))
          (nxml-attribute-value-delimiter-face ((t (:inherit senny-code-string))))
          (nxml-comment-content-face ((t (:inherit senny-code-comment))))
          (nxml-comment-delimiter-face ((t (:inherit senny-code-comment))))
          (nxml-processing-instruction-delimiter-face ((t (:inherit senny-code-meta))))
          (nxml-cdata-section-CDATA-face ((t (:inherit senny-code-constant))))
          (nxml-cdata-section-delimiter-face ((t (:inherit senny-code-keyword))))
          (nxml-element-local-name-face ((t (:inherit senny-code-keyword))))
          (nxml-element-local-name ((t (:inherit senny-code-keyword))))

          (sgml-namespace ((t (:inherit senny-code-type))))
          (css-selector ((t (:inherit senny-code-keyword))))

          (yas/mirror-highlight-face ((t (:inherit senny-code-constant))))
          (yas/field-highlight-face ((t (:inherit senny-code-variable))))

          (org-done ((t (:inherit senny-code-string :bold t))))
          (org-todo ((t (:inherit senny-code-variable :bold t))))
          (org-level-1 ((t (:inherit senny-base-font :underline t :bold t))))
          (org-level-2 ((t (:inherit senny-code-variable))))
          (org-level-3 ((t (:inherit senny-code-keyword))))
          (org-level-4 ((t (:inherit senny-code-type))))
          (org-special-keyword ((t (:inherit senny-code-documentation))))

          (newsticker-treeview-selection-face ((t (:inherit senny-brief-highlight))))
          (newsticker-treeview-face ((t (:inherit senny-base-font))))
          (newsticker-treeview-immortal-face ((t (:inherit senny-code-keyword))))

          (ido-only-match ((t (:inherit senny-code-string))))
          (ido-subdir ((t (:inherit senny-code-constant))))

          (mac-ts-caret-position ((t (:inherit senny-durable-highlight))))

          (erb-comment-face ((t (:inherit senny-code-comment))))
          (erb-comment-delim-face ((t (:inherit senny-code-comment))))
          (erb-exec-face ((t (:inherit senny-durable-highlight))))
          (erb-exec-delim-face ((t (:inherit senny-code-meta))))
          (erb-out-face ((t (:inherit senny-durable-highlight))))
          (erb-out-delim-face ((t (:inherit senny-code-meta))))

          (magit-item-highlight ((t (:inherit senny-durable-highlight))))

          (link ((t (:inherit senny-link))))
          (show-paren-match ((t (:inherit senny-brief-highlight))))
          (show-paren-mismatch ((t (:inherit senny-code-error))))

          (region ((t (:inherit senny-selection))))
          (minibuffer-prompt ((t (:inherit senny-minibuffer-prompt))))
          (minibuffer-noticeable-prompt ((t (:inherit senny-minibuffer-prompt))))
          (mode-line ((t (:inherit senny-mode-line))))
          (highlight ((t (:inherit senny-brief-highlight))))
          (hl-line ((t (:inherit senny-durable-highlight))))
          (left-margin ((t (nil)))))))
       (add-to-list 'color-themes '(,color-theme-function-symbol ,name "Yves Senn"))
       )))

(if (file-exists-p *theme-roller-themes-dir*)
  (mapc #'load (directory-files *theme-roller-themes-dir* t ".*elc?$")))
