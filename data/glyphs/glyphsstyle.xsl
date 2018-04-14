<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0" xmlns:tei="http://www.tei-c.org/ns/1.0">
        <xsl:output omit-xml-declaration="yes" indent="yes"/>
        <xsl:template match="/*">
            <html>
               <body>
                   
                   <table cellspacing="20px" cellpadding="20px" bgcolor="#fff4e6" style="font-family:palatino;">
               
                       <h1 style="text-align:center; font-size:150%;">
                       A Synthetic list of abbreviation phenomena in Agathemerus Manuscripts</h1>
              
                
              <caption style="text-align:left">Disclaimer: this table was made as an external reference list for abbreviations appearing in the witnesses 
              of Agathemerus' "Sketch of Geography", an ensemble of manuscripts dating between the 14th and the 16th century and produced almost 
              entirely in the West. It is not an authority list for abbreviations in Greek manuscripts in general, and it does not provide a canonical reference 
              for the definition of abbreviative phenomena. The definitions used here are specifically functional to the transcription of the manuscripts.
             </caption>
                     
                       <tr style="font-size:120%;">
           
                    <th>Image</th>
                    <th>Appearance</th>
                    <th>Identifier</th>
                    <th>Description</th>
                    <th>Type</th>
                    <th>Position</th>
                    <th>Value</th>
                </tr>         
                <xsl:for-each select="//tei:glyph">
                    <tr>
                        <td><img align="middle" height="100px" width="100px" src="{tei:figure/tei:graphic/@url}"/></td>
                        <td><xsl:value-of select="tei:glyphName"/></td>
                        <td><xsl:value-of select="@xml:id"/></td>
                        <td><xsl:value-of select="tei:note/text()"/></td>
                        <td><xsl:value-of select="tei:note/tei:objectType"/></td>
                        <td><xsl:value-of select="tei:note/tei:offset"/></td>
                        <td><xsl:value-of select="tei:note/tei:expan/tei:ex"/></td>
                    </tr>
                </xsl:for-each>
            </table>
                   <p>Contact information is available at the <a href="https://github.com/ChiaraPalladino/Digital-Agathemerus">Digital Agathemerus GitHub repo</a>.</p>
               </body>
            </html>
        </xsl:template>
        
</xsl:stylesheet>