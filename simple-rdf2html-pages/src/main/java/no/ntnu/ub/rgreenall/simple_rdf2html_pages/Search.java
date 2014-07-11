package no.ntnu.ub.rgreenall.simple_rdf2html_pages;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Map;

import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.lang.StringEscapeUtils;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.*;
import org.codehaus.jackson.map.ObjectMapper;
/**
 * Search class, provides basic search functionality
 * @author rurikgreenall
 *
 */

public class Search {
	/**
	 * Default constructor
	 */
	public Search () {}
	/**
	 * getSearchData method — retrieves data
	 * 
	 * @param q
	 * @param from
	 * @param size
	 * @return
	 * @throws IOException
	 * @throws ConfigurationException
	 */
	static String getSearchData (String q, int from, int size) throws IOException, ConfigurationException {

		PreferenceHandler prefs = new PreferenceHandler();
		String uri = prefs.getSearchURI();
		String query = prefs.getBasicQueryString();
		query = query.replace("{QUERYSTRING}",StringEscapeUtils.escapeJava(q));
		query = query.replace("{FROM}", Integer.toString(from));
		query = query.replace("{SIZE}", Integer.toString(size));

		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(uri);
		
		StringEntity data = new StringEntity(query);
		data.setContentType("application/json");
		httpPost.setEntity(data);

		CloseableHttpResponse response = httpclient.execute(httpPost);

		if (response.getStatusLine().getStatusCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
				+ response.getStatusLine().getStatusCode());
		}

        BufferedReader in = new BufferedReader(
        new InputStreamReader(response.getEntity().getContent()));
        
        String res = new String();
        String inputLine = new String();
        while ((inputLine = in.readLine()) != null)
        	res += inputLine;
        in.close();
        
        httpclient.close();
        

    return res;
	}
	
	/**
	 * getSearchDataObject creates a POJO of the retrieved data
	 * 
	 * @param q
	 * @param start
	 * @return
	 * @throws ConfigurationException
	 * @throws IOException
	 */
	public Map<Object,Object> getSearchDataObject (String q, int start) throws ConfigurationException, IOException {
		
		PreferenceHandler prefs = new PreferenceHandler();

		int size = prefs.getHitListSize();

		String rawdata = getSearchData(q,start,size);
		ObjectMapper mapper = new ObjectMapper();

//		@SuppressWarnings("unchecked")
		Map<Object,Object> list = mapper.readValue(rawdata, Map.class);
		list.put("query", q);
		list.put("from", start);
		list.put("size", size);
		
		return list;

	}
	
	
	
}
