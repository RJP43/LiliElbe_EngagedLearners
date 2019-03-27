<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:template match="descendant::body//p">
        <xsl:choose>
            <xsl:when test="not(@style)">
                <p n="{count(preceding-sibling::p[not(@style)]) + 1}">
                    <xsl:apply-templates/>
                </p>
            </xsl:when>
            <xsl:when test="@xml:id">
                <p style="{@style}" xml:id="{@xml:id}">
                    <xsl:apply-templates/>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <p style="{@style}">
                    <xsl:apply-templates/>
                </p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template
        match="div[@type = 'chapter' or @type = 'intro' or @type = 'foreword']/descendant::pb[@style = 'page'][1]">
        <pb style="page" n="{@n}" rend="chptFirst"/>
    </xsl:template>
</xsl:stylesheet>
