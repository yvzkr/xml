<?xml version="1.0" encoding="UTF-8"?>
<!-- YAVUZ KURU -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!--<xsl:for-each select="//author[not(.=preceding::*)]">-->

<xsl:template match="/">
 <html>
   <head>
   </head>
   <body style="font-size:15px; font-family:Verdana">
<style>
i, a
{
	color: purple;
	font-size: 19px;
}
</style>
<br/>
	<xsl:apply-templates select="catalog"/>
	<br/><br/>
	<i><xsl:value-of select="count(catalog/book[genre='Computer'])"/></i> books on Computer genre.<br/>
	<i><xsl:value-of select="count(catalog/book[genre='Fantasy'])"/></i> books on Fantasy genre.<br/>
	<i><xsl:value-of select="count(catalog/book[genre='Romance'])"/></i> books on Romance genre.<br/>
	<i><xsl:value-of select="count(catalog/book[genre='Horror'])"/></i> books on Horror genre.<br/>
	<i><xsl:value-of select="count(catalog/book[genre='Science Fiction'])"/></i> books on Science Fiction genre.<br/><br/><br/>


<xsl:variable name="total" select="count(catalog/book)" />
<xsl:for-each select="catalog/book">
<xsl:sort select="publish_date" />
	
	   
	    <xsl:if test="position()=$total">
		The newest book is <i><xsl:value-of select="title"/></i> published on <i><xsl:value-of select="publish_date"/></i> and the author of this book is <i><xsl:value-of select="substring-after(author,',')"/>  <xsl:value-of select="substring-before(author,',')"/></i>.<br/>
	    </xsl:if>
 <xsl:if test="position()=1">	
The oldest book is <i><xsl:value-of select="title"/></i> published on <i><xsl:value-of select="publish_date"/></i> and the author of this book is <i><xsl:value-of select="substring-after(author,',')"/>  <xsl:value-of select="substring-before(author,',')"/></i>.<br/>
	    </xsl:if>
	    
	    
</xsl:for-each>




<br/><br/><br/>

	<strong>List of Computer Books (Ordered by Price):</strong><br/><br/>
	<table border="2">
	<tr>
	   <th>Title of The Book</th>
	   <th>Price</th>
	</tr>
	<xsl:for-each select="catalog/book[genre='Computer']">
	<tr>
	   <td><i><xsl:value-of select="title"/></i></td>
	   <td><i><xsl:value-of select="format-number(price,'$##.###')"/></i></td>
	</tr>

	</xsl:for-each>
	</table>
<br/>




 

   </body>
 </html>

</xsl:template>


<xsl:template match="catalog">
We have <i><xsl:value-of select="count(book)"/></i> books and ..... different authors.<br/>
The total coost of books is: <i><xsl:value-of select="format-number(sum(//price), '$#,###,###.00')"/></i>

</xsl:template>



</xsl:stylesheet>

