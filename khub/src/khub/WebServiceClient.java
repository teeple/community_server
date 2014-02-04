
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

      // while(true){
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
 
              // update_st.setString(1, result.get("code"));
              // update_st.setString(2, result.get("error_reason"));
              // update_st.setInt(3, event_id);
              // update_st.executeUpdate();
            }

            // Thread.sleep(5000);
          } catch (SQLException sqex) {
            System.out.println("SQLException: " + sqex.getMessage());
            System.out.println("SQLState: " + sqex.getSQLState());
          // } catch (java.lang.InterruptedException el){
          //   System.out.println(el);
          } catch(Exception e) {
            System.out.println(e);
            
          }
      // }     
    }

    private HashMap<String, String> sendSms(String phone_no, String sms_message){
      HashMap<String, String> result = new HashMap<String, String>();

      /*-------------------------------------------------------------------------*/
      WsParamSet wps = new WsParamSet();

      WsParam[] params = new WsParam[7];

      params[0] = new WsParam();                // SMS요청타입  
      params[0].setName("MSG_TYPE");
      params[0].setValue("S001");
      // params[1] = new WsParam();                // 회신전화번호  
      // params[1].setName("CALLBACK_CTN");
      // params[1].setValue("0162030061");
      // params[2] = new WsParam();                // 콜백 URL 주소  
      // params[2].setName("CALLBACK_URL");
      // params[2].setValue("http://www.show.co.kr");
      params[1] = new WsParam();                // 전송 메시지 
      params[1].setName("MSG_CONTENT");
      params[1].setValue("KHUB TB테스트");
      params[2] = new WsParam();                // 플랫폼별 구분 
      params[2].setName("PFORM_TYPE");
      params[2].setValue("1");
      params[3] = new WsParam();                // 유무선 구분 
      params[3].setName("SERVICE_TYPE");
      params[3].setValue("A");
      params[4] = new WsParam();                // 발신자 폰번호 
      params[4].setName("CALL_CTN");
      params[4].setValue("01062230149");
      params[5] = new WsParam();                // 수신자 폰번호 
      params[5].setName("RCV_CTN");
      params[5].setValue("01062230149");
      // params[8] = new WsParam();           f     // 과금URL 
      // params[8].setName("BILL_URL");
      // params[8].setValue("http://www.show.co.kr/sms50");
      // params[9] = new WsParam();                // 리포트 수신받을 CP측 서버정보 
      // params[9].setName("REPORT_URL");
      // params[9].setValue("http://111.111.111.111/report.asp");
      // params[10] = new WsParam();               // 수신자의 번호이동정보 
      // params[10].setName("RECEIVE_PHONE_RD");
      // params[10].setValue("");
      params[6] = new WsParam();    
      params[6].setName("PREPAID");
      params[6].setValue("0");
      // params[12] = new WsParam();               // 지연 전송 시간(예약전송시 참조)을 위한 필드 
      // params[12].setName("DEFER_T");
      // params[12].setValue("");
      // params[13] = new WsParam();               // 전송되는 Text 의 형식 (0~4) 
      // params[13].setName("ALPHA_IND");
      // params[13].setValue("");
      // params[14] = new WsParam();               // 전송헤더 
      // params[14].setName("UDHI");
      // params[14].setValue("");
      /*-------------------------------------------------------------------------*/

      wps.setParam(params);
      // BizTemplate 인증키 셋팅
      // String authKey = "TXXXXXXXXXXXX";
      // String authKey = "T8D0DC0AECDD0828";
      String authKey = "S8D0EF28CBC9060E";
         
      // BizTemplate ID 셋팅
      // String templateID = "AUTH_JOININFOWCDM";
      String templateID = "MESG_MTSMSOPE"; // 20213895803556940001
      // String templateID = "AUTH_HIDETEST1"; // 20213895803323500001
      // String templateID = "MESG_MTMMSRPTNNC"; //20213895803079280001
        
      // 표준 API URL 셋팅, 웹서비스 주소 변경시 serviceURL의 URL를 수정한다. 
      String serviceURL = "http://125.131.85.42:80/khub/WebService";

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
