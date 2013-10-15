package no.ntnu.ub.rgreenall.simple_rdf2html_pages;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;


public class PreferenceHandler {
	
	private Configuration properties = null;

	private  void getProperties () throws ConfigurationException {
		properties = new PropertiesConfiguration("config.properties");
	
	}
	
	public static <T> List<T> castList(Class<? extends T> clazz, Collection<?> c) {
	    List<T> r = new ArrayList<T>(c.size());
	    for(Object o: c)
	      r.add(clazz.cast(o));
	    return r;
	}
	
	public List<String> getRESTList () throws ConfigurationException {
		if (properties == null) {
			getProperties();
		}
		
		List<String> rest = castList(String.class, properties.getList("availableRESTElements"));
		
		return rest;
	}

	public String getBaseURI () throws ConfigurationException {
		if (properties == null) {
			getProperties();
		}
		String uri = properties.getProperty("baseuri").toString();
		
		return uri;
	}

	public String getDataURI() throws ConfigurationException {

		if (properties == null) {
			getProperties();
		}
		String uri = properties.getProperty("datauri").toString();
		
		return uri;
	}
	
	public String getSearchURI() throws ConfigurationException {

		if (properties == null) {
			getProperties();
		}
		String uri = properties.getProperty("searchuri").toString();
		
		return uri;
	}

	public String getBasicQueryString() throws ConfigurationException {

		if (properties == null) {
			getProperties();
		}
		String uri = properties.getProperty("basicquery").toString();
		
		return uri;
	}

	
	public String getSPARQLEndpoint() throws ConfigurationException {
		if (properties == null) {
			getProperties();
		}
		String uri = properties.getProperty("sparqlendpoint").toString();
		
		return uri;
	}
	
	public String getQueryConstruct() throws ConfigurationException {
		
		if (properties == null) {
			getProperties();
		}
		
		String resource = properties.getProperty("query.construct").toString();

		return resource;
	}
	
	public int getHitListSize() throws ConfigurationException {
		
		if (properties == null) {
			getProperties();
		}
		
		int size = Integer.parseInt(properties.getProperty("query.hitListSize").toString());

		return size;
	}

	public String getQueryDescribe() throws ConfigurationException {
		
		if (properties == null) {
			getProperties();
		}
		String resource = properties.getProperty("query.describe").toString();

		return resource;
	}

}
