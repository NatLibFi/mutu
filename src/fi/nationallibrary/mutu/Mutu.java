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

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.commons.io.input.ReaderInputStream;
import org.apache.jena.ontology.OntModel;
import org.apache.jena.ontology.OntModelSpec;
import org.apache.jena.query.Dataset;
import org.apache.jena.query.DatasetFactory;
import org.apache.jena.query.Query;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryExecutionFactory;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.ResultSet;
import org.apache.jena.query.ResultSetFactory;
import org.apache.jena.query.ResultSetFormatter;
import org.apache.jena.query.ResultSetRewindable;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.sparql.resultset.ResultSetMem;
import org.apache.jena.util.FileManager;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/**
 * 
 * Mutu Object
 * 
 * <P>
 * Mutu is a tool for reporting changes between a new version upper YSO ontology
 * and an older YSO attached to a domain ontology.
 * <P>
 * Mutu can be run independently from a command line (use -help) or it can be
 * used by other Java programs.
 * <P>
 * Main principle of Mutu is to run a set of SPARQL queries defined in a
 * mutu-config.xml file. Configuration is loaded through loadConfig(*) methods.
 * loadConfig() method without arguments tries to load configuration file from
 * the execution directory and then form the root of the jar file. Custom
 * configurations can also be provided directly using loadConfig(*) methods.
 * <P>
 * Mutu Queries in the configuration document must all return exactly the same
 * SPARQL result format so the results can be appended together. This format
 * must also be understood by /resources/excel.xslt XSLT transformation file, to
 * produce the report in Excel 2003 XML format.
 * <P>
 * To work Mutu must be supplied with the domain ontology and attached YSO
 * ontology by using the addDomainOntology(*). Domain ontology can be separated
 * to multiple files and files are loaded by calling addDomainOntology multiple
 * times. A new vesion of the YSO ontology must also be provided and loaded
 * using addNewYsoOntology(*) methods.
 * <P>
 * After the configuration has been successfully loaded with the domain and YSO
 * ontologies, comparison can be run and the results returned by calling
 * getFormattedMutuResuts or getFormattedMutuResutsAsString. These method return
 * the comparison results in an Excel 2003 XML format.
 * <P>
 * Mutu uses Jena and thus depends on the same libraries directly or indirectly.
 * However, Java application that uses Mutu does not need to know anything about
 * Jena or ontologies.
 *
 */
public class Mutu {

	/**
	 * The OntModelSpec used when loading ontologies.
	 */
	private OntModelSpec mutuOntModelSpec = OntModelSpec.RDFS_MEM;
	/**
	 * Domain ontology
	 */
	private OntModel domainOntModel = null;
	/**
	 * New YSO ontology
	 */
	private OntModel newYsoOntModel = null;
	/**
	 * Language of labels in SPARQL queries, defaults to 'fi' for finnish
	 */
	private String langStr = "fi";
	/**
	 * URI for Skosmos installation of the domain ontology
	 */
	private String domainOntUriStr = "http://finto.fi/XXX/";
	/**
	 * URI for Skosmos installation of the new YSO ontology
	 */
	private String newYsoOntUriStr = "http://dev.finto.fi/ysoXXX/";
	/**
	 * List of SPARQL prefixes shared by all MutuQueries. Applied dynamically when
	 * executing SPARQL.
	 */
	private String commonSparqlPrefixStr;
	/**
	 * List of specific queries to run (1,4,5 - Used by the command line tool option
	 * -query).
	 */
	private ArrayList<Integer> queryRunList = null;
	/**
	 * List of all MutuQueries to be run by the Mutu-program. List is populated by
	 * the parseConfigDocument method.
	 */
	private ArrayList<MutuQuery> mutuQueryList = null;
	/**
	 * Help class for outputting debug, info and error messages.
	 */
	private MutuLogger logger = new MutuLogger();

	/**
	 * Entry point to the command line Mutu program.
	 * 
	 * @param args
	 *            command line arguments, use -help for more information.
	 */
	public static void main(String[] args) {
		// We don't need to log Jena messages, suppress warning
		org.apache.log4j.Logger.getRootLogger().setLevel(org.apache.log4j.Level.OFF);
		Mutu mutu = new Mutu();
		mutu.parseArguments(args);
		try {
			mutu.loadConfig();
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(1);
		}
		mutu.runMutuQueries();
		// mutu.writeOntologies();
		System.out.println("Finished");
	}

	/**
	 * Initialises the Mutu object.
	 */
	public Mutu() {

	}

