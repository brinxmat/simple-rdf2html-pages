package no.ntnu.ub.rgreenall.simple_rdf2html_pages;


import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import org.apache.commons.configuration.ConfigurationException;



public class Test {

	/**
	 * @param args
	 * @throws ConfigurationException 
	 * @throws IOException 
	 */
	public static void main(String[] args) throws ConfigurationException, IOException {
//		PreferenceHandler prefs = new PreferenceHandler();
//		String query = prefs.getQueryConstruct().replace("{ID}", "ntnu268");
//		String q = "PREFIX time: <http://www.w3.org/2006/time#> PREFIX dcterms: <http://purl.org/dc/terms/> PREFIX bibo: <http://purl.org/ontology/bibo/> PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> PREFIX nl: <http://www.ntnu.no/ub/data/nl#> PREFIX geonames: <http://sws.geonames.org/> PREFIX gunnbib: <http://ntnu.no/ub/data/gunnerus/doc/> PREFIX gunnbib-people: <http://ntnu.no/ub/data/gunnerus/people/> PREFIX lcsh: <http://id.loc.gov/authorities/> PREFIX ddc: <http://dewey.info/class/> PREFIX foaf: <http://xmlns.com/foaf/0.1/> PREFIX schema: <http://schema.org/>   construct { <http://ntnu.no/ub/data/gunnerus/doc/ntnu123> schema:title ?title ;   schema:creator ?creator ;   schema:dateCreated ?date ;   schema:about ?subject ;   schema:contentLocation \"Gunnerus Library\" ;   a ?type .  } WHERE {  <http://ntnu.no/ub/data/gunnerus/doc/ntnu123> a ?origType ;   dcterms:creator ?origCreator ;   dcterms:title ?title ;   dcterms:date ?origDate ;   dcterms:subject ?origSubject .  ?origCreator foaf:name ?creator .  OPTIONAL { ?origDate time:year ?d0 } OPTIONAL { ?origDate time:hasBeginning ?d1 ; time:hasEnd ?d2 }  BIND (   IF (    BOUND(?d0),str(?d0), IF(       BOUND(?d2),CONCAT(       str(?d1),CONCAT(\"\u2013\",str(?d2))),\"unknown\"      )   ) AS ?date)  BIND (IF(?origType=bibo:Book,schema:Book,schema:CreativeWork) AS ?type) .   }";
//		String q = "PREFIX time: <http://www.w3.org/2006/time#> SELECT * WHERE {?a ?v ?c}";
//		System.out.println(q);
//		System.out.println(RDFTools.getSchema("ntnu123"));
	
		Search s = new Search();
		Map<?,?> map = s.getSearchDataObject("brev",0);
		Iterator<?> it = map.entrySet().iterator();
		
		while (it.hasNext()) {
			System.out.println(it.next());
		}
	}
	

}
