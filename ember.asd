;;;; <https://mailman.common-lisp.net/pipermail/armedbear-devel/2020-July/004074.html>
#| for openjdk17 one needs to run the JVM with the option

  --add-exports java.base/sun.nio.ch=ALL-UNNAMED

<Https://stackoverflow.com/questions/72230174/java-17-solution-for-spark-java-lang-noclassdeffounderror-could-not-initializ>
|#

(defsystem ember
  :description "Wrapper for Apache Spark"
  :defsystem-depends-on (jss abcl-asdf)
  :depends-on (#:jss #:javaparser)
  :perform (load-op (o c)
              ;; pre-abcl-1.9.1 version                    
              (#"setContextClassLoader"
               (#"currentThread" 'Thread)
               (java:get-current-classloader))
              ;; abcl-1.9.1 onwards
              #+nil
              (setf (java:context-classloader)
                    (java:get-default-classloader))
              (call-next-method o c))
  :components ((:mvn "org.apache.spark/spark-core_2.12/3.3.1")
               (:file "package")
               (:file "ember")))
