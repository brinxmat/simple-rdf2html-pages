package no.ntnu.ub.rgreenall.simple_rdf2html_pages;

import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;

// TODO: Auto-generated Javadoc
/**
 * Class PreferenceHandler takes care of preferences.
 *
 * @author rurikgreenall
 */
public class PreferenceHandler {
	
	/** The properties. */
	private Configuration properties = null;
	
	/**
	 * Default constructor.
	 */
	public PreferenceHandler () {}
	
	/**
	 * getProperties method retrieves the properties file from the classpath.
	 *
	 * @return the properties
	 * @throws ConfigurationException the configuration exception
	 */
	private void getProperties () throws ConfigurationException {
		properties = new PropertiesConfiguration("config.properties");
	
	}
	
	/**
	 * Gets the base URI.
	 *
	 * @return the base uri
	 * @throws ConfigurationException the configuration exception
	 */
	public String getBaseURI () throws ConfigurationException {
		if (properties == null) {
			getProperties();
		}
		String uri = properties.getProperty("baseuri").toString();
		
		return uri;
	}
	
	/**
	 * Gets the search uri.
	 *
	 * @return the search uri
	 * @throws ConfigurationException the configuration exception
	 */
	public String getSearchURI() throws ConfigurationException {

		if (properties == null) {
			getProperties();
		}
		String uri = properties.getProperty("searchuri").toString();
		
		return uri;
	}

	/**
	 * Gets the basic query string.
	 *
	 * @return the basic query string
	 * @throws ConfigurationException the configuration exception
	 */
	public String getBasicQueryString() throws ConfigurationException {

		if (properties == null) {
			getProperties();
		}
		String uri = properties.getProperty("basicquery").toString();
		
		return uri;
	}

	
	/**
	 * Gets the SPARQL endpoint.
	 *
	 * @return the SPARQL endpoint
	 * @throws ConfigurationException the configuration exception
	 */
	public String getSPARQLEndpoint() throws ConfigurationException {
		if (properties == null) {
			getProperties();
		}
		String uri = properties.getProperty("sparqlendpoint").toString();
		
		return uri;
	}
	
	/**
	 * Gets the query construct.
	 *
	 * @return the query construct
	 * @throws ConfigurationException the configuration exception
	 */
	public String getQueryConstruct() throws ConfigurationException {
		
		if (properties == null) {
			getProperties();
		}
		
		String resource = properties.getProperty("query.construct").toString();

		return resource;
	}
	
	/**
	 * Gets the hit list size.
	 *
	 * @return the hit list size
	 * @throws ConfigurationException the configuration exception
	 */
	public int getHitListSize() throws ConfigurationException {
		
		if (properties == null) {
			getProperties();
		}
		
		int size = Integer.parseInt(properties.getProperty("query.hitListSize").toString());

		return size;
	}

	/**
	 * Gets the query describe.
	 *
	 * @return the query describe
	 * @throws ConfigurationException the configuration exception
	 */
	public String getQueryDescribe() throws ConfigurationException {
		
		if (properties == null) {
			getProperties();
		}
		String resource = properties.getProperty("query.describe").toString();

		return resource;
	}

	/**
	 * Gets the person query construct.
	 *
	 * @return the person query construct
	 * @throws ConfigurationException the configuration exception
	 */
	public String getPersonQueryConstruct() throws ConfigurationException {
		
		if (properties == null) {
			getProperties();
		}
		
		String resource = properties.getProperty("query.personConstruct").toString();

		return resource;	}

}
