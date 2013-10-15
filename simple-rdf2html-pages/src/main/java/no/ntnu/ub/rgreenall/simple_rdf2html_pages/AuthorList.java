package no.ntnu.ub.rgreenall.simple_rdf2html_pages;

import java.util.Iterator;
import java.util.List;

public class AuthorList {
	
	public String AuthorList;
	
	public AuthorList() {
		
	}
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
	
	public String getAuthorList() {
		return this.AuthorList;
	}

}
