<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/">
	<html>
	  <body>

		<table border="2" align="center">
		    <tr>
			<th>Item number</th>
			<th>Price</th>
			<th>Size</th>
		    </tr>
		    <tr>
			<td><xsl:value-of select="catalog/product/catalog_item/item_number"/></td>
			<td></td>
			<td></td>
		    </tr>
		</table>

		
	  </body>
	</html>
	</xsl:template>
</xsl:stylesheet>
