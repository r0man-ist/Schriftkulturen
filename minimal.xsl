<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:t="http://www.tei-c.org/ns/1.0">
    <xsl:template match="/">
        <html>

            <body>
                <xsl:apply-templates/>
            </body>

        </html>

    </xsl:template>



<!--<!-\- render line breaks -\->
    <xsl:template match="t:lb">
        <br>
            <xsl:apply-templates/>
        </br>
    </xsl:template>-->


<!--    <!-\- don't render anything from header -\->
    <xsl:template match="t:teiHeader"/>-->


<!--    <!-\- render unclear text in gray and add tooltip -\->
    <xsl:template match="t:unclear">
        <span style="color: gray;" title="Unklar">
            <xsl:apply-templates/>
        </span>
    </xsl:template>-->
    
    
<!--    <!-\- render unclear text in red and add tooltip -\->
    <xsl:template match="t:supplied">
        <span style="color: red;" title="Fehlender Text ergänzt">
            <xsl:apply-templates/>
        </span>
    </xsl:template>-->

<!--    <!-\- render regularization, don't render original -\->
    <xsl:template match="t:choice/t:reg">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="t:choice/t:orig"/>-->
    
<!--    <!-\- render orig for modernizations, only render reg for typographic changes -\->
    <xsl:template match="t:choice">
        <xsl:choose>
            <!-\- If reg[@type='modernization'] exists, render orig -\->
            <xsl:when test="t:reg[@type='modernization']">
                <xsl:apply-templates select="t:orig"/>
            </xsl:when>
            
            <!-\- Otherwise render reg -\->
            <xsl:otherwise>
                <xsl:apply-templates select="t:reg"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->

</xsl:stylesheet>
