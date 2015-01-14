;;; gsnewmark-scala.el --- Scala configuration.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(prelude-require-package 'ensime)

(require 'scala-mode2)

(custom-set-variables
 '(scala-indent:default-run-on-strategy scala-indent:operator-strategy)
 '(scala-indent:use-javadoc-style t))

;; from https://github.com/tototoshi/dotemacs/blob/master/my-scala-config.el#L28
(setq scala-imenu-generic-expression
      '(("var" "\\(var +\\)\\([^(): ]+\\)" 2)
        ("val" "\\(val +\\)\\([^(): ]+\\)" 2)
        ("override def" "^[ \\t]*\\(override\\) +\\(def +\\)\\([^(): ]+\\)" 3)
        ("private def" "^[ \\t]*\\(private\\(\\[.*?\\]+\\)*\\) +\\(def +\\)\\([^(): ]+\\)" 4)
        ("protected def" "^[ \\t]*\\(protected\\(\\[.*?\\]+\\)*\\) +\\(def +\\)\\([^(): ]+\\)" 4)
        ("implicit def" "^[ \\t]*\\(implicit\\) +\\(def +\\)\\([^(): ]+\\)" 3)
        ("def" "^[ \\t]*\\(def +\\)\\([^(): ]+\\)" 2)
        ("trait" "\\(trait +\\)\\([^(): ]+\\)" 2)
        ("class" "^[ \\t]*\\(class +\\)\\([^(): ]+\\)" 2)
        ("case class" "^[ \\t]*\\(case class +\\)\\([^(): ]+\\)" 2)
        ("abstract class" "^[ \\t]*\\(abstract class +\\)\\([^(): ]+\\)" 2)
        ("object" "\\(object +\\)\\([^(): ]+\\)" 2)))

(require 'ensime)

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(add-hook 'scala-mode-hook
          '(lambda ()
             (set-fill-column 120)
             (setq imenu-generic-expression scala-imenu-generic-expression)))
(add-hook 'scala-mode-hook 'flyspell-prog-mode)

(provide 'gsnewmark-scala)

;;; gsnewmark-scala.el ends here
