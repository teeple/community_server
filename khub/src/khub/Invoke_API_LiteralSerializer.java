// !DO NOT EDIT THIS FILE!
// This source file is generated by Oracle tools
// Contents may be subject to change
// For reporting problems, use the following
// Version = Oracle WebServices (10.1.3.0.0, build beta1)

import oracle.j2ee.ws.common.encoding.*;
import oracle.j2ee.ws.common.encoding.literal.*;
import oracle.j2ee.ws.common.encoding.literal.DetailFragmentDeserializer;
import oracle.j2ee.ws.common.encoding.simpletype.*;
import oracle.j2ee.ws.common.soap.SOAPEncodingConstants;
import oracle.j2ee.ws.common.soap.SOAPEnvelopeConstants;
import oracle.j2ee.ws.common.soap.SOAPVersion;
import oracle.j2ee.ws.common.streaming.*;
import oracle.j2ee.ws.common.wsdl.document.schema.SchemaConstants;
import javax.xml.namespace.QName;
import java.util.List;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class Invoke_API_LiteralSerializer extends LiteralObjectSerializerBase implements Initializable {
    private static final QName ns1_String_1_QNAME = new QName("", "String_1");
    private static final QName ns2_string_TYPE_QNAME = SchemaConstants.QNAME_TYPE_STRING;
    private CombinedSerializer myns2_string__java_lang_String_String_Serializer;
    private static final QName ns1_String_2_QNAME = new QName("", "String_2");
    private static final QName ns1_WsParamSet_3_QNAME = new QName("", "WsParamSet_3");
    private static final QName ns3_WsParamSet_TYPE_QNAME = new QName("http://ws.oi.khub.ktf.com/", "WsParamSet");
    private CombinedSerializer myWsParamSet_LiteralSerializer;
    
    public Invoke_API_LiteralSerializer(QName type) {
        this(type,  false);
    }
    
    public Invoke_API_LiteralSerializer(QName type, boolean encodeType) {
        super(type, true, encodeType);
    }
    
    public void initialize(InternalTypeMappingRegistry registry) throws Exception {
        myns2_string__java_lang_String_String_Serializer = (CombinedSerializer)registry.getSerializer("", java.lang.String.class, ns2_string_TYPE_QNAME);
        myWsParamSet_LiteralSerializer = (CombinedSerializer)registry.getSerializer("", WsParamSet.class, ns3_WsParamSet_TYPE_QNAME);
    }
    
    public java.lang.Object doDeserialize(XMLReader reader,
        SOAPDeserializationContext context) throws Exception {
        Invoke_API instance = new Invoke_API();
        java.lang.Object member=null;
        QName elementName;
        List values;
        java.lang.Object value;
        
        reader.nextElementContent();
        elementName = reader.getName();
        if (reader.getState() == XMLReader.START) {
            if (elementName.equals(ns1_String_1_QNAME)) {
                myns2_string__java_lang_String_String_Serializer.setNullable( true );
                member = myns2_string__java_lang_String_String_Serializer.deserialize(ns1_String_1_QNAME, reader, context);
                instance.setString_1((java.lang.String)member);
                reader.nextElementContent();
            } else {
                throw new DeserializationException("literal.unexpectedElementName", new java.lang.Object[] { ns1_String_1_QNAME, reader.getName() }, DeserializationException.FAULT_CODE_CLIENT);
            }
        }
        else {
            throw new DeserializationException("literal.expectedElementName", reader.getName().toString(), DeserializationException.FAULT_CODE_CLIENT );
        }
        elementName = reader.getName();
        if (reader.getState() == XMLReader.START) {
            if (elementName.equals(ns1_String_2_QNAME)) {
                myns2_string__java_lang_String_String_Serializer.setNullable( true );
                member = myns2_string__java_lang_String_String_Serializer.deserialize(ns1_String_2_QNAME, reader, context);
                instance.setString_2((java.lang.String)member);
                reader.nextElementContent();
            } else {
                throw new DeserializationException("literal.unexpectedElementName", new java.lang.Object[] { ns1_String_2_QNAME, reader.getName() }, DeserializationException.FAULT_CODE_CLIENT);
            }
        }
        else {
            throw new DeserializationException("literal.expectedElementName", reader.getName().toString(), DeserializationException.FAULT_CODE_CLIENT );
        }
        elementName = reader.getName();
        if (reader.getState() == XMLReader.START) {
            if (elementName.equals(ns1_WsParamSet_3_QNAME)) {
                myWsParamSet_LiteralSerializer.setNullable( true );
                member = myWsParamSet_LiteralSerializer.deserialize(ns1_WsParamSet_3_QNAME, reader, context);
                instance.setWsParamSet_3((WsParamSet)member);
                reader.nextElementContent();
            } else {
                throw new DeserializationException("literal.unexpectedElementName", new java.lang.Object[] { ns1_WsParamSet_3_QNAME, reader.getName() }, DeserializationException.FAULT_CODE_CLIENT);
            }
        }
        else {
            throw new DeserializationException("literal.expectedElementName", reader.getName().toString(), DeserializationException.FAULT_CODE_CLIENT );
        }
        
        if( reader.getState() != XMLReader.END)
        {
            reader.skipElement();
        }
        XMLReaderUtil.verifyReaderState(reader, XMLReader.END);
        return (java.lang.Object)instance;
    }
    
    public void doSerializeAttributes(java.lang.Object obj, XMLWriter writer, SOAPSerializationContext context) throws Exception {
        Invoke_API instance = (Invoke_API)obj;
        
    }
    public void doSerializeAnyAttributes(java.lang.Object obj, XMLWriter writer, SOAPSerializationContext context) throws Exception {
        Invoke_API instance = (Invoke_API)obj;
        
    }
    public void doSerialize(java.lang.Object obj, XMLWriter writer, SOAPSerializationContext context) throws Exception {
        Invoke_API instance = (Invoke_API)obj;
        
        myns2_string__java_lang_String_String_Serializer.setNullable( true );
        myns2_string__java_lang_String_String_Serializer.serialize(instance.getString_1(), ns1_String_1_QNAME, null, writer, context);
        myns2_string__java_lang_String_String_Serializer.setNullable( true );
        myns2_string__java_lang_String_String_Serializer.serialize(instance.getString_2(), ns1_String_2_QNAME, null, writer, context);
        myWsParamSet_LiteralSerializer.setNullable( true );
        myWsParamSet_LiteralSerializer.serialize(instance.getWsParamSet_3(), ns1_WsParamSet_3_QNAME, null, writer, context);
    }
}
