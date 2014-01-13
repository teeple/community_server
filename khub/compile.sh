export CLASSPATH=.:./lib/activation.jar
export CLASSPATH=$CLASSPATH:./lib/commons-logging.jar
export CLASSPATH=$CLASSPATH:./lib/http_client.jar
export CLASSPATH=$CLASSPATH:./lib/jax-qname-namespace.jar
export CLASSPATH=$CLASSPATH:./lib/jaxrpc-api.jar
export CLASSPATH=$CLASSPATH:./lib/mail.jar
export CLASSPATH=$CLASSPATH:./lib/orasaaj.jar
export CLASSPATH=$CLASSPATH:./lib/relaxngDatatype.jar
export CLASSPATH=$CLASSPATH:./lib/saaj-api.jar
export CLASSPATH=$CLASSPATH:./lib/wsclient.jar
export CLASSPATH=$CLASSPATH:./lib/xmlparserv2.jar
export CLASSPATH=$CLASSPATH:./lib/xsdlib.jar
export CLASSPATH=$CLASSPATH:./lib/mysql-connector-java-5.1.28-bin.jar
javac -classpath $CLASSPATH src/khub/*.java
