
import oracle.j2ee.ws.client.StubBase;
import oracle.j2ee.ws.client.http.HttpSOAPConnectionClientTransportFactory;
import sun.misc.BASE64Encoder;
import java.io.*;
import java.util.*;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

public class WebServiceClient
{
   
    /**
     * WebServiceClient 클래스는 KHUB API WSDL로 생성된 Stub 클래스들을 이용하여
     * KHUB API를 호출하는 예제 프로그램이다.
     * @param args
     */
    public static void main(String[] args)
    {
      WebServiceClient client = new WebServiceClient();

      Connection con = null;

      while(true){
          try{
            //make connection
            if(con == null) con = DriverManager.getConnection("jdbc:mysql://222.235.208.216/com_dev","root", "root.123");
            
            //fetch sms request
            java.sql.Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            rs = st.executeQuery("select receiver_phone_no, sms_message, event_id from sms_notifications where status = 'NEW'");

            while (rs.next()) {
              //String str = rs.getNString(1);
              String phone_no = rs.getString("receiver_phone_no");
              String sms_message = rs.getString("sms_message");
              int event_id = rs.getInt("event_id");

              //send sms
              HashMap<String, String> result = client.sendSms(phone_no,sms_message);
              
              //update database
              String update_sql = "update sms_notifications set status = ? , error_reason = ? ,sent_at = now() where event_id = ?";
              PreparedStatement update_st = con.prepareStatement(update_sql);
 
              update_st.setString(1, result.get("code"));
              update_st.setString(2, result.get("error_reason"));
              update_st.setInt(3, event_id);
              update_st.executeUpdate();
            }

            Thread.sleep(5000);
          } catch (SQLException sqex) {
            System.out.println("SQLException: " + sqex.getMessage());
            System.out.println("SQLState: " + sqex.getSQLState());
          } catch (java.lang.InterruptedException e){
            System.out.println(e);
          }
       
      }     
    }

    private HashMap<String, String> sendSms(String phone_no, String sms_message){
      HashMap<String, String> result = new HashMap<String, String>();

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

            result.put("code", "SENT");
            result.put("error_reason", "Success");
        } catch(Exception e) {
          result.put("code", "FAIL");
          result.put("error_reason", "어쩌구저쩌구");
        }

        return result;
    }	
}