	/**
	 * Loads the SPARQL queries from mutu-config.xml file. The configuration file is
	 * first searched from execution folder and then from the root of the jar file.
	 * 
	 * @throws Exception
	 *             if Mutu config can not be loaded or parsed properly.
	 */
	public void loadConfig() throws Exception {
		parseConfigDocument(getConfigDocument());

	}

	/**
	 * Loads the SPARQL queries from the given configuration Document.
	 * 
	 * @param configurationDocument
	 *            XML Document holding a Mutu configuration.
	 * @throws Exception
	 *             if Mutu config can not be loaded or parsed properly.
	 */
	public void loadConfig(Document configurationDocument) throws Exception {
		parseConfigDocument(configurationDocument);

	}

	/**
	 * Loads the SPARQL queries from the given configuration XML given as UTF-8
	 * encoded InputStream.
	 * 
	 * @param XMLconfigInputStream
	 *            XML Document holding a Mutu configuration.
	 * @throws Exception
	 *             if Mutu config can not be loaded or parsed properly
	 */
	public void loadConfig(InputStream XMLconfigInputStream) throws Exception {
		DocumentBuilder db;
		db = DocumentBuilderFactory.newInstance().newDocumentBuilder();
		InputSource is = new InputSource();
		is.setByteStream(XMLconfigInputStream);
		is.setEncoding("UTF-8");
		Document mutuConfigDocument;
		mutuConfigDocument = db.parse(is);
		parseConfigDocument(mutuConfigDocument);

	}

	/**
	 * Loads the SPARQL queries from the given configuration XML given as String.
	 * 
	 * @param XMLconfigString
	 *            XML Document holding a Mutu configuration.
	 * @throws Exception
	 *             if Mutu config can not be loaded or parsed properly
	 */
	public void loadConfig(String XMLconfigString) throws Exception {
		DocumentBuilder db;
		db = DocumentBuilderFactory.newInstance().newDocumentBuilder();
		InputSource is = new InputSource();
		is.setCharacterStream(new StringReader(XMLconfigString));
		Document mutuConfigDocument;
		mutuConfigDocument = db.parse(is);
		parseConfigDocument(mutuConfigDocument);

	}

	/**
	 * Finds the xml configuration document. File is first searched from current
	 * (run) directory and then from inside the jar file.
	 * 
	 * @return the configuration document
	 * @throws Exception
	 *             if the configuration document can not be parsed
	 */
	private Document getConfigDocument() throws Exception {
		// First search mutu-config.xml from run directory
		InputStream mutuConfigStream = null;
		File mutuConfigFile = new File("mutu-config.xml");
		if (mutuConfigFile.exists()) {
			mutuConfigStream = new FileInputStream(mutuConfigFile);
		} else {
			// Then search mutu-config.xml from root of a jar file
			mutuConfigStream = getClass().getResourceAsStream("/mutu-config.xml");
		}
		if (mutuConfigStream == null) {
			logger.error("Could not open mutu-config.xml from any location");
			System.exit(1);
		}
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		Document mutuConfigDoc = dBuilder.parse(mutuConfigStream);
		mutuConfigStream.close();
		return mutuConfigDoc;
	}

	/**
	 * Loads SPARQL-queries to 'mutuQueryList and' shared prefixes to
	 * 'commonSparqlPrefixStr' from a configuration Document. Reuse will clear
	 * rewrite existing configuration.
	 * 
	 * @param mutuConfigDocument
	 *            document holding the configuration
	 */
	private void parseConfigDocument(Document mutuConfigDocument) {

		this.mutuQueryList = new ArrayList<MutuQuery>();

		this.commonSparqlPrefixStr = mutuConfigDocument.getElementsByTagName("common-prefix-map").item(0)
				.getTextContent();
		if (this.commonSparqlPrefixStr == null)
			this.commonSparqlPrefixStr = "";

		NodeList queryNodeList = mutuConfigDocument.getElementsByTagName("query");

		// Build MutuQueryArrayList
		for (int iQuery = 0; iQuery < queryNodeList.getLength(); iQuery++) {
			Element queryElement = (Element) queryNodeList.item(iQuery);
			String sparqlStr = queryElement.getElementsByTagName("sparql").item(0).getTextContent();
			Element substitutionsElement = getFirstChildElementByName(mutuConfigDocument.getDocumentElement(),
					"substitutions");

			// Do search and replace tasks from config document
			if (substitutionsElement != null) {
				NodeList taskNodeList = substitutionsElement.getElementsByTagName("task");
				for (int iTask = 0; iTask < taskNodeList.getLength(); iTask++) {
					Element taskElement = (Element) taskNodeList.item(iTask);
					Element searchElement = getFirstChildElementByName(taskElement, "search");
					String searchStr = (searchElement != null) ? searchElement.getTextContent() : null;
					String replaceStr;
					// Override default label language in queries
					if (searchStr.equals("*lang*")) {
						replaceStr = this.langStr;
					} else {
						Element replaceElement = getFirstChildElementByName(taskElement, "replace");
						replaceStr = (replaceElement != null) ? replaceElement.getTextContent() : null;
					}
					if (searchStr != null || searchStr != "" || replaceStr != null || replaceStr != "")
						sparqlStr = sparqlStr.replace(searchStr, replaceStr);
				}
			}
			String descriptionStr = "";
			try {
				descriptionStr = queryElement.getElementsByTagName("description").item(0).getTextContent();
			} catch (Exception e) {
				// description is not mandatory
			}
			mutuQueryList.add(new MutuQuery(sparqlStr, descriptionStr));
		}
	}

