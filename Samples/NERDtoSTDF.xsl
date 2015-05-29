<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:stdf="http://standoff.proposal"
    xmlns:tbx="http://www.tbx.org">

    <xsl:output method="xml"/>
    
    <xsl:template match="stdf:annotationGrp">
        <termEntry xmlns="http://www.tbx.org">
            <xsl:for-each select="stdf:definitions/stdf:element">
            <descripGrp>
                <descrip type="definition" xml:lang="{stdf:lang}">
                    <xsl:apply-templates select="stdf:definition"/>
                </descrip>
                <admin type="source">
                    <xsl:apply-templates select="stdf:source"/>
                </admin>
                <xsl:value-of select="no"></xsl:value-of>
            </descripGrp>
            </xsl:for-each>
            <admin> <addName xmlns="http://www.tei-c.org/ns/1.0"></addName> <bpt></bpt></admin>
            <ptr xmlns="http://www.tei-c.org/ns/1.0"></ptr>
            <langSet>
                <ptr xmlns="http://www.tei-c.org/ns/1.0"></ptr>
                <tig>
                    <term xmlns="http://www.tei-c.org/ns/1.0"></term>
                    <termNote></termNote>
                    <ptr xmlns="http://www.tei-c.org/ns/1.0"></ptr>
                    
                </tig>
            </langSet>
        </termEntry>
    </xsl:template>
    
    <xsl:template match="stdf:definition">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="stdf:source">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
