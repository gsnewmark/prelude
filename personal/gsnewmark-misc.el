;;; gsnewmark-misc.el --- Custom helper functions.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(prelude-require-packages '(s dash))

(require 's)
(require 'dash)

;;; TODO switch to threading ->>
;;; TODO safer header transformation (using regexp)
;;; TODO extract common helpers
;;; TODO try moving to http://tkf.github.io/emacs-request/
;;; TODO transform url parameters to key==value
(defun gsnewmark-run-request-from-wiki (start end)
  "Custom function to run http request described as:

    <HTTP method> URL
    --- Headers ---
    <list of header pairs>
    ---Body---
    <json>

  using the httpie CLI util on the selected region

    START - start of the region
    END - end of the region"
  (interactive "r")
  (let* ((request (buffer-substring start end))
         (lines (s-lines request))
         (method-and-url (car lines))
         (req-arguments
          (--partition-by-header (s-starts-with? "--- " it) (cddr lines)))
         (headers
          (s-join
           " "
           (--map (s-concat "'" it "'")
                  (--map (s-replace ": " ":" it)
                         (--filter (not (s-starts-with? it "```'''"))
                                   (cdar
                                    (--filter (s-equals? (car it) "--- Headers ---" )
                                              req-arguments)))))))
         (json (s-join " "
                       (--filter (not (s-starts-with? it "```json'''"))
                                 (cdar
                                  (--filter (s-equals? (car it) "--- Body ---" )
                                            req-arguments)))))
         (command (concat "echo '" json "'| http --pretty=format --print=hbHB " method-and-url " " headers)))
    (with-output-to-temp-buffer method-and-url
      (print (shell-command-to-string command)))))

(provide 'gsnewmark-misc)

;;; gsnewmark-misc.el ends here
