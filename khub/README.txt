WsServiceClient Ŭ������ KHUB API WSDL�� ������ Stub Ŭ�������� �̿��Ͽ�
KHUB API�� ȣ���ϴ� ���� ���α׷��̴�.

[1] ��������
 1. lib : WebServiceClient�� �����ϱ� ���� ���� ���̺귯������ ����� ��.
 2. src : ǥ��API ���� ���α׷� �ҽ� ����� ��.
    - WsParam.java, WsParamSet.java, WebServiceClient.java 3���� �ҽ��� ���� �ڵ� �� ���̸� ������ �ҽ��� JDeveloper������ �������ִ� ��Generate Web Service Stub/Skeleton�� ����� �̿��Ͽ� ������ �ҽ��̴�. 
    - WsParam.java :  Name, Value�� getter, setter�� ���� 
    - WsParamSet.java : User Define�� Type���� ���������� WsParam�� Array�� ����
    - WebServiceClient.java : ǥ�� API�� ȣ���ϴ� ���� ���� ���α׷�.

[2] ���� ���α׷� �����ϱ�

 [DOS ��]
 1) java ������ C ����̺꿡 ���縦 �Ѵ�.
 2) �޸��忡 �Ʒ��� ������ �ۼ� �� �� C:\java�� com.bat���� �����Ѵ�.
	set CLASSPATH=.;lib\activation.jar
	set CLASSPATH=%CLASSPATH%;lib\commons-logging.jar
	set CLASSPATH=%CLASSPATH%;lib\http_client.jar
	set CLASSPATH=%CLASSPATH%;lib\jax-qname-namespace.jar
	set CLASSPATH=%CLASSPATH%;lib\jaxrpc-api.jar
	set CLASSPATH=%CLASSPATH%;lib\mail.jar
	set CLASSPATH=%CLASSPATH%;lib\orasaaj.jar
	set CLASSPATH=%CLASSPATH%;lib\relaxngDatatype.jar
	set CLASSPATH=%CLASSPATH%;lib\saaj-api.jar
	set CLASSPATH=%CLASSPATH%;lib\wsclient.jar
	set CLASSPATH=%CLASSPATH%;lib\xmlparserv2.jar
	set CLASSPATH=%CLASSPATH%;lib\xsdlib.jar	
	javac -classpath %CLASSPATH% src/khub/*.java
 3) �޸��忡 �Ʒ��� ������ �ۼ� �� �� C:\java�� exe.bat���� �����Ѵ�.
	set CLASSPATH=.;lib\activation.jar
	set CLASSPATH=%CLASSPATH%;lib\commons-logging.jar
	set CLASSPATH=%CLASSPATH%;lib\http_client.jar
	set CLASSPATH=%CLASSPATH%;lib\jax-qname-namespace.jar
	set CLASSPATH=%CLASSPATH%;lib\jaxrpc-api.jar
	set CLASSPATH=%CLASSPATH%;lib\mail.jar
	set CLASSPATH=%CLASSPATH%;lib\orasaaj.jar
	set CLASSPATH=%CLASSPATH%;lib\relaxngDatatype.jar
	set CLASSPATH=%CLASSPATH%;lib\saaj-api.jar
	set CLASSPATH=%CLASSPATH%;lib\wsclient.jar
	set CLASSPATH=%CLASSPATH%;lib\xmlparserv2.jar
	set CLASSPATH=%CLASSPATH%;lib\xsdlib.jar
	set CLASSPATH=%CLASSPATH%;src/khub\
	java -classpath %CLASSPATH% WebServiceClient
 5) WebServiceClient.java �ҽ� ���� �� ����
   -> KHUB ���� URL, API ID, KHUB ���� Key, ����� �� ��� 
 6) ���� -> ���� -> cmd �Է� �� Ȯ��
 7) ���� �ҽ��� �ִ� ������ �̵��Ѵ�.
    �Է� : cd \java
 8) �������� �Ѵ�.
    �Է�: com.bat
   * ������ �߻��Ѵٸ� CLASSPATH�� �ٽ� Ȯ���� ����.
 9) ���üҽ��� �����Ѵ�. 
    �Է�: exe.bat
 10) RT�� ���ϵǸ� �������� ȣ�� ����

 [��Ŭ���� ��(Version: 3.5.1)]
 1) java ������ C ����̺꿡 ���縦 �Ѵ�.
 2) File > New > Java Project
 3) Create project from existing source ����
 4) Browser�� C:\java\src\khub ���� �� Ȯ��
 5) Finish
 6) Package Explorer���� khub ������Ʈ > ������ ���콺 > Build Path > Comfigure Build Path ����
 7) Java Build Path�� Libraries �ǿ��� Add External JARs ����
 8) C:\java\lib ������ jar ���ϵ� ��� �߰� �� Ȯ��
 9) WebServiceClient.java ���� ����
    -> KHUB ���� URL, API ID, KHUB ���� Key, ����� �� ��� 
 10) khub ������Ʈ > ������ ���콺 > Run As > Java Application 
 11) WebServiceClient ���� �� Ȯ��
 12) RT�� ���ϵǸ� �������� ȣ�� ����



