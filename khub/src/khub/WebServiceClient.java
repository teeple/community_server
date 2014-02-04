
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
            
            st.close();
            rs.close();
            // Thread.sleep(5000);
          } catch (SQLException sqex) {
            System.out.println("SQLException: " + sqex.getMessage());
            System.out.println("SQLState: " + sqex.getSQLState());
          // } catch (java.lang.InterruptedException el){
          //   System.out.println(el);
          } catch(Exception e) {
            System.out.println(e);
            
          }
        }     
    }

    private HashMap<String, String> sendSms(String phone_no, String sms_message){
      HashMap<String, String> result = new HashMap<String, String>();

      /*-------------------------------------------------------------------------*/
      WsParamSet wps = new WsParamSet();

      WsParam[] params = new WsParam[8];

      params[0] = new WsParam();                // SMS요청타입  
      params[0].setName("MSG_TYPE");
      params[0].setValue("S001");
      params[1] = new WsParam();                // 회신전화번호  
      params[1].setName("CALLBACK_CTN");
      params[1].setValue("01030102602");
      params[2] = new WsParam();                // 전송 메시지 
      params[2].setName("MSG_CONTENT");
      params[2].setValue(sms_message);
      params[3] = new WsParam();                // 플랫폼별 구분 
      params[3].setName("PFORM_TYPE");
      params[3].setValue("1");
      params[4] = new WsParam();                // 유무선 구분 
      params[4].setName("SERVICE_TYPE");
      params[4].setValue("A");
      params[5] = new WsParam();                // 발신자 폰번호 
      params[5].setName("CALL_CTN");
      params[5].setValue("01030102602");
      params[6] = new WsParam();                // 수신자 폰번호 
      params[6].setName("RCV_CTN");
      params[6].setValue(phone_no);
      params[7] = new WsParam();    
      params[7].setName("PREPAID");
      params[7].setValue("0");
      wps.setParam(params);

      // BizTemplate 인증키 셋팅
      String authKey = "S8D0EF28CBC9060E"; // 상용 인증키 
         
      // BizTemplate ID 셋팅
      String templateID = "MESG_MTSMSOPE"; // 20213895803556940001
      // String templateID = "AUTH_HIDETEST1"; // 20213895803323500001
      // String templateID = "MESG_MTMMSRPTNNC"; //20213895803079280001
        
      // 표준 API URL 셋팅, 웹서비스 주소 변경시 serviceURL의 URL를 수정한다. 
      String serviceURL = "http://221.148.240.25/khub/WebService"; // 상용 서버 IP

      IWebServiceEndpoint iwse = null;
        try {
            // IWebServiceEndpoint 객체를 생성하여 ServiceURL를 셋팅한다
            iwse = new IWebServiceEndpoint();
            iwse.setEndpoint(serviceURL);

            System.out.println(wps);
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
