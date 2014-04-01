package no.ntnu.ub.rgreenall.simple_rdf2html_pages;

import java.util.Iterator;
import java.util.List;

/**
 * AuthorList is a class to create a pretty string that lists authors, inserting commas and ampersands where necessary.
 *
 * @author rurikgreenall
 */
public class AuthorList {
	
	/** The Author list. */
	public String AuthorList;
	
	/**
	 * Default constructor method.
	 */
	
	public AuthorList() {
		
	}
	
	/**
	 * AuthorList method with List<String> arguments, returns a string containing a formatted author list.
	 *
	 * @param list the list
	 */
	
	public AuthorList(List<String> list) {
		
		String data = new String();
		
		Iterator<String> iterator = list.iterator();
		
		
		while (iterator.hasNext()){
			String sep = new String ();

			if (data.isEmpty()) {
				sep = "";
			} 
			else if (iterator.hasNext()) {
				sep = ", ";
			}
			else {
				sep = " & ";
			}
			
			data += iterator.next() + sep;
			
		}
		
		this.AuthorList = data;
	}
	
	/**
	 * getAuthorList a method to return the created author list (it may be empty).
	 *
	 * @return String
	 */
	public String getAuthorList() {
		return this.AuthorList;
	}

}
