
import oracle.j2ee.ws.client.StubBase;
import oracle.j2ee.ws.client.http.HttpSOAPConnectionClientTransportFactory;
import sun.misc.BASE64Encoder;
import java.io.*;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class WebServiceClient
{
   
    /**
     * WebServiceClient 클래스는 KHUB API WSDL로 생성된 Stub 클래스들을 이용하여
     * KHUB API를 호출하는 예제 프로그램이다.
     * @param args
     */
    public static void main(String[] args)
    {
        // 서비스에 필요한 파라미터를 저장할 WsParamSet 생성
		WsParamSet wps = new WsParamSet();
        // 필요한 파라미터 개수 크기의 WsParam 배열 생성
		WsParam[] params = new WsParam[1];
        // 파라미터 하나하나에 맵핑되는 WsParam을 생성하여 파라미터 이름과 값 셋팅
        params[0] = new WsParam();
        params[0].setName("CALL_CTN");
        params[0].setValue("0162221001");
	       wps.setParam(params);
	    // BizTemplate 인증키 셋팅
	    // String authKey = "TXXXXXXXXXXXX";
      String authKey = "T8D0DC0AECDD0828";
         
	    // BizTemplate ID 셋팅
	    // String templateID = "AUTH_JOININFOWCDM";
        // String templateID = "MESG_MTSMSOPE"; // 20213895803556940001
        // String templateID = "AUTH_HIDETEST1"; // 20213895803323500001
        String templateID = "MESG_MTMMSRPTNNC"; //20213895803079280001
        
	    // 표준 API URL 셋팅, 웹서비스 주소 변경시 serviceURL의 URL를 수정한다. 
	    String serviceURL = "http://125.131.85.42:80/khub/WebService";

	    IWebServiceEndpoint iwse = null;
        try {
            // IWebServiceEndpoint 객체를 생성하여 ServiceURL를 셋팅한다
            iwse = new IWebServiceEndpoint();
            iwse.setEndpoint(serviceURL);
            // KHUB API를 호출한다.
            WsParamSet paramSet = iwse.invoke_API(templateID, authKey, wps);
            // 리턴받은 결과를 출력한다.
    			WsParam[] resultParams =  paramSet.getParam();
    			System.out.println("******* OUTPUT *******");
    			for(int j = 0; j < resultParams.length; j++) {
    		         System.out.println("["+resultParams[j].getName()+"] = "+resultParams[j].getValue());
    			}
        } catch(Exception e) {
        }


        try {
          Connection con = null;

          con = DriverManager.getConnection("jdbc:mysql://222.235.208.216/com_dev","root", "root.123");

          java.sql.Statement st = null;
          ResultSet rs = null;
          st = con.createStatement();
          rs = st.executeQuery("SHOW tables");

          if (st.execute("SHOW tables")) {
            rs = st.getResultSet();
          }

          while (rs.next()) {
            String str = rs.getNString(1);
            System.out.println(str);
          }
        } catch (SQLException sqex) {
          System.out.println("SQLException: " + sqex.getMessage());
          System.out.println("SQLState: " + sqex.getSQLState());
        }
    }	
}
