<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:ns="http://standoff.proposal" exclude-result-prefixes="#all">

  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <xsl:apply-templates select="*"/>
  </xsl:template>
  
  <xsl:template match="*">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>


  <xsl:template match="@* | text() | processing-instruction() | comment()">
	<xsl:copy/>
  </xsl:template>

  <xsl:template match="ns:soHeader">
    <xsl:element name="teiHeader">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ns:annotations">
    <xsl:element name="ns:listAnnotation">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="ns:stdf">
    <xsl:element name="ns:standOff">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tei:span">
    <xsl:copy>
	<xsl:if test="@corresp">
	  <xsl:attribute name="corresp">
	    <xsl:value-of select="replace(@corresp,'-#',' #')"/>
	  </xsl:attribute>
	</xsl:if>
	  <xsl:apply-templates select="@*[not(name() = 'corresp')] | node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="tei:encodingDesc[following-sibling::tei:titleStmt]"/>
  <xsl:template match="tei:titleStmt[parent::ns:soHeader]">
    <xsl:element name="fileDesc">
      <xsl:copy>
	<xsl:apply-templates select="@* | node()"/>
      </xsl:copy>
    </xsl:element>
    <xsl:copy-of select="preceding-sibling::tei:encodingDesc"/>
  </xsl:template>

</xsl:stylesheet>
