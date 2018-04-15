# Digital Agathemerus Guidelines

## BASIC TEMPLATE

#### The Header
* **xml:id**

Each file has an **@xml:id** that contains an identifier, a lower dash and the language of the transcription. This id is the same as the file, which also contains the .xml ending.   

In the case of editions, name of the main **editor_language**    
In the case of manuscripts, main ms **identifier_language**  
The language code is indicated according to the CTS requirements. We use gr for Greek, lat for Latin, eng for English.  

E.g.  

```xml
<TEI xmlns="http://www.tei-c.org/ns/1.0" xml:id="tennulius_gr">
```
Corresponds to **tennulius_gr.xml** in the relative folder.  

### fileDesc: title Statement

The titleStmt is the same for each file: it contains the name of the text transcribed, the main responsibles and the Catalog reference to the author, Agathemerus (http://data.perseus.org/catalog/urn:cts:greekLit:tlg0090).  

The responsibles of the project and other eventual collaborators are indicated with an **@xml:id** made by their initials.  

```xml
    <teiHeader>

        <fileDesc>

            <titleStmt>

                <title xml:lang="lat">Geographiae Informatio</title>

                <author ref="http://data.perseus.org/catalog/urn:cts:greekLit:tlg0090"

                    >Agathemerus</author>

                <author role="editor"/>

                <author role="translator"/>

                <sponsor>University of Leipzig</sponsor>

                <sponsor>Università degli Studi di Bari Aldo Moro</sponsor>

                <respStmt>

                    <persName xml:id="CP">Chiara Palladino</persName>

                    <resp>Editor</resp>

                </respStmt>

                <respStmt>

                    <persName xml:id="MB">Monica Berti</persName>

                    <resp>Supervisor</resp>

                </respStmt>

                <respStmt>

                    <persName xml:id="GC">Gregory Crane</persName>

                    <resp>Supervisor</resp>

                </respStmt>

                <respStmt>

                    <persName>Pasquale Massimo Pinto</persName>

                    <resp>Supervisor</resp>

                </respStmt>

            </titleStmt>

```
            

#### fileDesc: publication Statement

The **publicationStmt** is the same for every file, except for the `<idno>` element.  

It contains the details about the licence of the texts provided, which is always Creative Commons ShareAlike 4.0, and the publisher, which is the University of Leipzig.  

The `<idno>` element contains the id of the file as declared in the TEI header, + .xml.  

So for example: if @xml:id=”tennulius_gr” then `<idno type=”filename”>tennulius_gr.xml</idno>`    

```xml
		<publicationStmt>

                <authority/>

                <idno type="filename">tennulius_gr.xml</idno>

                <authority>University of Leipzig</authority>

                <availability>

                    <licence target="https://creativecommons.org/licenses/by-sa/4.0/"> Available

                        under a Creative Commons Attribution-ShareAlike International 4.0

                        License</licence>

                </availability>

                <date>2015</date>

                <publisher>University of Leipzig</publisher>

                <pubPlace>Germany</pubPlace>

        </publicationStmt>
```

#### fileDesc: source Description

SourceDesc contains all the details about the source being transcribed. It can be either a manuscript or an edition/translation.  

* Editions/translations:  

We encode everything inside a `<listBibl>` with the language of the book, and inside a `<biblStruct>` element. Each edition is identified as `<monogr>`.  

```xml
<sourceDesc>

                <listBibl xml:lang="lat">

                    <biblStruct>

<monogr>```


The `<title>` of the edition has to be the same as reported on the main title page of the original book. If there is a double or triple title, possibly in different languages, they should be transcribed as they appear, with an additional @xml:lang attribute.  

```xml
<title xml:lang="grc">ΑΓΑΘΗΜΕΡΟΥΣ τοῦ Ὄρθωνος Ὑποτυπώσεων Γεωγραφίας ἐν ἐπιτομῇ ΒΙΒΛΊΑ ΔΎΟ.</title>

<title xml:lang="lat">AGATHEMERIS Orthonis filii Compendiariæ Geographiæ expositionum Libri Duo.</title>

<title type="subtitle">Cura et Interpretatione Samuelis Tennulii</title>
```

The `<editor>` has an @xml:id assigned, which corresponds to his initials: e.g. Samuel Tennulius -> xml:id=”ST”. This id will then be used to refer to this editor each time. Possible additional forms of the name can be encoded in an `<addName>` with an additional @xml:lang.  

The editor is identified with a canonical @ref attribute which links to the relevant viaf.org permalink.  

```xml
                            <editor xml:id="ST" ref="http://viaf.org/viaf/102332296">

                                <persName>

                                    <name xml:lang="lat">Samuel Tennulius</name>

                                    <addName xml:lang="nl">Samuel Ten Nuyl</addName>

                                    </persName>

                            </editor>

```

The `<author>` refers to the ancient author, identified with a Catalog URI. `<imprint>`contains informations about the publisher and the year.  

```xml
<author ref="http://data.perseus.org/catalog/urn:cts:greekLit:tlg0090">Agathemerus</author>
```

```xml 					
							 <imprint>

                                <publisher>Ambroise-Firmin Didot</publisher>

                                <pubPlace>Paris, France</pubPlace>

                                <date>1861</date>

                            </imprint>
```

In case the edition is a multi-volume book, we use `<biblScope unit=”volume”>` to indicate the number of the volume. The number of the volume is indicated in Arabic digits. For example:  

```xml
<biblScope unit="volume">2</biblScope>
```  

After the `</monogr>` element, a `<ref>` is added containing a link to the digitized book, if available.  

```xml
<ref target="  http://www.mdz-nbn-resolving.de/urn/resolver.pl?urn=urn:nbn:de:bvb:12-bsb11088603-0">BSB
</ref>
```


### Manuscripts:

Information on the support is contained in the `<listBibl>`, where the appropriate `<msDesc>` is nested.  

```xml
 <sourceDesc>
	 <listBibl>
		<msDesc>

```

`<msIdentifier>`: describes the manuscript encoded in its main characteristics. Each manuscript is assigned an @xml:id corresponding to the traditional siglum -> xml:id=”B” (Vatopedi codex)[1]. This identifier will be used for the apparatus/stemma/commentary, instead of the individual id of each msFrag (see below). `<msIdentifier>` can contain a `<msName>`, where the colloquial name of the ms. is indicated:  

```xml
    <msDesc>
		<msIdentifier>
			<msName xml:lang="lat" xml:id="B">Codex Vatopedinus</msName>
```

Or it can be a pure identifier, with the specifications of the manuscript:

```xml
	<msIdentifier xml:id="Monacensis_287">
		<settlement>Munich</settlement>
		<repository>Bayerische Staatsbibliothek</repository>
		<collection>Graeci</collection>
		<idno>Monac. Gr. 287</idno>

  	</msIdentifier>
```

In case the manuscript is scattered in different exemplars, as in the Vatopedinus codex, each part is indicated through the `<msFrag>` element (http://www.tei-c.org/release/doc/tei-p5-doc/en/html/MS.html#msfg), and indicated with its own @xml:id. The pages in the text containing Agathemerus and corresponding to the original ensemble are provided through a generic `<summary>` contained in the `<msContents>` (see below), while the locus of the text now identified with the new pagination, where the text of Agathemerus can be found, is provided within a `<msItem><locus>` element.  

```xml
          <msFrag>

                        <msIdentifier xml:id="Vatopedinus_655">

                            <settlement>Mount Athos</settlement>

                            <repository>Monastery Library of Vatopedi</repository>

                            <idno>Vatop. 655</idno>

                        </msIdentifier>

                        <msContents>

                            <summary>Contains ff. 55r to 69r </summary>

                        </msContents>

                    </msFrag>

                    <msFrag>

                        <msIdentifier xml:id="Lond_Add_19391">

                            <settlement>London</settlement>

                            <repository>British Library</repository>

                            <collection>Manuscript Additional</collection>

                            <idno>MS Add. 19391</idno>

                        </msIdentifier>

                        <msContents>

                            <summary>Contains ff. 1r to 3r; 4v to 13r</summary>

             

                            <msItem>             <!-- here we identify the location of Agathemerus' work in the manuscript -->

                                <locus>3r l.10 – 4r l.28</locus>

                                <author>Agathemerus</author>

                                <title xml:lang="grc">Ἄγαθημέρου τοῦ ὄρθωνος γεωγραφίας

                                    ὑποτύπωσις</title>

                            </msItem>

                        </msContents>

                    </msFrag>

                   

                    <msFrag>

                        <msIdentifier xml:id="Paris_Supp_443Α">

                            <settlement>Paris</settlement>

                            <repository xml:lang="fr">Bibliothéque Nationale</repository>

                            <collection xml:lang="fr">Supplément Grec</collection>

                            <idno>Paris. Gr. Suppl. 443A</idno>

                        </msIdentifier>

                        <msContents>

                            <summary>Contains ff. 4v to 13r</summary>

                            <msItem>

                                <locus>2r ll.1-4</locus>

                                <author>Agathemerus</author>

                                <title xml:lang="grc">Ἄγαθημέρου τοῦ ὄρθωνος γεωγραφίας

                                    ὑποτύπωσις</title>

                            </msItem>

                        </msContents>

                    </msFrag>
```

In this case, multiple pieces of the same manuscript are transcribed in the same file. When the text of a new piece begins, provisionally we use the `<milestone>` element, adding a @unit indication for the manuscript. The new manuscript is referred to by means of a `<ref target=””>` which points to the identifier given in the `<msFrag>`; an additional @n attribute indicates the urn of the text.

```xml
           <milestone unit="manuscript"/>

           <ref target="#Paris_Supp_443Α" n="urn:cts:greekLit:tlg0090.tlg001.opp-grc2"/>
```

If the text is preserved in one single witness, we just use `<msContents>` to indicate where Agathemerus is preserved.  
`<msItem>` contains information about where the text is found in the manuscript, number of the pages, etc.  
The pages where the text is found are encoded in a `<locus>` element.  
`<author>` and `<title>` of the work as it is found in the manuscript.    

```xml
        <msContents>

			<msItem>

                <locus>3r l.10 – 4r l.28</locus>

                <author>Agathemerus</author>                               

                <title xml:lang="grc">Ἄγαθημέρου τοῦ ὄρθωνος γεωγραφίας ὑποτύπωσις·</title>

            </msItem>

         </msContents>

```

In the case of fragmentary witnesses, the `<msItem>` is used to document the particular situation. There can be several instances:  

An excerpt of Agathemerus is preserved in the witness, isolated (with or without a title indicating its author and provenance).  
In this case, we simply record the location and presence of the fragment, indicating Agathemerus as the author and the conventional name of the fragment (e.g. Excerptum J):  

```xml
		<msItem>

        	<locus>f. 76v</locus>

            <author>Agathemerus</author>

            <title xml:lang="lat">Excerptum J De Maribus</title>


		</msItem>
```

An excerpt of Agathemerus is preserved in another work, with no indication of its provenance.  
This is the specific case of the Excerpta J and K. [a] We use several `<msItem>` elements, indicating the location of the bigger work (e.g. Johannes Damascenus), and the location of the fragments, which are indicated as Excerpta J.

```xml
        <msItem n="1">

              <locus></locus>

              <author xml:lang="lat">Johannes Damascenus</author>

              <title xml:lang="lat">Expositio Fidei Orthodoxae</title>

		</msItem>

		<msItem n="2">

              <locus>ff. 7r - 8v</locus>

              <author>Agathemerus</author>

              <title xml:lang="lat">Excerpta J</title>

</msItem>

<msItem n="3">

<locus>ff. 7r - 8v</locus>

                                <author>Claudius Ptolemaeus</author>

                                <title xml:lang="lat">Geographia VIII.29</title>

</msItem>
```
 

When the fragments are scattered across several pages, we add the `<locusGrp>` element.  

```xml
                       <msItem n="1">   

                                <locusGrp>

                                    <locus>ff. 89v-90r</locus>

                                    <locus>f. 91r</locus>

                                    <locus>ff. 92v-93r</locus>

                                </locusGrp>

                                <author>Agathemerus</author>

                                <title xml:lang="lat">Excerpta J</title>

                       </msItem>

                       <msItem n="2">

                                   <locus>ff 40v-137v</locus>

                                   <author xml:lang="lat">Johannes Damascenus</author>

                                   <title xml:lang="lat">Expositio Fidei Orthodoxae</title>

                        </msItem>
```

An excerpt of Agathemerus is preserved isolated, but indicated as from another work (generally John of Damascus).  
In this case, we encode Agathemerus as the author but add the indication “Excerpta ex” according to how the excerpts are indicated in the ms. An additional `<note>` clarifies the identity of the Excerpts.  

```xml
<msItem>

                        <locus>ff. 299r-300v</locus>

                        <author>Agathemerus</author>

                        <title xml:lang="lat">Excerpta ex Johanne Damasceno</title>

                        <note>Contains Excerpta J De Maribus and Excerpta J De Populis</note>

                </msItem>

```

`<physDesc>` indicates the essential features of the manuscript. It has to include at least description of the material (`<supportDesc>`), extent (possibly with indication of an external bibliographical source), and description of the hands (`<handDesc>`), possibly with a note explaining the identity of the copyst (e.g. “This manuscript was copied by Nikolaos Sophianos”).  

```xml
<physDesc>

 <objectDesc>

         <supportDesc material="parch">

<extent>

<measure type="composition" unit="leaf" cert="medium">300</measure>

<dimensions>

  <height unit="cm">35</height>

  <width unit="cm">25</width>

</dimensions>

</extent>

<collation>

<p>quaternion</p>

</collation>

 </supportDesc>


</objectDesc>

<handDesc hands="1">

<handNote xml:id="M1" scope="major"/>

</handDesc>

</physDesc>

```

An additional `<history>` description may be added.  

```xml
                <history>


                        <origin>

                            <origPlace/>

                            <origDate/>

                        </origin>


                        <acquisition/>


                    </history>
```

If scans of the manuscript are publicly available, we add a `<bibl>` element pointing to the stable identifier of the manuscript, possibly of the page:  

```xml
<bibl>

<ref target="http://gallica.bnf.fr/ark:/12148/btv1b10722331q">Gallica.BnF

</ref>

</bibl>
```

**Xi:include** for authority lists:  
For recording abbreviations, compendia, contractions and special symbols, we use the reference file glyphs.xml. It contains an ongoing catalogue of glyphs representing various abbreviative phenomena, including images.  

Glyphs.xml should be referenced in the working transcription with the following namespace added to the initial `<TEI>` declaration:  

```xml
<TEI xmlns="http://www.tei-c.org/ns/1.0"  xml:id="cantabrigensis_gr" xmlns:xi="http://www.w3.org/2001/XInclude">
```

The reference file should then be included before the `<encodingDesc>` declaration and after the `<fileDesc>`:

```xml
        </fileDesc>

                <xi:include href="file:/Users/Chiara/Dropbox/AGATEMERO/Manuscripts/Glyphs/glyphs.xml"/>

                <encodingDesc>
```

This reference will activate the list of glyphs automatically, and they will be indicated in the transcription with `<g ref=””>` and the name of the glyph.

### encodingDesc: projectDesc
Contains all the relevant information about the project and the citation scheme declaration.  

`<projectDesc>` contains the title of the project.  

`<refsDecl>` contains the citation scheme, which in this case follows the Canonical Text Reference of CTS. We made up a citation scheme specifically for this work, following the main reference edition, Müller’s Geographi Graeci Minores.  

```xml
<encodingDesc>

            <projectDesc>

                <ab>

                    <title>Agathemerus' Sketch of Geography: from Manuscript to Digital</title>

                </ab>

            </projectDesc>

            <p>The following text is encoded in accordance with EpiDoc standards and with the

                CTS/CITE Architecture.</p>


            <refsDecl n="CTS">

                <cRefPattern n="section" matchPattern="(.+).(.+)"

                    replacementPattern="#xpath(/tei:TEI/tei:text/tei:body/tei:div/tei:div[@n='$1']/tei:div[@n='$2'])">

                    <p>This pointer pattern extracts chapters and sections</p>

                </cRefPattern>

                <cRefPattern n="chapter" matchPattern="(.+)"

                    replacementPattern="#xpath(/tei:TEI/tei:text/tei:body/tei:div/tei:div[@n='$1'])">

                    <p>This pointer pattern extracts chapters</p>

                </cRefPattern>

            </refsDecl>

        </encodingDesc>

```

### profileDesc and revisionDesc

`<profileDesc>` provides an identification code for the languages, mainly “lat” for Latin and “grc” for Greek, according to the standards of the Perseus Catalog.  

`<revisionDesc>` contains detailed information about changes happened in the files and about the responsible, who is mainly indicated with his/her @xml:id.  

```xml
<profileDesc>

            <langUsage>

                <language ident="lat">Latin</language>

                <language ident="grc">Greek</language>

            </langUsage>

        </profileDesc>


        <revisionDesc>

            <change who="CP" when="2016-08-28">proofread the file, placed pagebreaks and revised the markup for chapter titles</change>

           

            <change who="CP" when="2016-08-25">added pagebreaks</change>

           

            <change who="CP" when="2016-08-20">Proofread the file</change>

            <change who="CP" when="2016-08-15">Created the XML file</change>

        </revisionDesc>
```


## TEXT SECTIONS

As usual, the text is encoded inside a `<text>` and `<body>` header.

```xml
<text>

        <body>

            <div type="edition" n="urn:cts:greekLit:tlg0090.tlg001.opp-grc5"

                xml:lang="grc">

                <!-- text correctly updated and cataloged -->

                <div type="textpart" subtype="chapter" n="1">

                    <div type="textpart" subtype="section" n="1">

                     <p>
```

The first `<div>` provides information on the edition and Catalog reference:  

* @type : can be “edition” or “translation”. Currently we don’t have a specification for manuscripts, so we provisionally identify them as “edition”.
* @subtype : can be used for manuscripts, to identify whether the transcription is diplomatic or not.
* @xml:lang : grc for Greek (original text), lat for Latin, eng for English (translations)
* @n : provides the CTS URN for the single edition or translation, and is followed by a comment indicating whether the URN is already available and if it has been correctly cataloged.  

We decided to use the `<div>` element for each numbered division of the text, instead of numbering the `<p>` element, because paragraphs often appear in different quantity across manuscripts. Therefore, we consider the `<div>` an editorial element (useful for further processing and comparison), while the `<p>` reproduces a division of the source.


## Transcription:

Each section of the text is encoded inside a `<p>` and a `<div>` element.  

According to the citation reference chosen, we have two @subtype of `<div>` with the relative reference number: “chapter” for the main sections of the work (those with numbers and titles) and “sections” for the minor sections of the work (those for which only a number has been provided by Müller).  

```xml
 <div type="textpart" subtype="chapter" n="1">

                    <div type="textpart" subtype="section" n="1">

                        <p>
```


### Titles

#### Main title repeated
Some older editions have the main title of the work repeated several times before the actual text begins. We encode everything as a `<title>` element inside a `<head>`, specifying the type of title provided.  
 
```xml
<head>

                   <title type="main">ἈΓΑΘΗΜΕΡΟΥ ΤΟΥ ὌΡΘΩΝΟΣ ΓΕΩΓΡΑΦΊΑΣ ὙΠΟΤΎΠΩΣΙΣ</title>

                </head>


 <head>

                    <title type="main" xml:lang="grc">ΑΓΑΘΗΜΕΡΟΥΣ τοῦ Ὄρθωνος Τῆς Γεωγραφίας ὑποτυπώσεων ἐν ἐπιτομῇ Πρὸς Φίλωνα</title>

                    <title type="subtitle" xml:lang="grc">ΒΙΒΛΙΟΝ ΠΡΩΤΟΝ.</title>

                    <title type="main" xml:lang="lat">AGATHEMERIS Orthonis filii Compendiariæ Geographiæ expositionum ad Philonem</title>

                    <title type="subtitle" xml:lang="lat">LIBER PRIMUS.</title>

                    <title type="subtitle" xml:lang="lat">Cura et interpretatione Samuelis Tennulii</title>

                </head>

``` 


#### Chapter titles

In the case of Agathemerus, since the editio princeps by S. Tennulius, editors have (more or less arbitrarily) added names to the single chapter. Since they are not ancient titles but have been supplied by editors, we incorporate them into a `<supplied>` element inside a `<head type=”title”>`. The @reason is indicated as “explanation” and the @resp is also indicated by providing the xml ID for the editor who has provided the title first (essentially Tennulius). 

```xml
 <head type="title">

                            <supplied reason="explanation" resp="#ST">
```

#### Other relevant text divisions:

`<milestone>` is used only when absolutely necessary, when another relevant section division is used in an edition; they must be indicated with the @unit and @n attributes. This division tends not to be repeated in the translations.  

`<pb>` pagebreaks are recorded in editions and translations before the closing `</p>` element or when relevant inside the text. When they occur inside a word, we add @break=”no”


### Editorial interventions: manuscripts

Generally, we try to transcribe the text of a manuscript witness with minimum intervention. Scribal errors and spelling phenomena, such as iotacism, should be left unvaried, as they contribute to the identification of conjunctive and disjunctive errors.  

It is recommended to record the graphical phenomena of the most important manuscripts as accurately as possible. Especially for those, whose images cannot be published openly online, it is crucial to represent the text as much faithfully as possible to its original appearance. For other manuscripts, where the images can be directly linked by means of the @facs attribute, it is not necessary to be as scrupulous. Relevant graphical phenomena should, however, always be recorded.  

Abbreviations and glyphs should always be expanded. By referencing to the glyph.xml authority list, we expand abbreviated words in the following way:    

```xml
<expan>

<abbr>visible part of the word</abbr>

<am><g ref='#abbr1'/></am>

<ex>expansion of the abbreviation as reconstructed by the editor</ex>

</expan>
```

Although the `<g>` element provides options for expansion, it is essential to record the expansion as it is reconstructed from the context, as one abbreviation often has multiple expansions.  

Cases of tachygraphy, compendia and conventional signs, where one symbol is used for an entire word, are encoded in the following way:  

```xml
<expan>

<am><g ref='#tach2'/></am>

<ex>δὲ</ex>

</expan>        
```

Numbers: in manuscripts, usually the most relevant indicator for numbers is a supraline. Provisionally we encode this situation in this way:  

```xml
<num>

        <hi rend="supraline">

        </hi>

</num>
```

Titles written in a particular way that makes them distinct: various options in the `<hi>` element

```xml
<hi rend="tall"/>

<hi rend="normal" style="red-ink">
```

Superscript characters should be indicated:  

```xml
                        <hi rend="superscript">αν</hi>
```

Ambiguous characters in the source, that can be interpreted in various ways:

```xml
<choice>

        <unclear>option 1</unclear>

        <unclear>option 2</unclear>

</choice>
```

Correction of the copyist, when both the wrong and the corrected texts are visible: it is encapsulated in a `<subst>` element. `<add place>` indicates where the correction was made on the page.  

```xml
        <subst>

                <del rend="corrected">Wrong text</del>

                <add place="overstrike">New text added above the wrong text</add>

</subst>

```

If the previous text is not visible, the encoding should simply be:

```xml
                <add place="overstrike">New text added above the wrong text</add>
```

Other frequent situations:  
* Letters added by the copyst: `<add place="above"/>`
* Space intentionally left blank by the copyist: `<space quantity="" unit="character"/>` 
* Erasure: `<del rend="erased"></del>`

### Editorial interventions: editions

Wrong characters due to spelling and language variations are encoded only when they are relevant to the dating or history of the manuscript. Otherwise they are only registered in the diplomatic transcription (when the latter is very necessary, I provide it in a separate file indicated as “diplomatic”).  

```xml

                         <choice>

                                    <reg>τιμὴν</reg>

                                    <orig>τειμην</orig>

                                </choice>

```

Erroneous characters corrected by the transcriber: (`<corr>` indicates the correct version, `<sic>` the character as appearing in the ms).

```xml
                         <choice>

                                     <corr>ἀμπελικοῦ</corr>

                                     <sic>ἀμπελικὸν</sic>

                                    </choice>
```

Abbreviations: we always expand abbreviations.  
Usual abbreviations with no additional abbreviating symbol or glyph:  

```xml
                 <expan>

                                    <abbr>τ</abbr>

                                    <ex>ῆς</ex>

                                </expan>

```

Abbreviations indicated by a symbol or glyph: usually there is no way to specify the type of glyph, so we use a general `<g/>` element to indicate its presence.  
                        
```xml
                <expan>

                        <abbr>

                <!-- word as visible in the ms -->

                                <am>

<!-- symbol for the abbreviation, optionally with <g/> -->

                                </am>

                        </abbr>

                        <ex>

                <!-- expanded abbreviation -->

                        </ex>

</expan>
```

**Integration**: in editions that reprint previous texts, we also use the @resp attribute, indicating the xml ID of the editor who made the correction.  
**@evidence** : is indicated as “parallel” in case there is another manuscript providing the text, either from the direct or indirect tradition (e.g. the excerpta). It can also be “previouseditor” if the gap has been filled by another editor (although technically this value indicates a text that was visible to a previous editor).  
**@reason** : can be “lost” only in very selected cases, i.e. when the text is lost on the physical support (if specified by the editor himself), otherwise it has to be “omitted”.  

```xml
<supplied reason="lost/omitted" evidence="parallel" resp="#ST"/>
```

**Lacunae stated by editors**: Are indicated by a `<gap>` element.  
**@reason** is frequently a generic “omitted”, unless it has been specified by the editor that the text is “lost”, i.e. no longer visible on the support.  
**@extent** in older editions it is frequently impossible to measure, therefore it will be probably “unknown”, unless differently stated.  
**@resp** can be added in case the lacuna was individuated by a previous editor, together with the relative xml ID.  

```xml
<gap reason="omitted" extent="unknown" resp="#ST"/>
```

**Deletion**: `<del>`. Should be indicated with the ID of the @resp. Has to be indicated with the @evidence (mainly “conjecture”, but can also be “internal” or “external”).

```xml
                         <del resp="#AD" evidence="conjecture">
```

**Typographic errors**: usually they are silently corrected, the original form can be indicated in a comment.  

```xml
                <corr>ἡ</corr>μῶν
                ```

**Variant readings** indicated in the margins, or somewhere in the layout of a manuscript or printed edition: When this happens, usually the editor has indicated the witness reporting the variant reading, which should also be declared in the `<filiation>` element following the Manuscript description (@type=”antigraph”). This witness should be recalled when referring the variant reading.  
  
Usually the editor responsible also adds a brief note, which should be encoded with the attribute @resp, @xml:lang and @resp.  

```xml
<app>

<rdg><hi rend="supraline">ψη</hi></rdg>

<rdg wit="#Altempsianus"><hi rend="supraline">ψη<hi rend="superscript">κ</hi></hi></rdg>

<note resp="#H1" place="margin" xml:lang="lat">sic in Alt.</note>

</app>
```
        

Generally the first `<rdg>` element refers to the reading actually appearing in the text. The following elements follow the order of appearance. In case of multiple readings, we use a `<rdgGrp>`

### SPECIAL CHARACTERS IN THE GREEK TEXT

* Numbers: Apices
Greek numbers are generally indicated with an Upper and/or a Lower numeral sign.  

ʹ = Unicode Character U+0374 http://www.fileformat.info/info/unicode/char/0374/index.htm 

* Numbers: Pedices
͵ = Unicode Character U+0375 http://www.fileformat.info/info/unicode/char/0375/index.htm 

* Apostrophe:  
Apostrophe is not consistently indicated in current XML for Greek and there are several equivalent symbols for it, which should not affect textual research (in principle). However, we’d like some consistency throughout the edition, so we will use the Unicode APOSTROPHE entity:

                ' (same place of Latin apostrophe on the Mac Greek keyboard)

                Unicode Character U+0027 (http://www.fileformat.info/info/unicode/char/0027/index.htm)

* Greek Psili (combining comma above) is also accepted, e.g. in the Nemo edition of Agathemerus: ᾿ (http://www.fileformat.info/info/unicode/char/0313/index.htm).

* Separators: ˙, •, lemnisks, asterisks. Generally, we try to be as faithful to the original text as possible. If the scribe uses the upper point, we will use the upper point (aka semi-column), if the scribe uses other types of separators, such as lemnisks, asterisks, variously combined dashes, etc., we will try to render them.  


[1] There will be cases where it is not necessary to indicate a siglum, e.g. in fragmentary mss. In that case, the ID will be the name of the manuscript and its number, separated by a _. E.g. xml:id=”Parisinus_1739”.
[a] the fragments will be more precisely indicated with xml:ids, that will be used in the transcription to indicate the beginning and end.