	/**
	 * Returns the first child element with the specified name. An utility method
	 * for parsing the configuration document.
	 * 
	 * @param parentElement
	 *            the parent element.
	 * @param nameStr
	 *            the name of the child element to look for.
	 * @return the child element or null if not found.
	 */
	private Element getFirstChildElementByName(Element parentElement, String nameStr) {
		NodeList childNodeList = parentElement.getElementsByTagName(nameStr);
		if (childNodeList != null && childNodeList.getLength() > 0)
			return (Element) childNodeList.item(0);
		else
			return null;
	}

	/**
	 * Prints a list of available SPARQL queries and their descriptions to
	 * System.out. Used by command line tool.
	 */
	private void printOutMutuQueryList() {

		for (int i = 0; i < mutuQueryList.size(); i++) {
			MutuQuery mutuQuery = (MutuQuery) mutuQueryList.get(i);
			String descriptionStr = mutuQuery.getDescription();
			System.out.println("Query: " + (i + 1) + "\nDescription: " + descriptionStr + "\n");
		}
	}

	/**
	 * Runs Mutu queries and saves the results to a MUTU-results-excel.xml (Excel
	 * 2003 XML) file in the current directory.
	 */
	private void runMutuQueries() {

		ByteArrayOutputStream xsltOutputStream = getFormattedMutuResuts();
		writeByteArrayOutputStreamToFile("MUTU-results-excel.xml", xsltOutputStream);
	}

	/**
	 * Returns results of Mutu queries in Excel 2003 XML formatted output stream
	 * 
	 * @return mutu results in Excel 2003 XML formatted output stream
	 */
	public ByteArrayOutputStream getFormattedMutuResuts() {
		ResultSetRewindable allResults = runAllMutuQueries();
		InputStream xsltStyleInputStream = getClass().getResourceAsStream("/resources/excel.xslt");
		return transformResultSet(allResults, xsltStyleInputStream);
	}

