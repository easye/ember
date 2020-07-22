;;; <https://mailman.common-lisp.net/pipermail/armedbear-devel/2020-July/004074.html>

(defsystem ember
  :description "Wrapper for Spark 3.0"
  :defsystem-depends-on (abcl-asdf)
  :depends-on (#:jss #:javaparser)
  :components ((:mvn "org.apache.spark/spark-core_2.12" :version "3.0.0")
               (:file "package")
               (:file "ember")))
