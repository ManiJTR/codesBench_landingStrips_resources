<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0"
    xmlns:xalan="http://xml.apache.org/xslt">
    
<xsl:output method="html" />

<!-- 
	NonDecisionalMoveToPubReport.xsl
	Stylesheet for use with the xml produced in RegVerticals NonDecisionalMoveToPub error report builder. 
	 
	Author: Laura Gallmeier (laura.gallmeier@thomson.com)
-->
	 
<!-- 
	Sample XML to be parsed...

        // <MoveToPubReport  batch="" jurisdiction="" total="" date="">
        //      <Errors>
        //          <Error>
        //              <UUID>Doc Uuid</UUID>
        //              <Title>Doc Title</TITLE>
        //              <Relationship>Relationship String</Relationship>
        //          </Error>
        //          <Error>
        //              <UUID>Doc Uuid</UUID>
        //              <Title>Doc Title</Title>
        //              <Relationship>Relationship String</Relationship>
        //          </Error>
        //      </Errors>
        // </MoveToPubReport>
-->

<!-- Template MoveToPubReport (root) -->
	<xsl:template match = "//MoveToPubReport">
		<HTML>
			<HEAD>
				<TITLE>RegVerticals -- NonDecisional Move-To-Pub Report</TITLE>
				<BODY>
					<P>
						<H3><B>NonDecisional Move-To-Pub Unmatched Relationships Report:  </B></H3>
						<DIV>Performed On:  <xsl:value-of select="@date" /></DIV>
					</P>
				
					<P>
						<DIV>Batch:  <xsl:value-of select="@batch" /></DIV>
						<DIV>Jurisdiction:  <xsl:value-of select="@jurisdiction" /></DIV>
						<DIV>Total Unmatched Relationships:  <xsl:value-of select="@total" /></DIV>
					</P>
					
					<P>
						<xsl:if test="@total != 0">
							<xsl:apply-templates select="Errors"/>
						</xsl:if>
					</P>
				</BODY>
			</HEAD>
		</HTML>
			
	</xsl:template>

<!-- Template Errors -->
	<xsl:template match = "Errors">
			<table border="1">
				<tr>
					<th colspan="40">NonDecisional Document UUID</th>
					<th colspan="40">NonDecisional Document Title</th>
					<th>UnMatched NonDecisional Relationship</th>
				</tr>
				<xsl:for-each select="Error">
					<tr>
						<td colspan="40">
							<xsl:apply-templates select="UUID"/>
						</td>
						<td colspan="40">
							<xsl:apply-templates select="Title"/>
						</td>
						<td>
							<xsl:apply-templates select="Relationship"/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
	</xsl:template>
	
<!-- Template UUID -->
	<xsl:template match = "UUID">
		<xsl:value-of select="." />
	</xsl:template>	

<!-- Template Title -->
	<xsl:template match = "Title">
		<xsl:value-of select="." />
	</xsl:template>	
	
<!-- Template Relationship -->
	<xsl:template match = "Relationship">
		<xsl:value-of select="." />
	</xsl:template>	
	
</xsl:stylesheet>