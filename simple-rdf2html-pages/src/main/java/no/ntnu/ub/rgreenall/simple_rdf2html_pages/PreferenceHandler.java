package no.ntnu.ub.rgreenall.simple_rdf2html_pages;

import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;

/**
 * Class PreferenceHandler — takes care of preferences
 * @author rurikgreenall
 *
 */
public class PreferenceHandler {
	
	private Configuration properties = null;
	/**
	 * Default constructor
	 */
	public PreferenceHandler () {}
	
	/**
	 * getProperties method retrieves the properties file from the classpath
	 * @throws ConfigurationException
	 */
	private void getProperties () throws ConfigurationException {
		properties = new PropertiesConfiguration("config.properties");
	
	}
	
	/**
	 * getters for the various properties
	 * @return
	 * @throws ConfigurationException
	 */
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

	public String getPersonQueryConstruct() throws ConfigurationException {
		
		if (properties == null) {
			getProperties();
		}
		
		String resource = properties.getProperty("query.personConstruct").toString();

		return resource;	}

}
