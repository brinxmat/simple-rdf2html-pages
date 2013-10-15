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

import org.json.JSONObject;

public class RDFTools {
	
	public static String identifier;

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
	
	public static HashMap<String, String> getSchema(String identifier) throws ConfigurationException {

		PreferenceHandler prefs = new PreferenceHandler();
		String query = prefs.getQueryConstruct().replace("{ID}", identifier);
		HashMap<String, String> resource = new HashMap<String, String>();
		resource.put("identifier", identifier);

		Model resultModel = getRDF(query);
		
		
  	  	if (resultModel.isEmpty()) {System.out.println("Query returned no data");}

  	  	StmtIterator iter = resultModel.listStatements();
  	  	try {
            while ( iter.hasNext() ) {
                Statement stmt = iter.next();
                Resource p = stmt.getPredicate();
                RDFNode o = stmt.getObject();
                resource.put(p.toString(), o.toString());
            }
    	  } finally {
    		  if ( iter != null ) iter.close();
        }
		
  	  	return resource;
	}
	
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
	
	public static String serializer (Model model, String syntax) {
		
		StringWriter out = new StringWriter();
		model.write(out, syntax);
		String result = out.toString();
		
		return result;
	}
	
	public static String getRDFXML (String identifier) throws ConfigurationException {
				
		Model resultModel = describeNamedResource(identifier);
	      
	    return serializer(resultModel,"RDF/XML-ABBREV");
	}
	
	public static String getJSON(String identifier) throws ConfigurationException {
		
		JSONObject json = new JSONObject(getSchema(identifier));
		
		 return json.toString();
	}

	
}
