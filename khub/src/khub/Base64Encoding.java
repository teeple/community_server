
import sun.misc.BASE64Encoder;
import java.io.*;

public class Base64Encoding {
	public static String encode(byte[] encodeBytes) {
		if (encodeBytes != null && !encodeBytes.equals("")) {

			byte[] buf = null;
			String strResult = null;

			BASE64Encoder base64Encoder = new BASE64Encoder();
			ByteArrayInputStream bin = new ByteArrayInputStream(encodeBytes);
			ByteArrayOutputStream bout = new ByteArrayOutputStream();

			try {
				base64Encoder.encodeBuffer(bin, bout);
			} catch (Exception e) {
				e.printStackTrace();
			}
			buf = bout.toByteArray();
			strResult = new String(buf).trim();

			return strResult;
		} else {
			return "";
		}
	}
}
