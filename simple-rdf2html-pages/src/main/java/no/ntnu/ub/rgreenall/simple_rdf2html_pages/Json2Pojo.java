package no.ntnu.ub.rgreenall.simple_rdf2html_pages;

import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;

public class Json2Pojo {
	
	public String data;
	public Map<String,Object> rawdata;
	
	public Json2Pojo () { }
	
	public Json2Pojo (String data) {
		this.data = data;
	}

	public void setPojo(String data) {
		this.data = data;
	}
	
	
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
