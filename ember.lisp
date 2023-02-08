(in-package :ember)

#| <https://mailman.common-lisp.net/pipermail/armedbear-devel/2020-July/004074.html>
  #1"new SparkConf()
   .setAppName(app-name)
   .setMaster(conf-master)"
|#
(defun get-conf (&key (app-name "abcl-app") (conf-master "local"))
  (let ((conf (jss:new (jss:find-java-class "org.apache.spark.sparkConf"))))
    (java:chain conf
                ("setAppName" app-name)
                ("setMaster" conf-master))))
    
(defvar *spark-conf* (get-conf))
(defvar *spark-context* nil)

;;; JavaSparkContext is a per JVM singleton
(defun spark-context (&key (spark-conf (get-conf)))
  (unless *spark-context* 
    (setf *spark-context*
          (jss:new 'JavaSparkContext spark-conf)))
  *spark-context*)

