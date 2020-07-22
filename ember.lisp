(in-package :ember)
    
(defun get-conf (&key (app-name "abcl-app") (conf-master "local"))
  (let ((conf (jss:new (jss:find-java-class "org.apache.spark.sparkConf"))))
    (java:chain conf
                ("setAppName" app-name)
                ("setMaster" conf-master))))

        
#|  #1"new SparkConf()
    .setAppName(app-name)
    .setMaster(conf-master)"
|#
    
(defvar *spark-conf* (get-conf))o

(defun new-context (&key (spark-conf (get-conf)))
  (jss:new 'JavaSparkContext *spark-conf*))

