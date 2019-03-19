# Lili Elbe Digital Archive Encoding Guidelines  
  
_Note: These guidelines define the Lili Elbe digital archive's encoding expectations and customizations of the TEI guidelines as defined in [the project's ODD schema file](https://gitlab.com/ctsdh/lili-elbe-code/blob/master/schema/LEDA_ODD.ODD). These guidelines focus on the encoding of the TEI `<text>` element; therefore, encoders should reference [the project's TEI Header template](https://raw.githubusercontent.com/RJP43/LiliElbe_EngagedLearners/master/ProjectDocs/TEIHeader_Template.xml) for encoding expectations/customizations regarding the `<teiHeader>` element._   
  
## Basic Text-Type Structural Encoding 
  
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
Before adding additional encoding beyond the generic basic documenting structuring please be sure your XML file is [associated to the project schema](https://github.com/RJP43/LiliElbe_EngagedLearners/wiki/Schematizing-XML:-TEI-and-Project-Constraints#lili-elbe-digital-archive-schema), saved, and uploaded to your text's respective GitHub or Gitlab folder.
  
The following elements exist as `child::` elements of the above text-type specific structural markup.  
  
### Paragraphs  
The `<p>` element can only have the following attribute: `@style` `@rend`.    
The contents of the `<p>` element should be the exact text from the original, print rendtion or child:: elements.   
  
 **Examples of Acceptable Attributes and Attribute-Values**    
   
 `<p style="pubInfo">Translated from the German by <persName key="stenningHJ">H. J. STENNING</persName></p>`  
 _should only be used to indicate content is publication information_   
   
`<p style="paraText" rend="division">. . . . .</p>` `<p style="paraText" rend="division">– – – –</p>`  
_should mimic Text/Symbols dividing text in original, print rendition; is the p has a @rend it must have the division attribute-value as well as the @style equal to paraText attribute-value_  

`<p style="return"/>`
 _used to indicate there is a carriage return in the original, print rendition; this is the only acceptable self-closing `<p>` element_  
### Collation Paragraphs
_note: Besides letter and diary entries collation IDs for paragraphs are added in the pipeline process transforming to HTML. See [A1/B1 Paragraph Numbering XSLT](https://gitlab.com/ctsdh/lili-elbe-code/blob/master/XSLT_sandbox/numberingParagraphs_MIW_A1andB1.xsl) for example._   
  
`<p style="letter" xml:id="a1c00l00p00">Letter Text</p>`  
`<p style="GreteDiary" xml:id="a1c00d00p00">Diary Text</p>`  
`<p style="LiliDiary" xml:id="a1c00d00p00">Diary Text</p>`

_note: change xml:id attribute-value to match the paragraph collation ID found in the [collation spreadsheets](https://gitlab.com/ctsdh/lili-elbe-code/tree/master/collationSpreadsheets). Every paragraph of each letter has a unique ID reflecting the edition (a1 | b1 | g1 | d1 | tr |ts), chapter, letter|diary entry #, and paragraph # (within the letter|diary entry)_  
  
### Page and Column Breaks  
  
**Recurring Page Headers**  
`<pb style="heading" rend="MIW"/>`   
`<pb style="heading" rend="Introduction"/>`   
`<pb style="heading" rend="Foreword"/>`   
  
**Page Numbers**
_When a page number literally appears in the original, print rendition capture it with the following encoding:_    
`<pb style="page" n="v"/>`  
   
`<pb style="page" n="16"/>`  
  	
_Capture artificial page numbers (either of the Word Document transcriptions or implied when text continues on a new page) with the following encoding:_   
`<pb n="18"/>`  
  
_In articles, there are sometime columns. At the end of each column use the `<cb/>` self-closing element with the `@n` attribute and attribute-value matching the number of column break it is._    
`<cb n="#"/>`  
    
### Translation Segmentation  
  
_note: For smaller texts like letters and diary entries, we are linking shorter segments of text so as to better align the transcription and translation when transformed into HTML. With larger prose text, segments tend to be longer but never longer than a single paragraph again to try to keep the alignment between transcription and translation as clear as possible._  
  
**Steps for Linking Transcription and Translation**  
1.  Determine text divisions based on side-by-side translations.  _(sentences or paragraphs)_  
2.  Wrap segment in original text in a `<seg>` element. _`<seg>` elements should fall inside larger structural divisions (i.e. `<div>`, `<p>`)_  
3.  Assign n attribute value. _segment IDs (`@n` attribute values) should start with a lowercase letter indicating the language of the original text (ex. d for Danish) followed by a two-digit number indicating the numerical numbering of text segments with translations._  
4.  Then wrap segment in translated text in a `<seg>` element.  _`<seg>` elements should fall inside larger structural divisions (i.e. `<div>`, `<p>`)_   
5.  Link `@corresp` attribute-value with `@n` attribute from transcription `<seg>` element created in step 3. _`@corresp` segment IDs should start with a hash symbol (#)_  

**Examples:**
`<seg n="d01">Original Text</seg>` _- this text as an original transcription with a linked translation will be a direct `child::` of a `<p>` or a `<div>` element and should always exist as a `descendant::` of a `<div>` element with the `@type` attribute-value of `original` - `<div type="original">`._  
`<seg corresp=”#d01”>Translated Text</seg>` _- this text as a translation will be a direct `child::` of a `<p>` or a `<div>` element and should always exist as a `descendant::` of a `<div>` element with the `@type` attribute-value of `translation` - `<div type="translation">`._  
  
`<seg n="g03">Tausend Dank für Ihren Brief. Der Ihrige ist der erste, den ich nach meiner Operation geöffnet habe.</seg>`  
`<p><seg corresp="#g03">Thank you so much for your letter. Yours is the first one that I opened after my operation.</seg>`  
  
### Prosopography Markup
