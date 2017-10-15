<?xml version="1.0" encoding="UTF-8"?>
<!-- YAVUZ KURU -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!--<xsl:for-each select="//author[not(.=preceding::*)]">-->

<xsl:template match="/">
 <html>
   <head>
   </head>
   <body>

<br/>
	We have <xsl:value-of select="count(catalog/book)"/> books and ..... different authors.<br/>
	The total coost of books is <xsl:value-of select="format-number(sum(catalog/book/price), '$#,###,###.00')"/>
	<br/><br/>
	<xsl:value-of select="count(catalog/book[genre='Computer'])"/> books on Computer genre.<br/>
	<xsl:value-of select="count(catalog/book[genre='Fantasy'])"/> books on Fantasy genre.<br/>
	<xsl:value-of select="count(catalog/book[genre='Romance'])"/> books on Romance genre.<br/>
	<xsl:value-of select="count(catalog/book[genre='Horror'])"/> books on Horror genre.<br/>
	<xsl:value-of select="count(catalog/book[genre='Science Fiction'])"/> books on Science Fiction genre.<br/><br/><br/>


<xsl:variable name="total" select="count(catalog/book)" />
<xsl:for-each select="catalog/book">
<xsl:sort select="publish_date" />
	
	   
	    <xsl:if test="position()=$total">
		The newest book is <xsl:value-of select="title"/> published on <xsl:value-of select="publish_date"/> and the author of this book is <xsl:value-of select="substring-after(author,',')"/>  <xsl:value-of select="substring-before(author,',')"/>.<br/>
	    </xsl:if>
 <xsl:if test="position()=1">	
The oldest book is <xsl:value-of select="title"/> published on <xsl:value-of select="publish_date"/> and the author of this book is <xsl:value-of select="substring-after(author,',')"/>  <xsl:value-of select="substring-before(author,',')"/>.<br/>
	    </xsl:if>
	    
	    
</xsl:for-each>

<xsl:value-of select="(catalog/book/publish_date)[last()]"/>


<br/><br/><br/>

	<strong>List of Computer Books (Ordered by Price):</strong><br/><br/>
	<table border="2">
	<tr>
	   <th>Title of The Book</th>
	   <th>Price</th>
	</tr>
	<xsl:for-each select="catalog/book[genre='Computer']">
	<tr>
	   <td><xsl:value-of select="title"/></td>
	   <td><xsl:value-of select="format-number(price,'$##.###')"/></td>
	</tr>

	</xsl:for-each>
	</table>
<br/>

<xsl:apply-templates select="catalog"/>


 

   </body>
 </html>

</xsl:template>


<xsl:template match="catalog">
<u><em><xsl:value-of select="count(book)"/></em></u>
</xsl:template>

</xsl:stylesheet>

