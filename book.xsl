<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
<body>
  <h2>My CD Collection</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Title</th>
      <th style="text-align:left">Artist</th>
      <th style="text-align:left">Year</th>
      <th style="text-align:left">Price</th>
    </tr>
    <xsl:for-each select="catalog/cd[price &gt; 10]">
     <xsl:sort select="artist" order="descending" data-type="number"/>
      <tr>
      	<td><xsl:value-of select="title"/></td>
	   <xsl:choose>
	     <xsl:when test="@code = 'tr' ">	
		<td>

	<a><xsl:attribute name="href"> <xsl:value-of select="artist"/> </xsl:attribute><xsl:value-of select="artist"/> </a>

		</td>
	     </xsl:when>
	     <xsl:otherwise>
		<td><xsl:value-of select="artist"/></td>
	     </xsl:otherwise>
	   </xsl:choose>
		<td><xsl:value-of select="year"/></td>
		<td><xsl:value-of select="price"/></td>
      </tr>
    </xsl:for-each>
  </table> 
</body>
</html>
</xsl:template>
<xsl:template match="title">
 
</xsl:template>
</xsl:stylesheet>

