;;; mygithub.el --- open issues or pulls             -*- lexical-binding: t; -*-

;; Copyright (C) 2014  Raimon Grau

;; Author: Raimon Grau <raimonster@gmail.com>
;; Keywords: convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(defvar mygithub-projects
  '("kidd/mygithub.el"))

(defvar mygithub-github-url "https://www.github.com/")


(defvar mygithub-actions '(("pulls" "/pulls") ("issues" "/issues") ("code" "")))


(defun mygithub (&optional arg)
  "lets you go to the code, issues or pulls for your
projects. With argument it creates an issue or a pull request"
  (interactive)
  (let ((what (cadr (assoc (ido-completing-read "what:" (mapcar 'car mygithub-actions)) mygithub-actions)))
        (project (ido-completing-read "project:" mygithub-projects)))
    (browse-url (concat mygithub-github-url
                        project
                        what
                        (cond
                          ((string= what"/issues") "/new")
                          ((string= what "/pulls") "/new")
                          (t ""))))))

(provide 'mygithub)
;;; mygithub.el ends here
