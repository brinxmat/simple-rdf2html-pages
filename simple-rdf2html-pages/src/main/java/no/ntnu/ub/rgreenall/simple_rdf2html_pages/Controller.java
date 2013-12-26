package no.ntnu.ub.rgreenall.simple_rdf2html_pages;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;

import org.apache.commons.configuration.ConfigurationException;

import com.sun.jersey.api.view.Viewable;

/** Resource class hosted at the URI path "/"
 */
@Path("/")
public class Controller {
	
	
	/**
	 * get the front page
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
	 * Do a search and format and present the results
	 * @param query
	 * @param from
	 * @return
	 * @throws ConfigurationException
	 * @throws IOException
	 */
	@Path("search")
    @GET 
    @Produces("text/html")
    public Response doSearch(@QueryParam("query") String query,@QueryParam("from") int from) throws ConfigurationException, IOException {

		Map<Object,Object> list = new HashMap<Object,Object>();
		
		Search search = new Search();
		list = search.getSearchDataObject(query, from);


		return Response.ok(new Viewable("/search.jsp",list)).build();
    }
	

    
    /** 
     * provide the JSP with data
     * @return Response
     * @throws ConfigurationException 
     */
	@Path("{type}/{identifier}")
    @GET 
    @Produces("text/html;qs=2")
    public Response getHTML(@PathParam("type") String type, @PathParam("identifier") String identifier) throws ConfigurationException {

		String viewType =  new String("/" + type + ".jsp");
		
			
			
		return Response.ok(new Viewable(viewType,RDFTools.getSchema(identifier,type))).build();
    }

    /** 
     * provide the JSP with data
     * @return Response
     * @throws ConfigurationException 
     */
/*
	@Path("person/{identifier}")
    @GET 
    @Produces("text/html")
    public Response getPersonHTML(@PathParam("identifier") String identifier) throws ConfigurationException {

		String type = "person";

		return Response.ok(new Viewable("/person.jsp",RDFTools.getSchema(identifier,type))).build();
    }
*/
    /** 
     * provide the RDF data
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
     * provide the JSON data
     * @return Response
     * @throws ConfigurationException 
     */
	
	
	@Path("{type}/{identifier}")
    @GET 
    @Produces("application/json;qs=0.1")
    public String getJSON(@PathParam("type") String type, @PathParam("identifier") String identifier) throws ConfigurationException {
		String data = RDFTools.getJSON(identifier, type);

		return data;
    }

}