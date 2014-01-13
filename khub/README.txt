WsServiceClient 클래스는 KHUB API WSDL로 생성된 Stub 클래스들을 이용하여
KHUB API를 호출하는 예제 프로그램이다.

[1] 폴더설명
 1. lib : WebServiceClient를 실행하기 위한 참조 라이브러리들이 저장된 곳.
 2. src : 표준API 예제 프로그램 소스 저장된 곳.
    - WsParam.java, WsParamSet.java, WebServiceClient.java 3개의 소스는 직접 코딩 한 것이며 나머지 소스는 JDeveloper툴에서 제공해주는 “Generate Web Service Stub/Skeleton” 기능을 이용하여 생성된 소스이다. 
    - WsParam.java :  Name, Value의 getter, setter로 구성 
    - WsParamSet.java : User Define된 Type으로 내부적으로 WsParam을 Array로 가짐
    - WebServiceClient.java : 표준 API를 호출하는 메인 예제 프로그램.

[2] 예제 프로그램 실행하기

 [DOS 용]
 1) java 폴더를 C 드라이브에 복사를 한다.
 2) 메모장에 아래의 내용을 작성 한 후 C:\java에 com.bat으로 저장한다.
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
 3) 메모장에 아래의 내용을 작성 한 후 C:\java에 exe.bat으로 저장한다.
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
 5) WebServiceClient.java 소스 수정 후 저장
   -> KHUB 연동 URL, API ID, KHUB 인증 Key, 입출력 값 등등 
 6) 시작 -> 실행 -> cmd 입력 후 확인
 7) 샘플 소스가 있는 폴더로 이동한다.
    입력 : cd \java
 8) 컴파일을 한다.
    입력: com.bat
   * 에러가 발생한다면 CLASSPATH를 다시 확인해 본다.
 9) 샘플소스를 실행한다. 
    입력: exe.bat
 10) RT가 리턴되면 정상적인 호출 성공

 [이클립스 툴(Version: 3.5.1)]
 1) java 폴더를 C 드라이브에 복사를 한다.
 2) File > New > Java Project
 3) Create project from existing source 선택
 4) Browser로 C:\java\src\khub 선택 후 확인
 5) Finish
 6) Package Explorer에서 khub 프로젝트 > 오른쪽 마우스 > Build Path > Comfigure Build Path 선택
 7) Java Build Path의 Libraries 탭에서 Add External JARs 선택
 8) C:\java\lib 폴더의 jar 파일들 모두 추가 후 확인
 9) WebServiceClient.java 파일 수정
    -> KHUB 연동 URL, API ID, KHUB 인증 Key, 입출력 값 등등 
 10) khub 프로젝트 > 오른쪽 마우스 > Run As > Java Application 
 11) WebServiceClient 선택 후 확인
 12) RT가 리턴되면 정상적인 호출 성공



