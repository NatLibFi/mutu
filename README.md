# Mutu

Mutu is a tool that reports changes between old YSO ontology attached
to a domain ontology and a newer YSO ontology. Mutu can used as a 
command line tool or directly by other Java programs. For inclusion
with other Java programs, see the JavaDoc.

Mutu command line tool creates a file named MUTU-results-excel.xml file
to the current run directory. MUTU-results-excel.xml is a Excel 2003 XML 
formatted spreadsheet file that can be opened using MS Excel or LibreOffice
Calc. Because of the .xml-suffix, the file must be opened using File->Open 
dialog. 

!! It is not possible just to rename the file to .xlsx, as Excel will
complain of a broken file.

Currently LibreOffice has a performance issue when opening large Mutu 
result files.

Help for interpreting MUTU-results-excel.xml can be found in the support
website of The National Library of Finland:
https://www.kiwi.fi/pages/viewpage.action?pageId=108761596
(In finnish language)

## Requirements

- Java 17

## Usage:

Download mutu.jar from this page or compile your self. 

Package is 
self contained and has all the necessary dependencies built in. 


```
    usage: mutu [-debug] [-domainOnt <arg>] [-domainOntUri <arg>] [-help]
           [-lang <arg>] [-list] [-newYso <arg>] [-newYsoUri <arg>] [-query
           <arg>] [-test]
    Reports changes between an older YSO ontology attached to domain ontology
    and a newer YSO.
     -debug                Enable debug messages
     -domainOnt <arg>      List of domain ontology files that include older
                           YSO (ttl|rdf)
     -domainOntUri <arg>   Skosmos URI for the domain ontology (i.e.
                           http://finto.fi/jupo/). Used for linking.
     -help                 Print this help message
     -lang <arg>           Label language used for concepts
     -list                 list available queries
     -newYso <arg>         List of ontology files (ttl|rdf/xml) for new YSO
     -newYsoUri <arg>      Skosmos URI for the new YSO ontology (i.e.
                           http://dev.finto.fi/ysocicero/). Used for linking.
     -query <arg>          List of specific queries to run, 1 is first
     -test                 run simple mutu test
    File format is determined by suffix, .ttl and .turtle are interpeted as
    turtle. All other suffixes are considered as rdf/xml.
```

Examples:

Print help:
```
java -jar mutu.jar -help 
```
Report YSO changes:
```
java -jar mutu.jar -domainOnt data/maotao.ttl data\yso-maotao.ttl -newYso data\ysoKehitys-Cicero-2019.rdf -domainOntUri http://finto.fi/maotao/ -newYsoUri http://dev.finto.fi/ysocicero/
```

## Compiling:

Download Mutu source code from this repository.

Mutu has been developed against Apache Jena 5.5.0 library and depends on
the same libraries. There are no dependencies outside of Jena 5.5.0.

Download Jena 5.5.0 from:
https://archive.apache.org/dist/jena/binaries/apache-jena-5.5.0.zip

Extract all Jena libraries to lib/ subfolder. 

Compile using Ant tool and ant-build.xml file. Default build target creates
mutu.jar file. Mutu is designed to be run from this self contained jar file
and does not work when directly run from source/class files.