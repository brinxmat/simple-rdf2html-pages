package no.ntnu.ub.rgreenall.simple_rdf2html_pages;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

	// TODO: Auto-generated Javadoc
/**
	 * SearchResult, a class to handle search results.
	 *
	 * @author rurikgreenall
	 */

	public class SearchResult {
		
		/** The document name. */
		public String documentName;
		
		/** The document date. */
		public String documentDate;
		
		/** The document id. */
		public String documentId;
		
		/** The document authors. */
		public List<String> documentAuthors;
		
		/**
		 * Default constructor method.
		 */
		public SearchResult() {
	
		}
		
		/**
		 * Overloaded constructor method
		 *  
		 *
		 * @param documentName the document name
		 * @param documentDate the document date
		 * @param documentId the document id
		 * @param documentAuthors the document authors
		 */
		public SearchResult (String documentName,String documentDate,String documentId, List<String> documentAuthors) {
			this.documentName = documentName;
			this.documentDate = documentDate;
			this.documentId = documentId;
			this.documentAuthors = documentAuthors;
		}
		
		/**
		 * Sets the document name.
		 *
		 * @param documentName the new document name
		 */
		public void setDocumentName(String documentName) {
			this.documentName = documentName;
		}
		
		/**
		 * Sets the document date.
		 *
		 * @param documentDate the new document date
		 */
		public void setDocumentDate(String documentDate) {
			this.documentDate = documentDate;
		}
		
		/**
		 * Sets the document id.
		 *
		 * @param documentId the new document id
		 */
		public void setDocumentId(String documentId) {
			this.documentId = documentId;
		}
		
		/**
		 * Sets the document authors.
		 *
		 * @param documentAuthors the new document authors
		 */
		public void setDocumentAuthors(List<String> documentAuthors) {
			this.documentAuthors = documentAuthors;
		}
		
		/**
		 * get Document data method to create a Map of the input data.
		 *
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