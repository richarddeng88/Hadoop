## define variable
Sys.setenv("HADOOP_CMD"="/usr/lib/hadoop/bin/hadoop")
Sys.setenv("HADOOP_PREFIX"="/usr/lib/hadoop")
Sys.setenv("JAVA_HOME"="/usr/java/jdk1.7.0_67-cloudera")
Sys.setenv("HADOOP_STREAMING"="/usr/lib/hadoop-mapreduce/hadoop-streaming-2.6.0-cdh5.4.2.jar")

library(rJava);library(RJSONIO);library(Rcpp);library(digest);library(functional);library(reshape2)
library(stringr);library(plyr);library(caTools);library(bitops);library(rjson);library(bit64);library(javareconf)
library(rhdfs);library(rmr2);library(plyrmr);library(ravro)

## it is recommended to add these environment variables to the file /etc/profile so that they will be 
## available to all users.

  #initicate 
  hdfs.init()
  
  hdfs.ls("/user/cloudera/data/movie_data/userinfo")
  hdfs.mkdir("RHadoop")
  getwd()
  hdfs.put()
  file <- hdfs.file('data/movie_data/userinfo/u.user','r')
  file <- hdfs.read(file)
  file <- rawToChar(file)
  data <- read.table(textConnection(file), sep='|')
  
  
  ## install the packages
  install.packages("/home/cloudera/Documents/rhadoop/rhdfs_1.0.8.tar.gz", repos=NULL, type="source")
  install.packages("/home/cloudera/Documents/rhadoop/rmr2_3.3.1.tar.gz", repos=NULL, type="source")
  install.packages("/home/cloudera/Documents/rhadoop/plyrmr_0.6.0.tar.gz", repos=NULL, type="source")
  install.packages("/home/cloudera/Documents/rhadoop/ravro_1.0.4.tar.gz", repos=NULL, type="source")
  install.packages("/home/cloudera/Documents/rhadoop/rhbase_1.2.1.tar.gz", repos=NULL, type="source")
  