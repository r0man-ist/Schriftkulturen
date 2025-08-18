<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:t="http://www.tei-c.org/ns/1.0">
    <xsl:template match="/">
        <html>
            <head>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                    rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous"/>

                <link rel="stylesheet" href="./../static/styles.css"/>

            </head>
            <body>
                <div class="row shadow">
                    <div class="col-3 nav-bsw">
                        <a class="nav-link active" aria-current="page" href="#">
                            <img src="./../static/Schriftkulturen.jpg" width="350px"/>
                        </a>
                    </div>
                    <div class="col-9 nav">
                        <div class="lead">Schriftkulturen des Mittelalters in digitaler
                            Perspektive</div>
                        <a class="nav-link" href="#">
                            <img src="./../static/sbb-logo.png" height="50"/>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2 bg-sides"/>
                    <div class="col-8 ">
                        <div class="row text-center">
                            <h1 class="display-1 mt-5 mb-5">
                                <xsl:apply-templates select="//t:teiHeader//t:title"/>
                            </h1>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-8 border rounded-start mb-3 p-3">
                                            <b>Signatur: </b>
                                            <xsl:apply-templates select="//t:teiHeader//t:title"/>
                                            <br/>
                                            <b>Kontext: </b>
                                            <xsl:apply-templates select="//t:teiHeader//t:authority"/>
                                            <xsl:value-of select="//t:publicationStmt/t:p"/>
                                            <br/>
                                            <b>Quelle: </b>
                                            <xsl:apply-templates
                                                select="//t:teiHeader//t:sourceDesc/t:p"/>
                                        </div>
                                        <div class="col-4 border rounded-end mb-3 p-3">TEI
                                            Header</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-8 border rounded-start mb-3 p-3">
                                            <b>Aufbewahrungsort: </b>
                                            <xsl:apply-templates select="//t:body//t:repository"/>
                                                (<xsl:apply-templates select="//t:body//t:idno"/>) <br/>
                                            <b>Titel: </b>
                                            <xsl:apply-templates select="//t:body//t:head/t:title"/><br/>
                                            <xsl:apply-templates select="//t:body//t:head/t:note"/>
                                            <br/>
                                            <b>Autor: </b>
                                            <xsl:variable name="author-url"
                                                select="//t:body//t:msItem/t:author/t:persName/@ref"/>
                                            <a href="{$author-url}"><xsl:apply-templates
                                                  select="//t:body//t:msItem/t:author/t:persName"
                                                /></a>
                                            <br/> <br/>
                                            <b>Inhalt: </b><br/>
                                            <xsl:apply-templates select="//t:body//t:msItem/t:locus"/>
                                            <br/>
                                            <xsl:apply-templates select="//t:body//t:msItem/t:note"/><br/> <br/>
                                            <b>Äußeres:</b> <br/>
                                                <xsl:apply-templates select="//t:body//t:physDesc/t:p"/><br/>
                                            <xsl:apply-templates
                                                select="//t:body//t:supportDesc/t:support"/>
                                            <br/>
                                            <xsl:apply-templates
                                                select="//t:body//t:supportDesc/t:foliation"/>
                                            <br/>
                                            <xsl:apply-templates
                                                select="//t:body//t:layoutDesc/t:layout"/>
                                            <br/>
                                            <xsl:apply-templates
                                                select="//t:body//t:scriptDesc/t:scriptNote"/>
                                            
                                            <table><tr><td><xsl:apply-templates
                                                  select="//t:body//t:decoDesc/t:decoNote"/></td><td>
                                                  <xsl:variable name="image-url"
                                                  select="//t:decoNote/t:locus/@facs"
                                                  /><figure><figcaption><xsl:apply-templates
                                                  select="//t:decoNote/t:locus"/></figcaption><img
                                                  src="{$image-url}" width="300px"
                                                  /></figure></td></tr></table>
                                            <br/>
                                            <xsl:apply-templates
                                                select="//t:body//t:bindingDesc/t:p"/>
                                            
                                            <br/> <br/>
                                            <b>Geschichte: </b><br/>
                                            <xsl:apply-templates
                                                select="//t:body//t:history/t:origin"/>
                                            <br/>
                                            <xsl:apply-templates
                                                select="//t:body//t:history/t:provenance"/>
                                            <br/>
                                            <xsl:apply-templates
                                                select="//t:body//t:history/t:acquisition"/>
                                            <br/><br/>
                                            <b>Literatur: </b>
                                            <ul><xsl:for-each
                                                  select="//t:body//t:additional/t:listBibl/t:bibl"
                                                  ><li><xsl:apply-templates select="."
                                                  /></li></xsl:for-each></ul>
                                        </div>
                                        <div class="col-4 border rounded-end mb-3 p-3">TEI
                                            Body</div>
                                    </div>


                                    <div class="row">
                                        <div class="col-8 border rounded-start mb-3 p-3">
                                            <xsl:for-each select="//t:persName">
                                                <xsl:variable name="GND-Url" select="./@ref"/>
                                                <a href="{$GND-Url}">
                                                  <xsl:value-of select="."/>
                                                  <br/>
                                                </a>
                                            </xsl:for-each>
                                        </div>
                                        <div class="col-4 border rounded-end mb-3 p-3">Linked Open
                                            Data</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 bg-sides"/>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"/>
            </body>

        </html>

    </xsl:template>







</xsl:stylesheet>
