<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:msxml="urn:schemas-microsoft-com:xslt" 
	xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" 
	exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ">

<xsl:output method="xml" omit-xml-declaration="yes" />

<xsl:param name="currentPage"/>

	<xsl:variable name="mediaFolderId" select="number(/macro/imgFolder/Folder/@id)" />
	<xsl:variable name="thumbWidth" select="number(800)"/>
	<xsl:variable name="thumbHeight" select="number(600)"/>

<xsl:template match="/">

<!-- The fun starts here -->
	<xsl:if test="number($mediaFolderId)">
	
    <div id="myCarousel" class="carousel slide">
    <ol class="carousel-indicators">
		<xsl:for-each select="umbraco.library:GetMedia($mediaFolderId, true())/Image">
        	<li data-target="myCarousel" data-slide-to="{position()-1}">&nbsp;</li>
        </xsl:for-each>
    </ol>
        <div class="carousel-inner">
			<xsl:for-each select="umbraco.library:GetMedia($mediaFolderId, true())/Image">
            
            	<div class="item"><img src="/imageGen.ashx?image={umbraco.library:UrlEncode(umbracoFile)}&amp;width={$thumbWidth}&amp;height={$thumbHeight}" width="{$thumbWidth}" height="{$thumbHeight}" alt="{@nodeName}" title="{@nodeName}" />
					<!--div class="carousel-caption">
						<p><xsl:value-of select="current()/@nodeName"/></p>
					</div-->
				</div>
			</xsl:for-each>
        </div>
        <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lt;</a>
        <a class="carousel-control right" href="#myCarousel" data-slide="next">&gt;</a>
    </div>	
	
</xsl:if>

</xsl:template>

</xsl:stylesheet>