	/**
	 * Returns results of Mutu queries in Excel 2003 XML (UTF-8) formatted String
	 * 
	 * @return mutu results in Excel 2003 XML formatted String
	 */
	public String getFormattedMutuResutsAsString() {
		try {
			return getFormattedMutuResuts().toString("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * Transforms Jena ResultSet using a CSS stylesheet. ResultSet is first
	 * transformed to standard SPARQL Query Results XML Format by Jena, after which
	 * the XSLT transformation is applied.
	 * 
	 * @param resultSet
	 *            ResultSet to be formatted
	 * @param styleInputStream
	 *            XSLT stylesheet for formatting
	 * @return XSLT formatted ResultSet
	 */
	private ByteArrayOutputStream transformResultSet(ResultSet resultSet, InputStream styleInputStream) {
		TransformerFactory tFactory = TransformerFactory.newInstance();
		ByteArrayOutputStream xsltOutputStream = new ByteArrayOutputStream();
		try {
			Transformer transformer = tFactory.newTransformer(new StreamSource(styleInputStream));
			transformer.setParameter("domainOntUri", domainOntUriStr);
			transformer.setParameter("newYsoOntUri", newYsoOntUriStr);
			ByteArrayOutputStream xmlResultSetOutputStream = resultSetToOutputStream("xml", resultSet);
			// InputStream xmlResultInputStream = new InputStream(new
			// StringReader(xmlResultOutputStream.toString("UTF-8")));
			transformer.transform(new StreamSource(new ByteArrayInputStream(xmlResultSetOutputStream.toByteArray())),
					new StreamResult(xsltOutputStream));
		} catch (TransformerConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return xsltOutputStream;
	}

	/**
	 * Runs all Mutu queries and returns results appended to a single (reusable)
	 * ResultSetRewindable object.
	 * 
	 * @return results of all Mutu queries
	 */
	private ResultSetRewindable runAllMutuQueries() {

		List<ResultSet> allResults = new ArrayList<ResultSet>();
		// First check if there is a specified list of queries to run
		if (this.queryRunList == null) {
			for (int i = 0; i < mutuQueryList.size(); i++) {
				ResultSetRewindable resultSet = runMutuQuery(i);
				if (logger.isDebugEnabled()) {
					writeResultSetToFile("csv", "debug-files/" + (i + 1) + "-queryResult.csv", resultSet);
					resultSet.reset();
				}
				allResults.add(resultSet);
			}
		} else { // No specified List - run all queries
			for (int i : queryRunList) {
				ResultSetRewindable resultSet = runMutuQuery(i);
				if (logger.isDebugEnabled()) {
					writeResultSetToFile("csv", "debug-files/" + (i + 1) + "-queryResult.csv", resultSet);
					resultSet.reset();
				}
				allResults.add(resultSet);
			}
		}
		if (logger.isDebugEnabled()) {
			writeResultSetToFile("csv", "debug-files/allQueryResults.csv",
					new ResultSetMem((ResultSet[]) allResults.toArray(new ResultSetMem[0])));
			writeResultSetToFile("xml", "debug-files/allQueryResults.xml",
					new ResultSetMem((ResultSet[]) allResults.toArray(new ResultSetMem[0])));
		}
		return new ResultSetMem((ResultSet[]) allResults.toArray(new ResultSetMem[0]));
	}

	/**
	 * Runs specified Mutu query and returns result (reusable) ResultSetRewindable
	 * object.
	 * 
	 * @param i
	 *            index number of the Mutu query to run (0 is first)
	 * @return results of query
	 */
	private ResultSetRewindable runMutuQuery(int i) {

		MutuQuery mutuQuery = (MutuQuery) mutuQueryList.get(i);
		String sparqlQueryStr = commonSparqlPrefixStr + mutuQuery.getQuery();
		logger.debug("Run SPARQL:\n" + sparqlQueryStr);
		long startTime = System.currentTimeMillis();
		ResultSetRewindable resultSet = runSparqlQuery(sparqlQueryStr);
		long duration = System.currentTimeMillis() - startTime;
		logger.debug("QUERY DURATION: " + String.format("%.2f", (float) (duration / 1000)) + "s");
		return resultSet;
	}

	/**
	 * Runs SPARQL query and returns result (reusable) ResultSetRewindable object.
	 * 
	 * @param sparqlQueryStr
	 *            the SPARQL query to run
	 * @return results of SPARQL query
	 */
	private ResultSetRewindable runSparqlQuery(String sparqlQueryStr) {
		Dataset queryDataSet = DatasetFactory.create(domainOntModel);
		queryDataSet.addNamedModel("newYso", newYsoOntModel);
		Query query = QueryFactory.create(sparqlQueryStr);
		try (QueryExecution qexec = QueryExecutionFactory.create(query, queryDataSet)) {
			ResultSet resultSet = qexec.execSelect();
			ResultSetRewindable resultSetRewindable = ResultSetFactory.copyResults(resultSet);
			return resultSetRewindable;
		}
	}

	/**
	 * Writes ResultSet to a file using specified format ('csv'/'xml'). Used for
	 * debugging.
	 * 
	 * @param outputFormat
	 *            the format of the output 'csv'/'xml'
	 * @param filePathStr
	 *            the path indicating where the file is saved
	 * @param resultSet
	 *            the ResultSet to be saved
	 */
	private void writeResultSetToFile(String outputFormat, String filePathStr, ResultSet resultSet) {
		ByteArrayOutputStream resultStream = resultSetToOutputStream(outputFormat, resultSet);
		writeByteArrayOutputStreamToFile(filePathStr, resultStream);
	}

	/**
	 * Writes ByteArrayOutputStream to a file.
	 * 
	 * @param filePathStr
	 *            the path indicating where the ByteArrayOutputStream is saved
	 * @param outputStream
	 *            the ByteArrayOutputStream to be saved
	 */
	private void writeByteArrayOutputStreamToFile(String filePathStr, ByteArrayOutputStream outputStream) {
		File outputFile = openFile(filePathStr);
		FileOutputStream fileOutputStream = null;
		try {
			fileOutputStream = new FileOutputStream(outputFile);
			outputStream.writeTo(fileOutputStream);
			logger.info("Wrote: " + outputFile.getAbsolutePath());
		} catch (IOException e) {
			logger.error("Error writing ResultSet to file: " + outputFile.getAbsolutePath());
			e.printStackTrace();
		}
		try {
			fileOutputStream.close();
		} catch (IOException e) {
			logger.error("Error in closing file: " + outputFile.getAbsolutePath());
			e.printStackTrace();
		}
		try {
			outputStream.close();
		} catch (IOException e) {
			logger.error("Error in closing file: " + outputFile.getAbsolutePath());
			e.printStackTrace();
		}
	}

	/**
	 * Creates a File object from a String
	 *
	 * @param filePathStr
	 *            the path of the file
	 * @return the File object
	 */
	private File openFile(String filePathStr) {
		File file = new File(filePathStr);
		try {
			if (file.getParentFile() != null)
				file.getParentFile().mkdirs();
			file.createNewFile();

		} catch (IOException e) {
			logger.error("Error trying to open file: " + file.getAbsolutePath());
		}
		return file;
	}

	/**
	 * Transforms a ResultSet to 'csv' or 'xml' formatted ByteArrayOutputStream
	 *
	 * @param outputFormatStr
	 *            the output format 'csv' or 'xml'
	 * @param resultSet
	 *            the ResultSet to be formatted
	 * @return the formatted ByteArrayOutputStream
	 */
	private ByteArrayOutputStream resultSetToOutputStream(String outputFormatStr, ResultSet resultSet) {
		ByteArrayOutputStream outStream = new ByteArrayOutputStream();
		if (outputFormatStr != null && outputFormatStr.equalsIgnoreCase("xml")) {
			ResultSetFormatter.outputAsXML(outStream, resultSet);
			return outStream;
		} else if (outputFormatStr.equalsIgnoreCase("csv")) {
			ResultSetFormatter.outputAsCSV(outStream, resultSet);
			return outStream;
		}
		return null;
	}

	/**
	 * Load a domain ontology from a String with specified format 'RDF/XML' or
	 * 'TURTLE'. Can be called multiple times to load an ontology that is divided to
	 * multiple files.
	 * 
	 * @param ontologyAsStr
	 *            the ontology
	 * @param lang
	 *            the format of the ontology, 'RDF/XML' or 'TURTLE'
	 */
	public void addDomainOntology(String ontologyAsStr, String lang) {
		addDomainOntology(new ReaderInputStream(new StringReader(ontologyAsStr), StandardCharsets.UTF_8), lang);
	}

	/**
	 * Load a domain ontology from a inputStream with specified format 'RDF/XML' or
	 * 'TURTLE'. Can be called multiple times to load an ontology that is divided to
	 * multiple files.
	 * 
	 * @param inputStream
	 *            the ontology
	 * @param lang
	 *            the format of the ontology, 'RDF/XML' or 'TURTLE'
	 */
	public void addDomainOntology(InputStream inputStream, String lang) {
		addDomainOntology(getOntologyModel(inputStream, lang));
	}

	/**
	 * Load a domain ontology. Can be called multiple times to load an ontology that
	 * is divided to multiple files.
	 * 
	 * @param ontModel
	 *            the ontology
	 */
	public void addDomainOntology(OntModel ontModel) {
		if (domainOntModel == null) {
			domainOntModel = ModelFactory.createOntologyModel(mutuOntModelSpec);
		}
		domainOntModel.add(ontModel);
	}

	/**
	 * Load the new YSO ontology from a String with specified format 'RDF/XML' or
	 * 'TURTLE'. Can be called multiple times to load an ontology that is divided to
	 * multiple files.
	 * 
	 * @param ontologyAsStr
	 *            the new YSO ontology
	 * @param lang
	 *            the format of the ontology, 'RDF/XML' or 'TURTLE'
	 */
	public void addNewYsoOntology(String ontologyAsStr, String lang) {
		addNewYsoOntology(new ReaderInputStream(new StringReader(ontologyAsStr), StandardCharsets.UTF_8), lang);
	}

	/**
	 * Load the new YSO ontology from a InputStream with specified format 'RDF/XML'
	 * or 'TURTLE'. Can be called multiple times to load an ontology that is divided
	 * to multiple files.
	 * 
	 * @param inputStream
	 *            the new YSO ontology
	 * @param lang
	 *            the format of the ontology, 'RDF/XML' or 'TURTLE'
	 */
	public void addNewYsoOntology(InputStream inputStream, String lang) {
		addNewYsoOntology(getOntologyModel(inputStream, lang));
	}

	/**
	 * Load a domain ontology. Can be called multiple times to load an ontology that
	 * is divided to multiple files.
	 * 
	 * @param ontModel
	 *            the new YSO ontology
	 */
	public void addNewYsoOntology(OntModel ontModel) {
		if (newYsoOntModel == null) {
			newYsoOntModel = ModelFactory.createOntologyModel(mutuOntModelSpec);
		}
		newYsoOntModel.add(ontModel);
	}

	/**
	 * Sets the language used for labels in SPARQL
	 * 
	 * @param langStr
	 *            language for labels in SPARQL
	 */
	public void setLang(String langStr) {
		this.langStr = langStr;
	}

	/**
	 * Sets the domain ontology URI for linking (ie. http://finto.fi/jupo/). Skosmos
	 * installation and domain ontology must exist in this URI for the links to
	 * work. Links are built using pattern:
	 * 'http://finto.fi/jupo/fi/page/?uri=http://www.yso.fi/onto/yso/p5296'
	 * 
	 * @param domainOntUriStr
	 *            URI for the domain ontology for linking
	 */
	public void setDomainOntUri(String domainOntUriStr) {
		this.domainOntUriStr = domainOntUriStr;
	}

	/**
	 * Sets the new YSO ontology URI for linking (ie.
	 * http://dev.finto.fi/ysocicero/). Skosmos installation and YSO ontology must
	 * exist in this URI for the links to work.
	 * 
	 * @param newYsoOntUriStr
	 *            URI for the YSO ontology for linking
	 */
	public void setNewYsoOntUri(String newYsoOntUriStr) {
		this.newYsoOntUriStr = newYsoOntUriStr;
	}

	/**
	 * Returns a OntModel from a file path. Format is TURTLE if file suffix is ttl
	 * or turtle, otherwise format is assumed RDF/XML
	 * 
	 * @param filePathStr
	 *            path to the ontology file
	 * @return the ontology as OntModel object
	 */
	private OntModel getOntologyModel(String filePathStr) {
		String lang = "RDF/XML";
		if (filePathStr.matches("(?i).*\\.(ttl|turtle)$"))
			lang = "TURTLE";
		logger.info("Read file: " + filePathStr + " using format: " + lang);
		InputStream in = FileManager.get().open(filePathStr);
		if (in == null) {
			logger.info("Could not open file: " + filePathStr);
			return null;
		}
		return getOntologyModel(in, lang);
	}

	/**
	 * Builds an OntModel object from an InputStream
	 * 
	 * @param inputStream
	 *            the ontology
	 * @param lang
	 *            the format of the InputStream 'RDF/XML' or 'TURTLE'
	 * @return the ontology
	 */
	private OntModel getOntologyModel(InputStream inputStream, String lang) {
		OntModel ontModel = ModelFactory.createOntologyModel(mutuOntModelSpec);
		ontModel.read(inputStream, null, lang);
		return ontModel;
	}

	/**
	 * Writes loaded ontologies to files in the current directory
	 * (specOnt.ttl/newYsoOnt.ttl). Used for debugging.
	 */
	private void writeOntologies() {

		if (domainOntModel != null) {
			try {
				File ontFile = new File("specOnt.ttl");
				domainOntModel.write(new FileOutputStream(ontFile), "TTL");
				logger.info("Wrote: " + ontFile.getAbsolutePath());
			} catch (FileNotFoundException e) {
				logger.error("Error saving special ontology");
				e.printStackTrace();
			}
		} else {
			logger.info("SpecOntModel is null");
		}
		if (newYsoOntModel != null) {
			try {
				File ontFile = new File("newYsoOnt.ttl");
				newYsoOntModel.write(new FileOutputStream(ontFile), "TTL");
				logger.info("Wrote: " + ontFile.getAbsolutePath());
			} catch (FileNotFoundException e) {
				logger.error("Error saving YSO ontology");
				e.printStackTrace();
			}
		} else {
			logger.info("newYsoOntModel is null");
		}
	}

	/**
	 * Parses the commandline arguments and runs Mutu accordingly
	 * 
	 * @param args
	 *            commandline arguments
	 */
	private void parseArguments(String[] args) {

		String[] domainOntStrArr, newYsoStrArr, querySelectStrArr;

		CommandLine cmd = null;
		Options allOptions = new Options();
		Options runOptions = new Options();
		Options helpOptions = new Options();
		CommandLineParser parser = new DefaultParser();

		Option domainOntOpt = Option.builder("domainOnt")
				.desc("List of domain ontology files that include older YSO (ttl|rdf)").hasArg() // arguments are
																									// required
				.hasArgs() // n of arguments is unlimited
				// .required() // option is required
				.build();
		runOptions.addOption(domainOntOpt);
		allOptions.addOption(domainOntOpt);

		Option newYsoOpt = Option.builder("newYso").desc("List of ontology files (ttl|rdf/xml) for new YSO").hasArg()
				.hasArgs()
				// .required()
				.build();
		runOptions.addOption(newYsoOpt);
		allOptions.addOption(newYsoOpt);

		Option domainOntUriOpt = Option.builder("domainOntUri")
				.desc("Skosmos URI for the domain ontology (i.e. http://finto.fi/jupo/). Used for linking.").hasArg()
				// .required()
				.build();
		runOptions.addOption(domainOntUriOpt);
		allOptions.addOption(domainOntUriOpt);

		Option newYsoOntUriOpt = Option.builder("newYsoUri")
				.desc("Skosmos URI for the new YSO ontology (i.e. http://dev.finto.fi/ysocicero/). Used for linking.").hasArg()
				// .required()
				.build();
		runOptions.addOption(newYsoOntUriOpt);
		allOptions.addOption(newYsoOntUriOpt);
		
		Option langOpt = Option.builder("lang").desc("Label language used for concepts").hasArg().build();
		runOptions.addOption(langOpt);
		allOptions.addOption(langOpt);

		Option querySelectorOpt = Option.builder("query").desc("List of specific queries to run, 1 is first").hasArg()
				.type(Number.class).build();
		runOptions.addOption(querySelectorOpt);
		allOptions.addOption(querySelectorOpt);

		Option listQueryOpt = Option.builder("list").desc("list available queries").build();
		helpOptions.addOption(listQueryOpt);
		allOptions.addOption(listQueryOpt);

		Option helpOpt = Option.builder("help").desc("Print this help message").build();
		helpOptions.addOption(helpOpt);
		allOptions.addOption(helpOpt);

		Option debugOpt = Option.builder("debug").desc("Enable debug messages").build();
		runOptions.addOption(debugOpt);
		allOptions.addOption(debugOpt);

		Option testOpt = Option.builder("test").desc("run simple mutu test").build();
		allOptions.addOption(testOpt);

		String header = "Reports changes between an older YSO ontology attached to domain ontology and a newer YSO. ";
		String footer = "File format is determined by suffix, .ttl and .turtle are interpeted as turtle. All other suffixes are considered as rdf/xml.";

		HelpFormatter formatter = new HelpFormatter();

		try {
			cmd = parser.parse(allOptions, args);
		} catch (ParseException exp) {
			logger.error("Unexpected exception: " + exp.getMessage() + "\n");
			formatter.printHelp("mutu", header, allOptions, footer, true);
			System.exit(1);
		}

		if (cmd.hasOption("debug")) {
			logger.setDebug(true);
		}

		if (cmd.hasOption("test")) {
			if (testMutu()) {
				System.out.println("Mutu test run is succesfull!");
				System.exit(0);
			} else {
				System.out.println("Mutu test run fails!");
				System.exit(-1);
			}
		}

		if (cmd.hasOption("list") || cmd.hasOption("help")) {
			if (cmd.hasOption("help")) {
				formatter.printHelp("mutu", header, allOptions, footer, true);
				System.exit(0);
			}
			if (cmd.hasOption("list")) {
				printOutMutuQueryList();
				System.exit(0);
			}
		}
		
		if (cmd.hasOption("domainOntUri")) {
			setDomainOntUri(cmd.getOptionValue("domainOntUri"));
		}else {
			System.out.println("\n!! domainOntUri is a required argument\n");
			formatter.printHelp("mutu", header, allOptions, footer, true);
			System.exit(-1);
		}
		
		if (cmd.hasOption("newYsoUri")) {
			setNewYsoOntUri(cmd.getOptionValue("newYsoUri"));
		}else {
			System.out.println("\n!! newYsoUri is a required argument\n");
			formatter.printHelp("mutu", header, allOptions, footer, true);
			System.exit(-1);
		}
		
		// Read files for the special ontology
		domainOntStrArr = cmd.getOptionValues("domainOnt");
		if (domainOntStrArr == null) {
			formatter.printHelp("mutu", header, allOptions, footer, true);
			System.exit(-1);
		}

		for (String specOntStr : domainOntStrArr) {
			OntModel newSpecOntModel = getOntologyModel(specOntStr);
			if (newSpecOntModel == null) {
				logger.error("Error reading file: " + specOntStr);
				System.exit(-1);
			}
			addDomainOntology(newSpecOntModel);
		}

		// Read files for the new YSO
		newYsoStrArr = cmd.getOptionValues("newYso");
		if (newYsoStrArr == null) {
			formatter.printHelp("mutu", header, allOptions, footer, true);
			System.exit(-1);
		}
		for (String newYsoStr : newYsoStrArr) {
			OntModel tmpNewYsoOntModel = getOntologyModel(newYsoStr);
			if (tmpNewYsoOntModel == null) {
				logger.error("Error reading file: " + newYsoStr);
				System.exit(-1);
			}
			addNewYsoOntology(tmpNewYsoOntModel);
		}

		if (cmd.hasOption("lang")) {
			setLang(cmd.getOptionValue("lang"));
		}

		if (cmd.hasOption("query")) {
			querySelectStrArr = cmd.getOptionValues("query");
			this.queryRunList = new ArrayList<Integer>();
			for (String queryNroStr : querySelectStrArr) {
				int queryInt = Integer.parseInt(queryNroStr);
				if (queryInt > mutuQueryList.size()) {
					System.out.println(
							"ERROR: Query number '" + queryInt + "'greater than the number of available queries");
					System.exit(-1);
				} else {
					System.out.println("Add query number: " + queryInt);
					this.queryRunList.add(queryInt - 1);
				}
			}
		}
	}

	/**
	 * Test the generic functioning of the Mutu program with a simple xml
	 * configuration and data. Returns true if test is successful. Is invoked in
	 * command line using -test switch. Can be used in ant-task for unit testing.
	 * 
	 * @return true if test was successful
	 */
	private boolean testMutu() {

		String genericOntologyStr = "@prefix dc:   <http://purl.org/dc/elements/1.1/> .\n"
				+ "@prefix test:     <http://example.org/book/> .\n" + "test:book1  dc:title  \"Book1 Title\" .";
		String namedOntologyStr = "@prefix dc:   <http://purl.org/dc/elements/1.1/> .\n"
				+ "@prefix test:     <http://example.org/book/> .\n" + "test:book2  dc:title  \"Book2 Title\" .";
		String mutuConfigStr = "<mutu-config>\r\n" + "<common-prefix-map>\r\n" + "<![CDATA[\r\n"
				+ "PREFIX dc:   <http://purl.org/dc/elements/1.1/>\r\n"
				+ "PREFIX test:     <http://example.org/book/>\r\n" + "]]>\r\n" + "</common-prefix-map>\r\n"
				+ "<substitutions>\r\n" + "<task>\r\n" + "<description>Sets the title property</description>\r\n"
				+ "<search>*title-property*</search>\r\n" + "<replace><![CDATA[dc:title]]></replace>\r\n"
				+ "</task>\r\n" + "</substitutions>\r\n" + "<query>\r\n" + "<description>Test query 1</description>\r\n"
				+ "<sparql><![CDATA[\r\n" + "SELECT ?book\r\n" + "WHERE {\r\n" + "{?book *title-property* ?name}\r\n"
				+ "UNION\r\n" + "{GRAPH ?namedOntology { ?book *title-property* ?name}}\r\n" + "}\r\n"
				+ "]]></sparql>\r\n" + "</query>\r\n" + "<query>\r\n" + "<description>Test query 2</description>\r\n"
				+ "<sparql><![CDATA[\r\n" + "SELECT ?book\r\n" + "WHERE {\r\n" + "{?book *title-property* ?name}\r\n"
				+ "UNION\r\n" + "{GRAPH ?namedOntology { ?book *title-property* ?name}}\r\n" + "}\r\n"
				+ "]]></sparql>\r\n" + "</query>\r\n" + "</mutu-config>";

		DocumentBuilder db;
		try {
			db = DocumentBuilderFactory.newInstance().newDocumentBuilder();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
			return false;
		}
		InputSource is = new InputSource();
		is.setCharacterStream(new StringReader(mutuConfigStr));
		Document mutuConfigTestDocument;
		try {
			mutuConfigTestDocument = db.parse(is);
		} catch (SAXException | IOException e) {
			e.printStackTrace();
			return false;
		}
		parseConfigDocument(mutuConfigTestDocument);
		addDomainOntology(genericOntologyStr, "TTL");
		addNewYsoOntology(namedOntologyStr, "TTL");
		ResultSetRewindable resSet = runAllMutuQueries();
		return (resSet.next().getResource("?book").toString().equals("http://example.org/book/book1")
				&& resSet.next().getResource("?book").toString().equals("http://example.org/book/book2")
				&& resSet.next().getResource("?book").toString().equals("http://example.org/book/book1")
				&& resSet.next().getResource("?book").toString().equals("http://example.org/book/book2"));
	}
}