// !DO NOT EDIT THIS FILE!
// This source file is generated by Oracle tools
// Contents may be subject to change
// For reporting problems, use the following
// Version = Oracle WebServices (10.1.3.0.0, build beta1)


import oracle.j2ee.ws.common.streaming.*;
import oracle.j2ee.ws.common.encoding.*;
import oracle.j2ee.ws.common.soap.SOAPEncodingConstants;
import oracle.j2ee.ws.common.encoding.literal.*;
import oracle.j2ee.ws.common.soap.streaming.*;
import oracle.j2ee.ws.common.soap.message.*;
import oracle.j2ee.ws.common.soap.SOAPVersion;
import oracle.j2ee.ws.common.soap.SOAPEnvelopeConstants;
import oracle.j2ee.ws.common.wsdl.document.schema.SchemaConstants;
import oracle.j2ee.ws.common.util.exception.JAXRPCExceptionBase;
import javax.xml.namespace.QName;
import java.rmi.RemoteException;
import java.util.Iterator;
import java.lang.reflect.*;
import oracle.j2ee.ws.client.*;
import oracle.j2ee.ws.client.http.*;
import oracle.webservices.transport.*;
import oracle.webservices.*;
import javax.xml.rpc.handler.*;
import javax.xml.rpc.JAXRPCException;
import javax.xml.rpc.soap.SOAPFaultException;

