# Lili Elbe Digital Archive Encoding Guidelines  
  
_Note: These guidelines define the Lili Elbe digital archive's encoding expectations and customizations of the TEI guidelines as defined in [the project's ODD schema file](https://gitlab.com/ctsdh/lili-elbe-code/blob/master/schema/LEDA_ODD.ODD). These guidelines focus on the encoding of the TEI `<text>` element; therefore, encoders should reference [the project's TEI Header template](https://raw.githubusercontent.com/RJP43/LiliElbe_EngagedLearners/master/ProjectDocs/TEIHeader_Template.xml) for encoding expectations/customizations regarding the `<teiHeader>` element._   
  
## Basic Structural Encoding 
  
The Lili Elbe Digital Archive deals with several different types of texts including: entire books, book sections and chapters, diary entries, magazine and journal articles, and letters. Each of these different text-types require slightly different structuring of the TEI `<text>` element's descendant elements. In this section of the guidelines each text-types' basic structure is defined.   
  
### Texts with Translations  
Any text that has an English translation should have the following  double `<div>` structure surrounding that particular text-type's encoding structure. For example, if encoding a letter that has a translation then first implement this "Texts with Translations" structural markup and then continue with the structural markup specified under the "Letters" text-type heading for the original-language text inside the `<div type="original">` as well as the translated text inside the `<div type="translation">`. _See [German_letter2.xml](https://github.com/RJP43/LiliElbe_EngagedLearners/blob/master/ProjectDocs/archivalMaterials/German_archive/German_letter2/German_letter2.xml) as example._   
  
````
<text>
  <body>  
    <div type="original">
    	<!-- specific text-type encoding structure (i.e. letter, book chapter, etc.) -- >
    </div>
    <div type="translation">
    	<!-- specific text-type encoding structure (i.e. letter, book chapter, etc.) -- >
    </div>
  </body>
</text>
````
  
### Books / Book Sections / Book Chapters   
_See [A1.xml](https://gitlab.com/ctsdh/lilielbe_A1/blob/master/A1.xml) as edition example._ For book sections and single chapters use only the `<text>` element and the `<body>` element. _See [Lili's Foreword](https://github.com/RJP43/LiliElbe_EngagedLearners/blob/master/ProjectDocs/archivalMaterials/German_archive/LiliForward/LiliForeword.xml) as example._  

````
<text>
  <front>
    <!--place any text that appears before the chapter divisions in <front>-->
    
    <!--may contain the following divisions; 
    additional divisions should be kept in the order they appear in the print rendition -->
    
    <div rend="intro"><!--introduction text divided into <p> elements--></div>
    <div rend="loi"><!--list of illustrations--></div>
    <div rend="foreword"><!--foreword text divided into <p> elements--></div>
    
    <!--additional <p> elements should be used for each of the paragraphs in the various divisions
    and/or text sitting directly in <front>-->
  </front>
  
  <body>
    <div rend="chapter" n="#"><!--@n numerical value changes pending on chapter number in book-->
      <head>
        <!--literal chpt title or Roman numeral heading-->
      </head>
      <!--Example: <head>FOREWORD</head>-->
      
      <!--additional <p> elements should be used for each of the paragraphs in the chpt-->
      
    </div>
    
    <!--use multiple div[@rend="chapter"] elements to account for every chpt being encoded from the book-->
    
  </body>
  
  <back>
    <!--place any text that appears after the chpt divisions in <back>;
    additional <p> elements should be used for each of the paragraphs within <back>-->
  </back>
</text>
````  
  
### Journal, Magazine, Newspaper Articles  
  _coming soon_  
  
### Letters  
_See [German_letter2.xml](https://github.com/RJP43/LiliElbe_EngagedLearners/blob/master/ProjectDocs/archivalMaterials/German_archive/German_letter2/German_letter2.xml) as example._  
  
````
<div rend="head">
  <!--letter head; often includes address lines (with <placeName> elements) and date (in <date> elements)-->
</div>
<div rend="body">
  <salute><!--salutation; dear so and so--></salute>
  <!--<p> elements should be used for each of the paragraphs making up the letter body-->
  <closer>
    <salute><!--valediction; best wishes--></salute>
    <signed><!-- transcription of signature in a linked <persName> element-->
  </closer>
</div>
````
    
## Internal Structural Markup  
The following elements exist as `child::` elements of the above text-type specific structural markup.  
  
### Paragraphs  
The `<p>` element can only have the following attribute: `@style` `@rend`  
The contents of the `<p>` element should be the exact text from the original, print rendtion or child:: elements   
  
 **attribute examples**  
 `<p style="pubInfo">Translated from the German by <persName key="stenningHJ">H. J. STENNING</persName></p>`  
 _should only be used to indicate content is publication information_   
   
`<p style="paraText" rend="division">. . . . .</p>` `<p style="paraText" rend="division">– – – –</p>`  
_should mimic Text/Symbols dividing text in original, print rendition; is the p has a @rend it must have the division attribute-value as well as the @style equal to paraText attribute-value_  

`<p style="return"/>`
 _used to indicate there is a carriage return in the original, print rendition; this is the only acceptable self-closing `<p>` element_  
### Collation Paragraphs
_note: Besides letter and diary entries collation IDs for paragraphs are added in the pipeline process transforming to HTML. See [A1/B1 Paragraph Numbering XSLT](https://gitlab.com/ctsdh/lili-elbe-code/blob/master/XSLT_sandbox/numberingParagraphs_MIW_A1andB1.xsl) for example._   
  
`<p style="letter" xml:id="a1c09l01p01">Letter Text</p>`  
`<p style="GreteDiary" xml:id="a1c10d01p01">Diary Text</p>`  
`<p style="LiliDiary" xml:id="a1c18d01p01">Diary Text</p>`

_note: change xml:id attribute-value to match the paragraph collation ID found in the [collation spreadsheets](https://gitlab.com/ctsdh/lili-elbe-code/tree/master/collationSpreadsheets). Every paragraph of each letter has a unique ID reflecting the edition, chapter, letter|diary entry #, and paragraph # (within the letter|diary entry)_
  
### Page and Column Breaks   
### Translation Segmentation  

