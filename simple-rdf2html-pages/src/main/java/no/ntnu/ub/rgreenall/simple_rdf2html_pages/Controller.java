package no.ntnu.ub.rgreenall.simple_rdf2html_pages;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;

import org.apache.commons.configuration.ConfigurationException;

import com.sun.jersey.api.view.Viewable;

// TODO: Auto-generated Javadoc
/** This class controls access to resources.
 */
@Path("/")
public class Controller {
	
	
	/**
	 *  The root resource class hosted at the URI path "/" AKA "get the front page".
	 * @return Response
	 */
	@Path("")
    @GET 
    @Produces("text/html")
    public Response getFrontPage() {
		HashMap<String,String> list = new HashMap<String,String>();
        return Response.ok(new Viewable("/index.jsp",list)).build();
    }
	
	/**
	 * Retrieve search results from indexer and put these into a JSP template.
	 *
	 * @param query the query
	 * @param from the from
	 * @return Response
	 * @throws ConfigurationException the configuration exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	@Path("search")
    @GET 
    @Produces("text/html;qs=2")
    public Response doSearch(@QueryParam("query") String query,@QueryParam("from") int from) throws ConfigurationException, IOException {

		Map<Object,Object> list = new HashMap<Object,Object>();
		
		Search search = new Search();
		list = search.getSearchDataObject(query, from);


		return Response.ok(new Viewable("/search.jsp",list)).build();
    }
	
	@Path("search")
    @GET 
    @Produces("application/json;qs=0.1")
    public String getSearchJSON(@QueryParam("query") String query,@QueryParam("from") int from) throws ConfigurationException, IOException {

		Map<Object,Object> map = new HashMap<Object,Object>();
		
		Search search = new Search();
		map = search.getSearchDataObject(query, from);


		return map.toString();
    }


	/**
	 * Gets the sitemap. In the current state this is a static file that must be generated, this is because we have wanted to push data out quickly and we assumed that the list of published manuscripts was fixed. This must be changed in the next revision.
	 *
	 * @return Response the sitemap
	 */
	@Path("sitemap")
    @GET 
    @Produces("application/xml")
    public Response getSitemap()  {

		return Response.ok(new Viewable("/sitemap.xml",null)).build();
    }

    
    /**
     *  
     * This method creates documents of different types by a Viewable with a JSP template, it takes two arguments "type", the document type, and "identifier", the identifier for the content that is to be displayed. 
     *
     * @param type the type
     * @param identifier the identifier
     * @return Response
     * @throws ConfigurationException the configuration exception
     */
	@Path("{type}/{identifier}")
    @GET 
    @Produces("text/html;qs=2")
    public Response getHTML(@PathParam("type") String type, @PathParam("identifier") String identifier) throws ConfigurationException {
		
		String viewType =  new String("/" + type + ".jsp");
		return Response.ok(new Viewable(viewType,RDFTools.getSchema(identifier,type))).build();
    }


    /** 
     * This method returns RDF/XML data, it takes two arguments "type", the document type, and "identifier", the identifier for the content that is to be displayed. 
     * @return Response
     * @throws ConfigurationException 
     */
	
	@Path("{type}/{identifier}")
    @GET 
    @Produces("application/rdf+xml;qs=0.7")
    public String getRDF(@PathParam("type") String type, @PathParam("identifier") String identifier) throws ConfigurationException {
    	String data = RDFTools.getRDFXML(identifier);

        return data;
    }

    /**
     *  
     * This method provides JSON data, it takes two arguments "type", the document type, and "identifier", the identifier for the content that is to be displayed. 
     *
     * @param type the type
     * @param identifier the identifier
     * @return Response
     * @throws ConfigurationException the configuration exception
     */
	
	
	@Path("{type}/{identifier}")
    @GET 
    @Produces("application/json;qs=0.1")
    public String getJSON(@PathParam("type") String type, @PathParam("identifier") String identifier) throws ConfigurationException {
		String data = RDFTools.getJSON(identifier, type);

		return data;
    }

}