public class IWebServicePortBinding_Stub
    extends oracle.j2ee.ws.client.StubBase
    implements IWebService {
    
    
    /*
     *  public constructor
     */
    public IWebServicePortBinding_Stub(HandlerChain handlerChain) {
        super(handlerChain);
        _setProperty(ENDPOINT_ADDRESS_PROPERTY, "http://221.148.247.162:80/khub/WebService");
        setSoapVersion(SOAPVersion.SOAP_11);
    }
    
    /*
     *  implementation of invoke_API
     */
    public WsParamSet invoke_API(java.lang.String string_1, java.lang.String string_2, WsParamSet wsParamSet_3)
        throws java.rmi.RemoteException {
        
        try {
            
            StreamingSenderState _state = _start(_handlerChain);
            if (_getProperty(ClientConstants.DIME_ENCODE_MESSAGES_WITH_ATTACHMENTS) != null) {
                _state.getMessageContext().getMessage().setProperty("DimeEncode",_getProperty(ClientConstants.DIME_ENCODE_MESSAGES_WITH_ATTACHMENTS));
            }
            
            InternalSOAPMessage _request = _state.getRequest();
            _request.setOperationCode(Invoke_API_OPCODE);
            _state.getMessageContext().setProperty("oracle.j2ee.ws.mgmt.interceptor.operation-qname",new QName("","Invoke_API"));
            
            Invoke_API _myInvoke_API = new Invoke_API();
            _myInvoke_API.setString_1(string_1);
            _myInvoke_API.setString_2(string_2);
            _myInvoke_API.setWsParamSet_3(wsParamSet_3);
            
            SOAPBlockInfo _bodyBlock = new SOAPBlockInfo(ns1_Invoke_API_Invoke_APIElement_QNAME);
            _bodyBlock.setValue(_myInvoke_API);
            _bodyBlock.setSerializer(myInvoke_API_LiteralSerializer);
            _request.setBody(_bodyBlock);
            
            _state.getMessageContext().setProperty("http.soap.action", "http://192.168.0.2/:Invoke_API");
            
            _send((String) _getProperty(ENDPOINT_ADDRESS_PROPERTY), _state);
            
            Invoke_APIResponse _result = null;
            Object _responseObj = _state.getResponse().getBody().getValue();
            if (_responseObj instanceof SOAPDeserializationState) {
                _result = (Invoke_APIResponse)((SOAPDeserializationState) _responseObj).getInstance();
            } else {
                _result = (Invoke_APIResponse)_responseObj;
            }
            
            return _result.getResult();
            
        } catch (RemoteException e) {
            // let this one through unchanged
            throw e;
        } catch (JAXRPCException e) {
            throw new RemoteException(e.getMessage(), e);
        } catch (Exception e) {
            if (e instanceof RuntimeException) {
                throw (RuntimeException)e;
            } else {
                throw new RemoteException(e.getMessage(), e);
            }
        }
    }
    
    
    /*
     *  this method deserializes the request/response structure in the body
     */
    protected void _readFirstBodyElement(XMLReader bodyReader, SOAPDeserializationContext deserializationContext, StreamingSenderState  state) throws Exception {
        int opcode = state.getRequest().getOperationCode();
        switch (opcode) {
            case Invoke_API_OPCODE:
                _deserialize_Invoke_API(bodyReader, deserializationContext, state);
                break;
            default:
                throw new SenderException("sender.response.unrecognizedOperation", Integer.toString(opcode));
        }
    }
    
    
    
    /*
     * This method deserializes the body of the Invoke_API operation.
     */
    private void _deserialize_Invoke_API(XMLReader bodyReader, SOAPDeserializationContext deserializationContext, StreamingSenderState state) throws Exception {
        Object myInvoke_APIResponseObj =
            myInvoke_APIResponse_LiteralSerializer.deserialize(ns1_Invoke_API_Invoke_APIResponseElement_QNAME,
                bodyReader, deserializationContext);
        
        SOAPBlockInfo bodyBlock = new SOAPBlockInfo(ns1_Invoke_API_Invoke_APIResponseElement_QNAME);
        bodyBlock.setValue(myInvoke_APIResponseObj);
        state.getResponse().setBody(bodyBlock);
    }
    
    
    
    
    public String _getEncodingStyle() {
        return SOAPEncodingConstants.getSOAPEncodingConstants(soapVersion).getURIEncoding();
    }
    
    public void _setEncodingStyle(String encodingStyle) {
        throw new UnsupportedOperationException("cannot set encoding style");
    }
    
    public ClientTransport getClientTransport() {
        return super._getTransport();
    }
    
    
    
    
    
    /*
     * This method returns an array containing (prefix, nsURI) pairs.
     */
    protected String[] _getNamespaceDeclarations() {
        return myNamespace_declarations;
    }
    
    /*
     * This method returns an array containing the names of the headers we understand.
     */
    public QName[] _getUnderstoodHeaders() {
        return understoodHeaderNames;
    }
    
    /*
     * This method handles the case of an empty SOAP body.
     */
    protected void _handleEmptyBody(XMLReader reader, SOAPDeserializationContext deserializationContext, StreamingSenderState state) throws Exception {
    }
    
    public void _initialize(InternalTypeMappingRegistry registry) throws Exception {
        super._initialize(registry);
        myInvoke_APIResponse_LiteralSerializer = (CombinedSerializer)registry.getSerializer("", Invoke_APIResponse.class, ns1_Invoke_APIResponse_TYPE_QNAME);
        myInvoke_API_LiteralSerializer = (CombinedSerializer)registry.getSerializer("", Invoke_API.class, ns1_Invoke_API_TYPE_QNAME);
    }
    
    private static final QName _portName = new QName("http://192.168.0.2/", "IWebServicePort");
    private static final int Invoke_API_OPCODE = 0;
    private static final QName ns1_Invoke_API_Invoke_APIElement_QNAME = new QName("http://ws.oi.khub.ktf.com/", "Invoke_APIElement");
    private static final QName ns1_Invoke_API_TYPE_QNAME = new QName("http://ws.oi.khub.ktf.com/", "Invoke_API");
    private CombinedSerializer myInvoke_API_LiteralSerializer;
    private static final QName ns1_Invoke_API_Invoke_APIResponseElement_QNAME = new QName("http://ws.oi.khub.ktf.com/", "Invoke_APIResponseElement");
    private static final QName ns1_Invoke_APIResponse_TYPE_QNAME = new QName("http://ws.oi.khub.ktf.com/", "Invoke_APIResponse");
    private CombinedSerializer myInvoke_APIResponse_LiteralSerializer;
    private static final String[] myNamespace_declarations =
                                        new String[] {
                                            "ns0", "http://ws.oi.khub.ktf.com/"
                                        };
    
    private static final QName[] understoodHeaderNames = new QName[] {  };
}
