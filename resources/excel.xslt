<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  version="1.0"
  xmlns:o="urn:schemas-microsoft-com:office:office"
  xmlns:x="urn:schemas-microsoft-com:office:excel"
  xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
  xmlns:html="http://www.w3.org/TR/REC-html40"
  xmlns:sparqlResults="http://www.w3.org/2005/sparql-results#">
  <xsl:output method="xml"/> 
  
  <xsl:param name="domainOntUri">http://finto.fi/xxx/</xsl:param>
  <xsl:param name="newYsoOntUri">http://dev.finto.fi/ysoXXX/</xsl:param>
 
<xsl:variable name="countRows" select="count(/sparqlResults:sparql/sparqlResults:results/sparqlResults:result)+1"/>
 
  <xsl:template match="/">
<xsl:processing-instruction name="mso-application">progid="Excel.Sheet"</xsl:processing-instruction> 
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Author>MUTU-tool</Author>
  <LastAuthor>MUTU-tool</LastAuthor>
  <Revision>1</Revision>
  <TotalTime>2</TotalTime>
  <Paragraphs>fi-FI</Paragraphs>
  <Version>16.00</Version>
 </DocumentProperties>
 <OfficeDocumentSettings xmlns="urn:schemas-microsoft-com:office:office">
  <AllowPNG/>
  <Colors>
   <Color>
    <Index>0</Index>
    <RGB>#800000</RGB>
   </Color>
   <Color>
    <Index>1</Index>
    <RGB>#006600</RGB>
   </Color>
   <Color>
    <Index>2</Index>
    <RGB>#000080</RGB>
   </Color>
   <Color>
    <Index>3</Index>
    <RGB>#996600</RGB>
   </Color>
   <Color>
    <Index>4</Index>
    <RGB>#800080</RGB>
   </Color>
   <Color>
    <Index>5</Index>
    <RGB>#008080</RGB>
   </Color>
   <Color>
    <Index>6</Index>
    <RGB>#C0C0C0</RGB>
   </Color>
   <Color>
    <Index>7</Index>
    <RGB>#808080</RGB>
   </Color>
   <Color>
    <Index>8</Index>
    <RGB>#9999FF</RGB>
   </Color>
   <Color>
    <Index>9</Index>
    <RGB>#993366</RGB>
   </Color>
   <Color>
    <Index>10</Index>
    <RGB>#FFFFCC</RGB>
   </Color>
   <Color>
    <Index>11</Index>
    <RGB>#CCFFFF</RGB>
   </Color>
   <Color>
    <Index>12</Index>
    <RGB>#660066</RGB>
   </Color>
   <Color>
    <Index>13</Index>
    <RGB>#FF8080</RGB>
   </Color>
   <Color>
    <Index>14</Index>
    <RGB>#0066CC</RGB>
   </Color>
   <Color>
    <Index>15</Index>
    <RGB>#DDDDDD</RGB>
   </Color>
   <Color>
    <Index>16</Index>
    <RGB>#000080</RGB>
   </Color>
   <Color>
    <Index>17</Index>
    <RGB>#FF00FF</RGB>
   </Color>
   <Color>
    <Index>18</Index>
    <RGB>#FFFF00</RGB>
   </Color>
   <Color>
    <Index>19</Index>
    <RGB>#00FFFF</RGB>
   </Color>
   <Color>
    <Index>20</Index>
    <RGB>#800080</RGB>
   </Color>
   <Color>
    <Index>21</Index>
    <RGB>#800000</RGB>
   </Color>
   <Color>
    <Index>22</Index>
    <RGB>#008080</RGB>
   </Color>
   <Color>
    <Index>23</Index>
    <RGB>#0000FF</RGB>
   </Color>
   <Color>
    <Index>24</Index>
    <RGB>#00CCFF</RGB>
   </Color>
   <Color>
    <Index>25</Index>
    <RGB>#CCFFFF</RGB>
   </Color>
   <Color>
    <Index>26</Index>
    <RGB>#CCFFCC</RGB>
   </Color>
   <Color>
    <Index>27</Index>
    <RGB>#FFFF99</RGB>
   </Color>
   <Color>
    <Index>28</Index>
    <RGB>#99CCFF</RGB>
   </Color>
   <Color>
    <Index>29</Index>
    <RGB>#FF99CC</RGB>
   </Color>
   <Color>
    <Index>30</Index>
    <RGB>#CC99FF</RGB>
   </Color>
   <Color>
    <Index>31</Index>
    <RGB>#FFCCCC</RGB>
   </Color>
   <Color>
    <Index>32</Index>
    <RGB>#3366FF</RGB>
   </Color>
   <Color>
    <Index>33</Index>
    <RGB>#33CCCC</RGB>
   </Color>
   <Color>
    <Index>34</Index>
    <RGB>#99CC00</RGB>
   </Color>
   <Color>
    <Index>35</Index>
    <RGB>#FFCC00</RGB>
   </Color>
   <Color>
    <Index>36</Index>
    <RGB>#FF9900</RGB>
   </Color>
   <Color>
    <Index>37</Index>
    <RGB>#FF6600</RGB>
   </Color>
   <Color>
    <Index>38</Index>
    <RGB>#666699</RGB>
   </Color>
   <Color>
    <Index>39</Index>
    <RGB>#969696</RGB>
   </Color>
   <Color>
    <Index>40</Index>
    <RGB>#003366</RGB>
   </Color>
   <Color>
    <Index>41</Index>
    <RGB>#339966</RGB>
   </Color>
   <Color>
    <Index>42</Index>
    <RGB>#003300</RGB>
   </Color>
   <Color>
    <Index>43</Index>
    <RGB>#333300</RGB>
   </Color>
   <Color>
    <Index>44</Index>
    <RGB>#993300</RGB>
   </Color>
   <Color>
    <Index>45</Index>
    <RGB>#993366</RGB>
   </Color>
   <Color>
    <Index>46</Index>
    <RGB>#333399</RGB>
   </Color>
   <Color>
    <Index>47</Index>
    <RGB>#333333</RGB>
   </Color>
  </Colors>
 </OfficeDocumentSettings>
 <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
  <WindowHeight>7230</WindowHeight>
  <WindowWidth>19200</WindowWidth>
  <WindowTopX>0</WindowTopX>
  <WindowTopY>0</WindowTopY>
  <TabRatio>500</TabRatio>
  <ProtectStructure>False</ProtectStructure>
  <ProtectWindows>False</ProtectWindows>
 </ExcelWorkbook>
 <Styles>
  <Style ss:ID="Default" ss:Name="Normal">
   <Alignment ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:FontName="Arial" x:Family="Swiss"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s63" ss:Name="Hyperlinkki">
   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#0000FF"
    ss:Underline="Single"/>
  </Style>
  <Style ss:ID="s62">
   <Alignment ss:Horizontal="Left" ss:Vertical="Top" ss:WrapText="1"/>
   <Font ss:FontName="Arial" x:Family="Swiss" ss:Bold="1"/>
  </Style>
  <Style ss:ID="s74">
   <Alignment ss:Vertical="Center"/>
   <NumberFormat ss:Format="@"/>
  </Style>
  <Style ss:ID="s76">
   <Alignment ss:Horizontal="Center" ss:Vertical="Top"/>
   <Font ss:FontName="Arial" x:Family="Swiss" ss:Bold="1"/>
  </Style>
  <Style ss:ID="s78">
   <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="12" ss:Bold="1"/>
  </Style>
  <Style ss:ID="s79">
   <Alignment ss:Vertical="Center"/>
   <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="16" ss:Bold="1"/>
  </Style>
  <Style ss:ID="s80">
   <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
   <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="12" ss:Bold="1"/>
  </Style>
  <Style ss:ID="s81">
   <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
  </Style>
  <Style ss:ID="s83">
   <Alignment ss:Horizontal="Left" ss:Vertical="Top" ss:WrapText="1"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="Tulokset">
  <Names>
   <NamedRange ss:Name="_FilterDatabase" ss:RefersTo="=Tulokset!R1C1:R1C18"
    ss:Hidden="1"/>
  </Names>
  <Table ss:ExpandedColumnCount="18" x:FullColumns="1"
   x:FullRows="1" ss:DefaultRowHeight="13"><xsl:attribute name="ss:ExpandedRowCount"><xsl:value-of select="count(/sparqlResults:sparql/sparqlResults:results/sparqlResults:result)+1"/></xsl:attribute>
   <Column ss:AutoFitWidth="0" ss:Width="45"/>
   <Column ss:AutoFitWidth="0" ss:Width="35"/>
   <Column ss:AutoFitWidth="0" ss:Width="35"/>
   <Column ss:Width="198.75"/>
   <Column ss:AutoFitWidth="0" ss:Width="90"/>
   <Column ss:AutoFitWidth="0" ss:Width="56.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="56.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="37.5"/>
   <Column ss:Hidden="1" ss:AutoFitWidth="0" ss:Width="274.75"/>
   <Column ss:AutoFitWidth="0" ss:Width="100"/>
   <Column ss:Hidden="1" ss:AutoFitWidth="0" ss:Width="54.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="113.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="46.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="46.5"/>
   <Column ss:Hidden="1" ss:AutoFitWidth="0" ss:Width="110"/>
   <Column ss:AutoFitWidth="0" ss:Width="650"/>
   <Column ss:AutoFitWidth="0" ss:Width="90"/>
   <Column ss:AutoFitWidth="0" ss:Width="65"/>
   <Row ss:AutoFitHeight="0" ss:Height="54" ss:StyleID="s62">
    <Cell><Data ss:Type="String">Muutos-<xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>tyypin <xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>tunnus</Data><Comment><ss:Data
       xmlns="http://www.w3.org/TR/REC-html40"><Font html:Face="Tahoma"
        x:Family="Swiss" html:Size="9" html:Color="#000000">YSOssa tapahtuneen muutostyypin tunnus. Muutos on kuvattu tarkemmin sarakkeessa &quot;YSOssa tapahtuneen muutoksen kuvaus&quot;. </Font></ss:Data></Comment><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell><Data ss:Type="String">Pää-<xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>tyyppi</Data><Comment><ss:Data
       xmlns="http://www.w3.org/TR/REC-html40"><Font html:Face="Tahoma"
        x:Family="Swiss" html:Size="9" html:Color="#000000">YSOssa tapahtuneen muutostyypin päätyyppi lajittelua varten. </Font></ss:Data></Comment><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell><Data ss:Type="String">Ali-<xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>tyyppi</Data><Comment><ss:Data
       xmlns="http://www.w3.org/TR/REC-html40"><Font html:Face="Tahoma"
        x:Family="Swiss" html:Size="9" html:Color="#000000">YSOssa tapahtuneen muutostyypin alityyppi lajittelua varten. </Font></ss:Data></Comment><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell><Data ss:Type="String">Termi erikoisontologiassa</Data><Comment><ss:Data
       xmlns="http://www.w3.org/TR/REC-html40"><Font html:Face="Tahoma"
        x:Family="Swiss" html:Size="9" html:Color="#000000">erikoisontologian käsitteen käytettävä termi</Font></ss:Data></Comment><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell><Data ss:Type="String"> Linkki erikoisontologian käsitteeseen</Data><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell><Data ss:Type="String">Erikoisontologian käsitteen lkm nyt</Data><Comment><ss:Data
       xmlns="http://www.w3.org/TR/REC-html40"><Font html:Face="Tahoma"
        x:Family="Swiss" html:Size="9" html:Color="#000000"> erikoisontologian käsitteeseen liittyvien muutosten määrä taulukon rivipoistojen jälkeen</Font></ss:Data></Comment><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell><Data ss:Type="String">Erikoisontologian käsitteen lkm alun perin</Data><Comment><ss:Data
       xmlns="http://www.w3.org/TR/REC-html40"><Font html:Face="Tahoma"
        x:Family="Swiss" html:Size="9" html:Color="#000000"> erikoisontologian käsitteeseen liittyvien muutosten määrä taulukossa alun perin</Font></ss:Data></Comment><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell><Data ss:Type="String">Ala-käsitteiden määrä</Data><Comment><ss:Data
       xmlns="http://www.w3.org/TR/REC-html40"><Font html:Face="Tahoma"
        x:Family="Swiss" html:Size="9" html:Color="#000000">erikoisontologian käsitteen alakäsitteiden lukumäärä</Font></ss:Data></Comment><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell><Data ss:Type="String">Käsitetyyppi erikoisontologiassa</Data><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell><Data ss:Type="String">Suhdetyyppi</Data><Comment><ss:Data
       xmlns="http://www.w3.org/TR/REC-html40"><Font html:Face="Tahoma"
        x:Family="Swiss" html:Size="9" html:Color="#000000"> erikoisontologian käsitteen suhde YSO-käsitteeseen</Font></ss:Data></Comment><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell><Data ss:Type="String">Liityntä-kohdan muutos</Data><Comment><ss:Data
       xmlns="http://www.w3.org/TR/REC-html40"><Font html:Face="Tahoma"
        x:Family="Swiss" html:Size="9" html:Color="#000000"> onko muutos tapahtunut YSOn ja erikoisontologian liityntäkohdassa (kyllä/ei) </Font></ss:Data></Comment><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell><Data ss:Type="String">Termi erikoisontologian vanhassa YSOssa</Data><Comment><ss:Data
       xmlns="http://www.w3.org/TR/REC-html40"><Font html:Face="Tahoma"
        x:Family="Swiss" html:Size="9" html:Color="#000000">YSO-käsitteen käytettävä termi siinä YSO-versiossa, joka sisältyy erikoisontologiaan</Font></ss:Data></Comment><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell><Data ss:Type="String">YSO-käsitteen lkm nyt</Data><Comment><ss:Data
       xmlns="http://www.w3.org/TR/REC-html40"><Font html:Face="Tahoma"
        x:Family="Swiss" html:Size="9" html:Color="#000000"> YSO-käsitteeseen liittyvien muutosten määrä erikoisontologiassa taulukon rivipoistojen jälkeen</Font></ss:Data></Comment><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell><Data ss:Type="String">YSO-käsitteen lkm alun perin</Data><Comment><ss:Data
       xmlns="http://www.w3.org/TR/REC-html40"><Font html:Face="Tahoma"
        x:Family="Swiss" html:Size="9" html:Color="#000000"> YSO-käsitteeseen liittyvien muutosten määrä erikoisontologiassa alun perin</Font></ss:Data></Comment><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell><Data ss:Type="String">Käsitetyyppi YSOssa</Data><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell><Data ss:Type="String">YSOssa tapahtuneen muutoksen kuvaus</Data><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell><Data ss:Type="String">Linkki erikoisontologian YSO-käsitteeseen</Data></Cell>
    <Cell><Data ss:Type="String">Linkki käsitteeseen uudessa YSOssa</Data></Cell>
   </Row>
  
  
       <xsl:apply-templates select="/sparqlResults:sparql/sparqlResults:results/sparqlResults:result"/>

	   
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <Layout x:StartPageNumber="1"/>
    <Header x:Margin="0.78749999999999998" x:Data="&amp;C&amp;A"/>
    <Footer x:Margin="0.78749999999999998" x:Data="&amp;CPage &amp;P"/>
    <PageMargins x:Bottom="1.0249999999999999" x:Left="0.78749999999999998"
     x:Right="0.78749999999999998" x:Top="1.0249999999999999"/>
   </PageSetup>
   <Print>
    <ValidPrinterInfo/>
    <PaperSizeIndex>9</PaperSizeIndex>
    <HorizontalResolution>300</HorizontalResolution>
    <VerticalResolution>300</VerticalResolution>
   </Print>
   <Selected/>
   <FreezePanes/>
   <FrozenNoSplit/>
   <SplitHorizontal>1</SplitHorizontal>
   <TopRowBottomPane>1</TopRowBottomPane>
   <ActivePane>2</ActivePane>
   <Panes>
    <Pane>
     <Number>3</Number>
    </Pane>
    <Pane>
     <Number>2</Number>
     <ActiveCol>1</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
  <AutoFilter x:Range="R1C1:R1C18"
   xmlns="urn:schemas-microsoft-com:office:excel">
  </AutoFilter>
 </Worksheet>
 <Worksheet ss:Name="Ohje">
  <Table ss:ExpandedColumnCount="6" ss:ExpandedRowCount="14" x:FullColumns="1"
   x:FullRows="1">
   <Column ss:AutoFitWidth="0" ss:Width="31.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="125.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="51.75"/>
   <Column ss:AutoFitWidth="0" ss:Width="60"/>
   <Column ss:AutoFitWidth="0" ss:Width="461.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="52.5"/>
   <Row ss:Index="2" ss:AutoFitHeight="0" ss:Height="24">
    <Cell ss:Index="4" ss:StyleID="s79"><Data ss:Type="String">Ohje:</Data></Cell>
    <Cell ss:StyleID="s74"><Data ss:Type="String" x:Ticked="1">Tarkemmat ohjeet löytyvät Kansalliskirjaston Kiwi-sivustolta:</Data></Cell>
   </Row>
   <Row>
    <Cell ss:Index="5" ss:StyleID="s63" ss:HRef="https://www.kiwi.fi/"><Data
      ss:Type="String">https://www.kiwi.fi/</Data></Cell>
   </Row>
   <Row ss:Index="5" ss:AutoFitHeight="0" ss:Height="140.25">
    <Cell ss:Index="5" ss:StyleID="s83"><Data ss:Type="String">Jokainen tulostaulukon rivi raportoi yhden muutoksen vanhaan erikoisontologiaan liitetyn YSOn ja uuden vertaillun YSOn välillä. Tämän muutostaulukon tekemisen jälkeen täytyy erikoisontologian ja vanhan YSO-version liitos purkaa ja vaihtaa uuteen YSO-versioon. Kun sinulla on käytössäsi erikoisontologia, johon on vaihdettu uusi YSO, käy taulukon jokainen rivi läpi ja muuta erikoisontologiaa tarvittaessa. Kun taulukossa raportoitu muutos (rivi) on käsitelty, niin muutosta kuvaava rivi täytyy poistaa taulukosta käsittelyn merkiksi. Tulostaulukon rivejä voi järjestää eri sarakkeiden mukaan ja tarkastella muutoksia näin ryhminä ja mahdollisesti käsitellä useita muutoksia kerralla. Erityisen hyödyllistä voi olla järjestää taulukko liittyvän YSO-käsitteen tunnuksen eli linkki erikoisontologian YSO-käsitteeseen sarakkeen (ja mahdollisesti muutostyypin) mukaan. Näin voi nähdä mihin kaikkiin erikoisontologian käsitteisiin yksi tietty YSO-käsitteessä tapahtunut muutos vaikuttaa ja käsitellä ne kerralla (poistaa rivit) , jos muutos ei aiheuta toimenpiteitä erikoisontologian käsitteisiin.</Data></Cell>
   </Row>
   <Row ss:Index="7" ss:Height="15.75">
    <Cell ss:Index="2" ss:StyleID="s80"><Data ss:Type="String">Muutostyypin tunnus</Data></Cell>
    <Cell ss:StyleID="s80"><Data ss:Type="String">Jäljellä</Data></Cell>
    <Cell ss:StyleID="s80"><Data ss:Type="String">Käsitelty</Data></Cell>
    <Cell ss:StyleID="s78"><Data ss:Type="String">Kuvaus</Data></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s76"><Data ss:Type="String">1.1</Data></Cell>
    <Cell ss:StyleID="s76" ss:Formula="=COUNTIF(Tulokset!C1,RC[-1])"><Data
      ss:Type="Number"><xsl:value-of select="count(/sparqlResults:sparql/sparqlResults:results/sparqlResults:result[sparqlResults:binding[@name='queryType']/*[1]='1' and sparqlResults:binding[@name='querySubType']/*[1]='1'])"/></Data></Cell>
    <Cell ss:StyleID="s76"  ss:Formula="={count(/sparqlResults:sparql/sparqlResults:results/sparqlResults:result[sparqlResults:binding[@name='queryType']/*[1]='1' and sparqlResults:binding[@name='querySubType']/*[1]='1'])}-COUNTIF(Tulokset!C1,RC[-2])"><Data ss:Type="Number">1</Data></Cell>
    <Cell ss:StyleID="s83"><ss:Data ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40"><B>Uudella YSO käsitteellä on sama käytettävä termi kuin erikoisontologian käsitteellä</B> <xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>Toimenpide: Tarkista onko uusi YSO-käsite merkitykseltään sama kuin erikoisontologian samanniminen käsite. <xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>* Jos käsite on sama, näiden välille merkitään ekvivalenssi. <xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>* Jos käsite ei ole sama, erikoisontologian käsitteelle lisätään merkitystä selventävä sulkutarkenne.</ss:Data></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s76"><Data ss:Type="String">2.1</Data></Cell>
    <Cell ss:StyleID="s76" ss:Formula="=COUNTIF(Tulokset!C1,RC[-1])"><Data
      ss:Type="Number"><xsl:value-of select="count(/sparqlResults:sparql/sparqlResults:results/sparqlResults:result[sparqlResults:binding[@name='queryType']/*[1]='2' and sparqlResults:binding[@name='querySubType']/*[1]='1'])"/></Data></Cell>
    <Cell ss:StyleID="s76"  ss:Formula="={count(/sparqlResults:sparql/sparqlResults:results/sparqlResults:result[sparqlResults:binding[@name='queryType']/*[1]='2' and sparqlResults:binding[@name='querySubType']/*[1]='1'])}-COUNTIF(Tulokset!C1,RC[-2])"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s83"><ss:Data ss:Type="String" x:Ticked="1" xmlns="http://www.w3.org/TR/REC-html40"><B>YSO käsitteellä on uusi käytettävä termi, joka on sama kuin erikoisontologian käsitteellä</B> <xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>Toimenpide: Tarkista onko uuden käytettävän termin saanut YSO-käsite merkitykseltään sama kuin erikoisontologian samanniminen käsite. <xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>* Jos käsite on sama, näiden välille merkitään ekvivalenssi. <xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>* Jos käsite ei ole sama, erikoisontologian käsitteelle lisätään merkitystä selventävä sulkutarkenne.</ss:Data></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s76"><Data ss:Type="String">2.2</Data></Cell>
    <Cell ss:StyleID="s76" ss:Formula="=COUNTIF(Tulokset!C1,RC[-1])"><Data
      ss:Type="Number"><xsl:value-of select="count(/sparqlResults:sparql/sparqlResults:results/sparqlResults:result[sparqlResults:binding[@name='queryType']/*[1]='2' and sparqlResults:binding[@name='querySubType']/*[1]='2'])"/></Data></Cell>
    <Cell ss:StyleID="s76"  ss:Formula="={count(/sparqlResults:sparql/sparqlResults:results/sparqlResults:result[sparqlResults:binding[@name='queryType']/*[1]='2' and sparqlResults:binding[@name='querySubType']/*[1]='2'])}-COUNTIF(Tulokset!C1,RC[-2])"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s83"><ss:Data ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40"><B>Liittyvän YSO käsitteen käytettävä termi on muuttunut</B> <xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>Toimenpide: Tarkista päteekö erikoisontologian käsitteen ja YSO-käsitteen suhde (ekvivalenssi tai yläkäsitesuhde) myös muutoksen jälkeen. <xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>* Jos suhde ei enää päde, se puretaan ja erikoisontologian käsite hierakisoidaan tarvittaessa uudelleen. <xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>* Jos suhde pätee, muutoksia ei tarvita.</ss:Data></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s76"><Data ss:Type="String">3.1</Data></Cell>
    <Cell ss:StyleID="s76" ss:Formula="=COUNTIF(Tulokset!C1,RC[-1])"><Data
      ss:Type="Number"><xsl:value-of select="count(/sparqlResults:sparql/sparqlResults:results/sparqlResults:result[sparqlResults:binding[@name='queryType']/*[1]='3' and sparqlResults:binding[@name='querySubType']/*[1]='1'])"/></Data></Cell>
    <Cell ss:StyleID="s76"  ss:Formula="={count(/sparqlResults:sparql/sparqlResults:results/sparqlResults:result[sparqlResults:binding[@name='queryType']/*[1]='3' and sparqlResults:binding[@name='querySubType']/*[1]='1'])}-COUNTIF(Tulokset!C1,RC[-2])"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s83"><ss:Data ss:Type="String" x:Ticked="1" xmlns="http://www.w3.org/TR/REC-html40"><B>Liittyvällä YSO käsitteellä on uusi yläkäsite</B> <xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>Toimenpide: Tarkistetaan päteekö erikoisontologian käsitteen ja YSO-käsitteen suhde (ekvivalenssi tai yläkäsitesuhde) myös muutoksen jälkeen. <xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>* Jos suhde ei enää päde, erikoisontologian käsitteelle on etsittävä uusi yläkäsite tai ekvivalenssi. <xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>* Jos suhde pätee, muutoksia ei tarvita.</ss:Data></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s76"><Data ss:Type="String">3.2</Data></Cell>
    <Cell ss:StyleID="s76" ss:Formula="=COUNTIF(Tulokset!C1,RC[-1])"><Data
      ss:Type="Number"><xsl:value-of select="count(/sparqlResults:sparql/sparqlResults:results/sparqlResults:result[sparqlResults:binding[@name='queryType']/*[1]='3' and sparqlResults:binding[@name='querySubType']/*[1]='2'])"/></Data></Cell>
    <Cell ss:StyleID="s76"  ss:Formula="={count(/sparqlResults:sparql/sparqlResults:results/sparqlResults:result[sparqlResults:binding[@name='queryType']/*[1]='3' and sparqlResults:binding[@name='querySubType']/*[1]='2'])}-COUNTIF(Tulokset!C1,RC[-2])"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s83"><ss:Data ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40"><B>Liittyvältä YSO käsitteeltä on poistunut yläkäsite</B> <xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>Toimenpide: ks. 3.1</ss:Data></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s76"><Data ss:Type="String">3.3</Data></Cell>
    <Cell ss:StyleID="s76" ss:Formula="=COUNTIF(Tulokset!C1,RC[-1])"><Data
      ss:Type="Number"><xsl:value-of select="count(/sparqlResults:sparql/sparqlResults:results/sparqlResults:result[sparqlResults:binding[@name='queryType']/*[1]='3' and sparqlResults:binding[@name='querySubType']/*[1]='3'])"/></Data></Cell>
    <Cell ss:StyleID="s76"  ss:Formula="={count(/sparqlResults:sparql/sparqlResults:results/sparqlResults:result[sparqlResults:binding[@name='queryType']/*[1]='3' and sparqlResults:binding[@name='querySubType']/*[1]='3'])}-COUNTIF(Tulokset!C1,RC[-2])"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s83"><ss:Data ss:Type="String" x:Ticked="1" xmlns="http://www.w3.org/TR/REC-html40"><B>Liittyvällä YSO käsitteellä on yläkäsite, joka on poistettu käytöstä uudessa YSOssa</B> <xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>Toimenpide: ks. 3.1</ss:Data></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s76"><Data ss:Type="String">3.4</Data></Cell>
    <Cell ss:StyleID="s76" ss:Formula="=COUNTIF(Tulokset!C1,RC[-1])"><Data
      ss:Type="Number"><xsl:value-of select="count(/sparqlResults:sparql/sparqlResults:results/sparqlResults:result[sparqlResults:binding[@name='queryType']/*[1]='3' and sparqlResults:binding[@name='querySubType']/*[1]='4'])"/></Data></Cell>
    <Cell ss:StyleID="s76"  ss:Formula="={count(/sparqlResults:sparql/sparqlResults:results/sparqlResults:result[sparqlResults:binding[@name='queryType']/*[1]='3' and sparqlResults:binding[@name='querySubType']/*[1]='4'])}-COUNTIF(Tulokset!C1,RC[-2])"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s83"><ss:Data ss:Type="String" x:Ticked="1" xmlns="http://www.w3.org/TR/REC-html40"><B>Liittyvä YSO-käsite on poistettu käytöstä</B> <xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text>Toimenpide: Erikoisontologian käsitteelle on löydettävä uusi yläkäsite tai ekvivalenssi.</ss:Data></Cell>
   </Row>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <Header x:Margin="0.3"/>
    <Footer x:Margin="0.3"/>
    <PageMargins x:Bottom="0.75" x:Left="0.7" x:Right="0.7" x:Top="0.75"/>
   </PageSetup>
   <Print>
    <ValidPrinterInfo/>
    <PaperSizeIndex>9</PaperSizeIndex>
    <HorizontalResolution>600</HorizontalResolution>
    <VerticalResolution>600</VerticalResolution>
   </Print>
   <Selected/>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>13</ActiveRow>
     <ActiveCol>4</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>
  </xsl:template>

  <xsl:key name="keyDomainC" match="sparqlResults:result" use="sparqlResults:binding[@name='domainC']/*[1]"/>
  <xsl:key name="keyYsoC" match="sparqlResults:result" use="sparqlResults:binding[@name='ysoC']/*[1]"/>
  
  <xsl:template match="sparqlResults:result">
    <xsl:variable name="queryType" select="sparqlResults:binding[@name='queryType']/*[1]"/>
    <xsl:variable name="querySubType" select="sparqlResults:binding[@name='querySubType']/*[1]"/>
    <xsl:variable name="domainC" select="sparqlResults:binding[@name='domainC']/*[1]"/>
    <xsl:variable name="nroSubConcepts" select="sparqlResults:binding[@name='nroSubConcepts']/*[1]"/>
    <xsl:variable name="domainCShort" select="translate(substring-after(string($domainC),'http://www.yso.fi/onto/'),'/',':')"/>
    <xsl:variable name="domainCpref" select="sparqlResults:binding[@name='domainCpref']/*[1]"/>
    <xsl:variable name="domainCtypes" select="sparqlResults:binding[@name='domainCtypes']/*[1]"/>
    <xsl:variable name="relationType" select="sparqlResults:binding[@name='relationType']/*[1]"/>
    <xsl:variable name="interface" select="sparqlResults:binding[@name='interface']/*[1]"/>
    <xsl:variable name="ysoC" select="sparqlResults:binding[@name='ysoC']/*[1]"/>
	<xsl:variable name="ysoCShort" select="translate(substring-after(string($ysoC),'http://www.yso.fi/onto/'),'/',':')"/>
    <xsl:variable name="ysoCpref" select="sparqlResults:binding[@name='ysoCpref']/*[1]"/>
    <xsl:variable name="ysoCtypes" select="sparqlResults:binding[@name='ysoCtypes']/*[1]"/>
    <xsl:variable name="changeDescription" select="sparqlResults:binding[@name='changeDescription']/*[1]"/>
	<xsl:variable name="countDomainC" select="count(key('keyDomainC',$domainC))"/>
	<xsl:variable name="countYsoC" select="count(key('keyYsoC',$ysoC))"/>
	<xsl:variable name="currentRow" select="position()"/>
	
   <Row xmlns="urn:schemas-microsoft-com:office:spreadsheet">
    <Cell><Data ss:Type="String"><xsl:value-of select="concat($queryType,'.',$querySubType)"/></Data></Cell>
    <Cell><Data ss:Type="Number"><xsl:value-of select="$queryType"/></Data></Cell>
    <Cell><Data ss:Type="Number"><xsl:value-of select="$querySubType"/></Data></Cell>
    <Cell><Data ss:Type="String"><xsl:value-of select="$domainCpref"/></Data></Cell>
    <Cell ss:HRef="{$domainOntUri}fi/page/?uri={$domainC}">
	 <Data ss:Type="String"><xsl:value-of select="$domainCShort"/></Data>
	</Cell>
	<Cell ss:Formula="=COUNTIF(R2C[-1]:R{$countRows+1}C[-1],RC[-1])"><Data ss:Type="Number"><xsl:value-of select="$countDomainC"/></Data></Cell>
	<Cell><Data ss:Type="Number"><xsl:value-of select="$countDomainC"/></Data></Cell>
    <xsl:choose>
      <xsl:when test="$nroSubConcepts &gt;0 ">
        <Cell><Data ss:Type="Number"><xsl:value-of select="$nroSubConcepts"/></Data></Cell>
		<Cell><Data ss:Type="String"><xsl:value-of select="$domainCtypes"/></Data></Cell>
      </xsl:when>
	  <xsl:otherwise>
        <Cell ss:Index="9"><Data ss:Type="String"><xsl:value-of select="$domainCtypes"/></Data></Cell>
      </xsl:otherwise>
	</xsl:choose>
    <Cell><Data ss:Type="String"><xsl:value-of select="$relationType"/></Data></Cell>
    <Cell><Data ss:Type="String"><xsl:value-of select="$interface"/></Data></Cell>
	
	<!-- If queryType is 1.1 do not print prefLabel as it is not in the old YSO of the special ontology, same for link-->
    <Cell><Data ss:Type="String"><xsl:if test="$queryType!='1.1'"><xsl:value-of select="$ysoCpref"/></xsl:if></Data></Cell>
	<Cell ss:Formula="=COUNTIF(R2C[4]:R{$countRows+1}C[4],RC[4])"><Data ss:Type="Number"><xsl:value-of select="$countYsoC"/></Data></Cell>
	<Cell><Data ss:Type="Number"><xsl:value-of select="$countYsoC"/></Data></Cell>
    <Cell><Data ss:Type="String"><xsl:value-of select="$ysoCtypes"/></Data></Cell>
    <Cell><Data ss:Type="String"><xsl:value-of select="$changeDescription"/></Data></Cell>
    <Cell ss:HRef="{$domainOntUri}fi/page/?uri={$ysoC}">
          <Data ss:Type="String"><xsl:if test="$queryType!='1.1'"><xsl:value-of select="$ysoCShort"/></xsl:if></Data></Cell>
	<Cell ss:HRef="{$newYsoOntUri}fi/page/?uri={$ysoC}">
     <Data ss:Type="String"><xsl:value-of select="$ysoCShort"/></Data></Cell>
   </Row>
  </xsl:template>

  
  
</xsl:stylesheet>


