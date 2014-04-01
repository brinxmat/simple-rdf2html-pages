package no.ntnu.ub.rgreenall.simple_rdf2html_pages;

import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;

/**
 * Json2Pojo, this class converts between JSON and POJOs
 * @author rurikgreenall
 *
 */
public class Json2Pojo {
	
	public String data;
	public Map<String,Object> rawdata;
	/**
	 * Default constructor
	 */
	public Json2Pojo () { }
	
	/**
	 * Overloaded constructor, takes a JSON string as an argument
	 * @param data
	 */
	public Json2Pojo (String data) {
		this.data = data;
	}
	
	/**
	 * Setter for String data
	 * @param data
	 */
	public void setPojo(String data) {
		this.data = data;
	}
	
	/**
	 * Method getPojo converts the JSON string to a POJO
	 * @return Map<String,String>
	 */
	public Map<String, String> getPojo() {
		
		Map<String,String> result = new HashMap<String,String>();
        ObjectMapper mapper = new ObjectMapper();
        
        try {
        	SearchResult s = mapper.readValue(this.data, SearchResult.class);
        	result = s.getDocumentData();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
		return result;

	}


}
