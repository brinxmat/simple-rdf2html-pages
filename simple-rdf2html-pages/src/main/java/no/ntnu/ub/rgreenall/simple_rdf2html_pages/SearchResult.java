package no.ntnu.ub.rgreenall.simple_rdf2html_pages;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

	/**
	 * SearchResult — a class to handle search results
	 * @author rurikgreenall
	 *
	 */

	public class SearchResult {
		
		public String documentName;
		public String documentDate;
		public String documentId;
		public List<String> documentAuthors;
		
		/**
		 * Default constructor method
		 */
		public SearchResult() {
	
		}
		/**
		 * Overloaded constructor method
		 *  
		 * @param documentName
		 * @param documentDate
		 * @param documentId
		 * @param documentAuthors
		 */
		public SearchResult (String documentName,String documentDate,String documentId, List<String> documentAuthors) {
			this.documentName = documentName;
			this.documentDate = documentDate;
			this.documentId = documentId;
			this.documentAuthors = documentAuthors;
		}
		
		/**
		 * Setters for document properties
		 * @param documentName
		 */
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
		
		/**
		 * get Document data method to create a Map of the input data
		 * @return Map<String,String>
		 */
		
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