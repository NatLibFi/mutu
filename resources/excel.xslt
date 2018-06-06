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
  <Version>14.00</Version>
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
  <WindowHeight>8190</WindowHeight>
  <WindowWidth>16380</WindowWidth>
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
  <Style ss:ID="s52">
   <Font ss:FontName="Arial" x:Family="Swiss"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="allQueryResults">
  <Names>
   <NamedRange ss:Name="_FilterDatabase" ss:RefersTo="=allQueryResults!R1C1:R1C15"
    ss:Hidden="1"/>
  </Names>
  <Table ss:ExpandedColumnCount="14" x:FullColumns="1"
   x:FullRows="1"><xsl:attribute name="ss:ExpandedRowCount"><xsl:value-of select="count(/sparqlResults:sparql/sparqlResults:results/sparqlResults:result)+1"/></xsl:attribute>
   <Column ss:AutoFitWidth="0" ss:Width="55"/>
   <Column ss:AutoFitWidth="0" ss:Width="75"/>
   <Column ss:AutoFitWidth="0" ss:Width="50"/>
   <Column ss:AutoFitWidth="0" ss:Width="225"/>
   <Column ss:AutoFitWidth="0" ss:Width="125"/>
   <Column ss:AutoFitWidth="0" ss:Width="100"/>
   <Column ss:AutoFitWidth="0" ss:Width="50"/>
   <Column ss:AutoFitWidth="0" ss:Width="50"/>
   <Column ss:AutoFitWidth="0" ss:Width="50"/>
   <Column ss:AutoFitWidth="0" ss:Width="50"/>
   <Column ss:AutoFitWidth="0" ss:Width="50"/>
   <Column ss:AutoFitWidth="0" ss:Width="120"/>
   <Column ss:AutoFitWidth="0" ss:Width="175"/>
   <Column ss:AutoFitWidth="0" ss:Width="650"/>
   <Row>
    <Cell ss:StyleID="s52"><Data ss:Type="String">queryType</Data><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell ss:StyleID="s52"><Data ss:Type="String">domainC</Data><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell ss:StyleID="s52"><Data ss:Type="String">n</Data><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell ss:StyleID="s52"><Data ss:Type="String">domainCtypes</Data><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell ss:StyleID="s52"><Data ss:Type="String">domainCpref</Data><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell ss:StyleID="s52"><Data ss:Type="String">relationType</Data><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell ss:StyleID="s52"><Data ss:Type="String">interface</Data><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell ss:StyleID="s52"><Data ss:Type="String">ysoC</Data><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell ss:StyleID="s52"><Data ss:Type="String">n</Data><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell ss:StyleID="s52"><Data ss:Type="String">Link</Data><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell ss:StyleID="s52"><Data ss:Type="String">Link</Data><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell ss:StyleID="s52"><Data ss:Type="String">ysoCtypes</Data><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell ss:StyleID="s52"><Data ss:Type="String">ysoCpref</Data><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
    <Cell ss:StyleID="s52"><Data ss:Type="String">changeDescription</Data><NamedCell
      ss:Name="_FilterDatabase"/></Cell>
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
     <ActiveRow>13</ActiveRow>
     <ActiveCol>2</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
  <AutoFilter x:Range="R1C1:R1C14"
   xmlns="urn:schemas-microsoft-com:office:excel">
  </AutoFilter>
 </Worksheet>
</Workbook>
  </xsl:template>

  
  <xsl:template match="sparqlResults:result">
    <xsl:variable name="domainCShort" select="translate(substring-after(string(sparqlResults:binding[@name='domainC']/*[1]),'http://www.yso.fi/onto/'),'/',':')"/>
	<xsl:variable name="ysoCShort" select="translate(substring-after(string(sparqlResults:binding[@name='ysoC']/*[1]),'http://www.yso.fi/onto/'),'/',':')"/>
	<xsl:variable name="countDomainC" select="count(../sparqlResults:result/sparqlResults:binding[@name='domainC']/*[1][.=current()/sparqlResults:binding[@name='domainC']/*[1]])"/>
	<xsl:variable name="countYsoC" select="count(../sparqlResults:result/sparqlResults:binding[@name='ysoC']/*[1][.=current()/sparqlResults:binding[@name='ysoC']/*[1]])"/>
	<xsl:variable name="currentRow" select="count(preceding::sparqlResults:result)"/>
	
   <Row xmlns="urn:schemas-microsoft-com:office:spreadsheet">
    <Cell><Data ss:Type="String"><xsl:value-of select="sparqlResults:binding[@name='queryType']/*[1]"/></Data></Cell>
    <Cell><xsl:attribute name="ss:HRef"><xsl:value-of select="sparqlResults:binding[@name='domainC']/*[1]"/></xsl:attribute>
	 <Data ss:Type="String"><xsl:value-of select="$domainCShort"/></Data>
	</Cell>
	<Cell ss:Formula="=COUNTIF(R2C[-1]:R{$countRows+1}C[-1],RC[-1]) &amp; &quot; / {$countDomainC}&quot;"><Data ss:Type="String"><xsl:value-of select="concat($countDomainC,' / ',$countDomainC)"/></Data></Cell>
    <Cell><Data ss:Type="String"><xsl:value-of select="sparqlResults:binding[@name='domainCtypes']/*[1]"/></Data></Cell>
    <Cell><Data ss:Type="String"><xsl:value-of select="sparqlResults:binding[@name='domainCpref']/*[1]"/></Data></Cell>
    <Cell><Data ss:Type="String"><xsl:value-of select="sparqlResults:binding[@name='relationType']/*[1]"/></Data></Cell>
    <Cell><Data ss:Type="String"><xsl:value-of select="sparqlResults:binding[@name='interface']/*[1]"/></Data></Cell>
    <Cell><Data ss:Type="String"><xsl:value-of select="$ysoCShort"/></Data></Cell>
	<Cell ss:Formula="=COUNTIF(R2C[-1]:R{$countRows+1}C[-1],RC[-1]) &amp; &quot; / {$countYsoC}&quot;"><Data ss:Type="String"><xsl:value-of select="concat($countYsoC,' / ',$countYsoC)"/></Data></Cell>
    <Cell><xsl:attribute name="ss:HRef">http://finto.fi/maotao/fi/page/?uri=<xsl:value-of select="sparqlResults:binding[@name='ysoC']/*[1]"/></xsl:attribute>
	 <Data ss:Type="String">old-link</Data></Cell>
    <Cell> 
	<xsl:attribute name="ss:HRef"><xsl:value-of select="sparqlResults:binding[@name='ysoC']/*[1]"/></xsl:attribute>
     <Data ss:Type="String">new-link</Data></Cell>
    <Cell><Data ss:Type="String"><xsl:value-of select="sparqlResults:binding[@name='ysoCtypes']/*[1]"/></Data></Cell>
    <Cell><Data ss:Type="String"><xsl:value-of select="sparqlResults:binding[@name='ysoCpref']/*[1]"/></Data></Cell>
    <Cell><Data ss:Type="String"><xsl:value-of select="sparqlResults:binding[@name='changeDescription']/*[1]"/></Data></Cell>
   </Row>
  </xsl:template>

  
  
</xsl:stylesheet>


