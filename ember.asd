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
                    (#"setContextClassLoader" (#"currentThread" 'Thread)
                                              (java:get-current-classloader))
                    (call-next-method o c))
  :components ((:mvn "org.apache.spark/spark-core_2.12" :version "3.3.1")
               (:file "package")
               (:file "ember")))
