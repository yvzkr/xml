<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>
	<xsl:template match="/">
	<html>
	  <body>

		<table border="2" align="center">
		    <tr>
			<th>Item number</th>
			<th>Price</th>
			<th>Size</th>
		    </tr>
		  <xsl:for-each select="catalog/product/catalog_item"> 
		    <tr>
			
			<td><xsl:value-of select="item_number"/></td>
			<td><xsl:value-of select="price"/></td>
			<td><xsl:for-each select="size">
				<xsl:value-of select="@description"/> :
				 <xsl:for-each select="color_swatch">
					<xsl:value-of select="."/> ,(<xsl:value-of select="ceiling(../../price mod 4)"/>)
				 </xsl:for-each><br/>				
				
			</xsl:for-each>
			</td>
		    </tr>
		  </xsl:for-each>
		</table>

		
	  </body>
	</html>
	</xsl:template>
</xsl:stylesheet>
