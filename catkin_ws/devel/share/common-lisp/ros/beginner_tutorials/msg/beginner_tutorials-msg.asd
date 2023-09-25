
(cl:in-package :asdf)

(defsystem "beginner_tutorials-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "student" :depends-on ("_package_student"))
    (:file "_package_student" :depends-on ("_package"))
  ))