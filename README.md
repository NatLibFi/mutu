# Mutu

Mutu is a tool that reports changes between old YSO ontology attached
to a domain ontology and a newer YSO ontology. Mutu can used as a 
command line tool or directly by other Java programs. For inclusion
with other Java programs, see the JavaDoc.

Command line tool saves MUTU-results-excel.xml file to the current
directory. MUTU-results-excel.xml is a Excel 2003 XML formatted
spreadsheet file that can be opened using MS Excel or LibreOffice Calc.
Because of the .xml-suffix, the file must be opened using File->Open 
dialog. It is not possible just to rename it to .xlsx, as Excel will
complain of a broken file.

   usage: mutu [-debug] [-domainOnt <arg>] [-help] [-list] [-newYso <arg>]
          [-query <arg>] [-test]
   Reports changes between an older YSO ontology attached to domain ontology
   and a newer YSO.
     -debug             Enable debug messages
     -domainOnt <arg>   List of domain ontology files that include older YSO
                        (ttl|rdf)
     -help              Print this help message
     -list              list avalable queries
     -newYso <arg>      List of ontology files (ttl|rdf/xml) for new YSO
     -query <arg>       List of specific queries to run, 1 is first
     -test              run simple mutu test
    File format is determined by suffix, .ttl and .turtle are interpreted as
    turtle. All other suffixes are considered as rdf/xml.

Examples:

Print help:
java -jar mutu.jar -help 

Report YSO changes:
java -jar mutu.jar -specOnt data/maotao.ttl data\yso-maotao.ttl -newYso data\ysoKehitys-2018-3-Boethius.rdf 