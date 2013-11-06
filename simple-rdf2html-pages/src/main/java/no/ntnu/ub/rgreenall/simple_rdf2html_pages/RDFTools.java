package no.ntnu.ub.rgreenall.simple_rdf2html_pages;

import java.io.StringWriter;
import java.util.HashMap;

import org.apache.commons.configuration.ConfigurationException;

import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.RDFNode;
import com.hp.hpl.jena.rdf.model.Resource;
import com.hp.hpl.jena.rdf.model.Statement;
import com.hp.hpl.jena.rdf.model.StmtIterator;
import com.hp.hpl.jena.sparql.engine.http.QueryExceptionHTTP;
import org.apache.commons.collections.map.MultiValueMap;

import org.json.JSONObject;

/**
 * RDFTools class — provides basic RDF handling
 * @author rurikgreenall
 *
 */
public class RDFTools {
	
	/**
	 * Default constructor
	 */
	
	public RDFTools () {}
	
	public static String identifier;

	/**
	 * getRDF method — statically accessed to provide result of a sparql query
	 * @param query
	 * @return
	 * @throws ConfigurationException
	 */
	public static Model getRDF(String query) throws ConfigurationException {

		PreferenceHandler prefs = new PreferenceHandler();
		String service = prefs.getSPARQLEndpoint();
		Model resultModel = null;
		QueryExecution qe = QueryExecutionFactory.sparqlService(service, query);
		
	      try {
	    	  
	    	  resultModel = qe.execConstruct();
	    	  	    	  
	        } catch (QueryExceptionHTTP e) {
	            System.out.println(service + " is DOWN");
	        } finally {
	            qe.close();
	        }
	      
	      return resultModel;
	}
	
	/**
	 * getSchema method — maps RDF to HashMap<String,String>
	 * @param identifier
	 * @return
	 * @throws ConfigurationException
	 */
	public static HashMap<String, MultiValueMap> getSchema(String identifier,String type) throws ConfigurationException {

		PreferenceHandler prefs = new PreferenceHandler();
		HashMap<String, Object> resource = new HashMap<String, Object>();
		String baseuri = prefs.getBaseURI();
		
		String query = new String();
		
		if (type.equals("document")) {
			query = prefs.getQueryConstruct().replace("{ID}", identifier);
		}
		else if (type.equals("person")) {
			query = prefs.getPersonQueryConstruct().replace("{ID}", identifier);
			System.out.println(query);  
		}
		
		Model resultModel = getRDF(query);
		
		
  	  	if (resultModel.isEmpty()) {System.out.println("Query returned no data");}

  	  	StmtIterator iter = resultModel.listStatements();
  	  	
  	  	StmtIterator i2 = resultModel.listStatements();
  	  	
  	  	HashMap<String, MultiValueMap> myArray = new HashMap<String, MultiValueMap>();
 

  	  	while (i2.hasNext()) {
  	  		Statement state = i2.next();
  	  		
  	  		String subject = state.getSubject().toString();
  	  		String predicate = state.getPredicate().toString();
  	  		String object = state.getObject().toString();
  		
  	  		if (!myArray.containsKey(subject)) {
  	  			myArray.put(subject, new MultiValueMap());
  	  		}

  	  		myArray.get(subject).put(predicate, object);

   	  	}
  	  	
 
  	  	try {

            while ( iter.hasNext() ) {
            	
                Statement stmt = iter.next();
                
                Resource s = stmt.getSubject();
                Resource p = stmt.getPredicate();
                RDFNode o = stmt.getObject();

                
                HashMap<String,Object> inner = new HashMap<String,Object>();

                	if (o instanceof Resource) {

                    	inner.put(p.toString(), o.toString());
                    	resource.put(s.toString(),inner);

                	}
                	else {
                    	resource.put(p.toString(), o.toString());

                	}
                	
            }
    	  } finally {
    		  if ( iter != null ) iter.close();
        }
 	  	myArray.put("baseuri",new MultiValueMap());
  	  	myArray.get("baseuri").put("baseuri", baseuri);
  	  	myArray.put("identifier", new MultiValueMap());
  	  	myArray.get("identifier").put("identifier",identifier);
  	  	return myArray;
	}
	
	
	/**
	 * describeNamedResource method — provides a CBD for a resource via a sparql query
	 * 
	 * @param identifier
	 * @return
	 * @throws ConfigurationException
	 */
	public static  Model describeNamedResource (String identifier) throws ConfigurationException {
		PreferenceHandler prefs = new PreferenceHandler();
		String service = prefs.getSPARQLEndpoint();
		String query = prefs.getQueryDescribe().replace("{ID}", identifier);
		
		Model resultModel = null;
		QueryExecution qe = QueryExecutionFactory.sparqlService(service, query);
		
	      try {
	    	  
	    	  resultModel = qe.execDescribe();
	    	  	    	  
	        } catch (QueryExceptionHTTP e) {
	            System.out.println(service + " is DOWN");
	        } finally {
	            qe.close();
	        }
	      
	      return resultModel;
	}
	
	/**
	 * serializer method — returns given serialization of a Model as a string
	 * @param model
	 * @param syntax
	 * @return String
	 */
	public static String serializer (Model model, String syntax) {
		
		StringWriter out = new StringWriter();
		model.write(out, syntax);
		String result = out.toString();
		
		return result;
	}
	
	/**
	 * getRDFXML method — provides RDF/XML-ABBREV for a resource
	 * @param identifier
	 * @return
	 * @throws ConfigurationException
	 */
	public static String getRDFXML (String identifier) throws ConfigurationException {
				
		Model resultModel = describeNamedResource(identifier);
	      
	    return serializer(resultModel,"RDF/XML-ABBREV");
	}
	
	/**
	 * getJSON method — returns a simplified JSON string for a resource
	 * @param identifier
	 * @return String
	 * @throws ConfigurationException
	 */
	public static String getJSON(String identifier,String type) throws ConfigurationException {
		
		
		JSONObject json = new JSONObject(getSchema(identifier,type));
		
		 return json.toString();
	}

	
}
