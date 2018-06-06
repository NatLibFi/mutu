/*
 * Copyright 2018 University Of Helsinki (The National Library Of Finland)
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 *   
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package fi.nationallibrary.mutu;

/**
 * MutuQuery Object
 * 
 * MutuQuery represents a single SPARQL-query. <BR>
 * Mutu loads all SPARQL queries from XML configuration to MutuQuery objects and
 * stores them in an ArrayList.
 *
 */
public class MutuQuery {

	/**
	 * SPARQL query string.
	 */
	private String query;
	/**
	 * description of SPARQL query.
	 */
	private String decription;

	/**
	 * Constructs a new MutuQuery object.
	 * 
	 * @param query
	 *            SPARQL query.
	 * @param description
	 *            description of SPARQL query.
	 */
	public MutuQuery(String query, String description) {
		setQuery(query);
		setDescription(description);
	}

	/**
	 * Sets the SPARQL query string.
	 * 
	 * @param query
	 *            SPARQL query string.
	 */
	public void setQuery(String query) {
		this.query = query;
	}

	/**
	 * Returns the SPARQL query string.
	 * 
	 * @return the SPARQL query.
	 */
	public String getQuery() {
		return query;
	}

	/**
	 * Sets the SPARQL query description.
	 * 
	 * @param decription the SPARQL query description.
	 */
	public void setDescription(String decription) {
		this.decription = decription;
	}

	/**
	 * Returns the SPARQL query description.
	 * 
	 * @return the SPARQL query description.
	 */
	public String getDescription() {
		return decription;
	}

}
