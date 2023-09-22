<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="/Log/SvcInfo">
<font color="#008000"><b>&lt;<xsl:value-of select="name()"/></b></font><xsl:for-each select="@*"><font color="#008000"><b>&#xa0;<xsl:value-of select="name()"/></b></font>=<font color="#008000">"<xsl:value-of select="."/>"</font></xsl:for-each>&gt;<xsl:value-of select="."/><font color="#008000"><b>&lt;/<xsl:value-of select="name()"/>&gt;</b></font><br/>
</xsl:template>

<xsl:template match="/Log/Message">
<font color="#008000"><b>&lt;<xsl:value-of select="name()"/></b></font><xsl:for-each select="@*"><font color="#008000"><b>&#xa0;<xsl:value-of select="name()"/></b></font>=<font color="#008000">"<xsl:value-of select="."/>"</font></xsl:for-each>&gt;<xsl:value-of select="."/><font color="#008000"><b>&lt;/<xsl:value-of select="name()"/>&gt;</b></font><br/>
</xsl:template>

<xsl:template match="/Log/Exception">
<font color="#900000"><b>&lt;<xsl:value-of select="name()"/></b></font><xsl:for-each select="@*"><font color="#900000"><b>&#xa0;<xsl:value-of select="name()"/></b></font>=<font color="#900000">"<xsl:value-of select="."/>"</font></xsl:for-each>&gt;<xsl:value-of select="."/><font color="#900000"><b>&lt;/<xsl:value-of select="name()"/>&gt;</b></font><br/>
</xsl:template>

<xsl:template match="/Log/Error">
<font color="#900000"><b>&lt;<xsl:value-of select="name()"/></b></font><xsl:for-each select="@*"><font color="#900000"><b>&#xa0;<xsl:value-of select="name()"/></b></font>=<font color="#900000">"<xsl:value-of select="."/>"</font></xsl:for-each>&gt;<xsl:value-of select="."/><font color="#900000"><b>&lt;/<xsl:value-of select="name()"/>&gt;</b></font><br/>
</xsl:template>

</xsl:stylesheet>
