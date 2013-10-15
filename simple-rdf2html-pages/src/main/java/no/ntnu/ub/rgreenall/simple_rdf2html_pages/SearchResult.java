package no.ntnu.ub.rgreenall.simple_rdf2html_pages;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


	public class SearchResult {
		
		public String documentName;
		public String documentDate;
		public String documentId;
		public List<String> documentAuthors;

	//Constructor
		public SearchResult() {
	
		}
	
		public SearchResult (String documentName,String documentDate,String documentId, List<String> documentAuthors) {
			this.documentName = documentName;
			this.documentDate = documentDate;
			this.documentId = documentId;
			this.documentAuthors = documentAuthors;
		}
		
		public void setDocumentName(String documentName) {
			this.documentName = documentName;
		}
		public void setDocumentDate(String documentDate) {
			this.documentDate = documentDate;
		}
		public void setDocumentId(String documentId) {
			this.documentId = documentId;
		}
		public void setDocumentAuthors(List<String> documentAuthors) {
			this.documentAuthors = documentAuthors;
		}
		
		public Map<String,String> getDocumentData() {
			
			Map <String,String> data = new HashMap <String,String>();
			
			data.put("name",this.documentName);
			data.put("id",this.documentId);
			data.put("date",this.documentDate);
			
			AuthorList creators = new AuthorList(this.documentAuthors);
			data.put("creators",creators.getAuthorList());
			
			return data;
			
		}
	}