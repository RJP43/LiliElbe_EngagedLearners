# Lili Elbe Digital Archive Encoding Guidelines  
  
_Note: These guidelines define the Lili Elbe digital archive's encoding expectations and customizations of the TEI guidelines as defined in [the project's ODD schema file](https://gitlab.com/ctsdh/lili-elbe-code/blob/master/schema/LEDA_ODD.ODD). These guidelines focus on the encoding of the TEI `<text>` element; therefore, encoders should reference [the project's TEI Header template](https://raw.githubusercontent.com/RJP43/LiliElbe_EngagedLearners/master/ProjectDocs/TEIHeader_Template.xml) and the associated [Capturing Metadate lesson](https://github.com/RJP43/LiliElbe_EngagedLearners/wiki/Capturing-Metadata) for encoding expectations/customizations regarding the `<teiHeader>` element._   
  
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
Before adding additional encoding beyond the generic basic documenting structuring please be sure your XML file is [associated to the project schema](https://github.com/RJP43/LiliElbe_EngagedLearners/wiki/Schematizing-XML:-TEI-and-Project-Constraints#lili-elbe-digital-archive-schema), saved, and uploaded|pushed to your text's respective GitHub or Gitlab folder.
  
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
`<seg n="d01">Original Text</seg>`  
_- this text as an original transcription with a linked translation will be a direct `child::` of a `<p>` or a `<div>` element and should always exist as a `descendant::` of a `<div>` element with the `@type` attribute-value of `original` - `<div type="original">`._  
  
`<seg corresp=”#d01”>Translated Text</seg>`   
_- this text as a translation will be a direct `child::` of a `<p>` or a `<div>` element and should always exist as a `descendant::` of a `<div>` element with the `@type` attribute-value of `translation` - `<div type="translation">`._    
  
`<seg n="g03">  
Tausend Dank für Ihren Brief. Der Ihrige ist der erste, den ich nach meiner Operation geöffnet habe.  
</seg>`    

`<seg corresp="#g03">  
Thank you so much for your letter. Yours is the first one that I opened after my operation.  
</seg>`   
  
### Prosopography Markup
_note: All proper people and places (and some not proper) are captured in the following two elements: `<persName>` and `<placeName>`. Both elements have a key attribute whose value is checked against a prosopography list imported into our project ODD schema of all the people and places across the entire project. This allows us to keep track of people and place across files no matter if the literal string of text is directly providing the proper name of the person/place or not. When encoding prosopography information it is important to refer to our [`LEDA_Prosopography.xml`](https://github.com/RJP43/LiliElbe_EngagedLearners/blob/master/ProjectDocs/LEDA_Prosopography.xml) in order to determine the appropriate keys to use for each person or place you come across in your XML. Every `@xml:id` attribute-value in the [`LEDA_Prosopography.xml` file](https://github.com/RJP43/LiliElbe_EngagedLearners/blob/master/ProjectDocs/LEDA_Prosopography.xml) is a possible key attribute value that can be used in your XML files. If a person or place is not listed [`LEDA_Prosopography.xml`](https://github.com/RJP43/LiliElbe_EngagedLearners/blob/master/ProjectDocs/LEDA_Prosopography.xml), or if there is an alternate name used in your text for an existing person/place, then encoders are instructed to notify Rebecca - **@RJP43** in their team issue or [create an issue]() to alert Dr Caughie - **@profPLC** and the rest of the team of the newly identified person.  From there the project editors will determine if the person or place will get a key ID or simply exist as an encoded `<persName>` or `<placeName>` without a key attribute-value pairing.  
   
**When encoding people and places be sure to only include the name of the person or place inside of the element. As with most elements, exclude any unnecessary spaces within the element content, but you will also want to be particularly aware when encoding people and places to not include apostrophes or pluralizations within the element.**   

**Examples:** 
`<persName key="lili">Lili</persName>’s lover`  
  
`<persName key="lili">Mrs. Lili Elvenes</persName>`

`<persName key="lili">Lili</persName>`  
  
`<persName key="king">King of <placeName key="denmark">Denmark</placeName></persName>`    
  
`<placeName key="dresden">Dresden</placeName>`  

`<placeName key="dresden">German city</placeName>`  

`<placeName key="womensClinic">  
<persName key="kreutz">the Professor</persName>'s clinic  
</placeName>`  

**Creating Prosopography Documentation**
At the start of encoding a document, encoders should complete a document analysis to determine the sections of these Encoding Guidelines you will need to reference as well as to create a basic prosopography file. A prosopography file is simply a list of all the people and places in a file that links all of the alternate names for a place or a person to our [`LEDA_Prosopography.xml` file](https://github.com/RJP43/LiliElbe_EngagedLearners/blob/master/ProjectDocs/LEDA_Prosopography.xml). 

 Please create a google doc or spreadsheet with three (or more) columns. Prosopography documentation is the very first round of proofing feedback an encoder can receive from the primary project editors. Dr. Caughie goes through each prosopography file and verifies the correct names are being associated to the correct key IDs, and this file also informs the technical team of important documentation on each person and place that gets added to the schema. Please list the following information for each person and place mentioned in your XML file:  
  
Key ID (assigned or suggested), Full Name (person or place), Names used in Text  
  
Example: 
wegenerE (assigned), Einar Wegener (person), Einar Wegener | Einar | Mr. Wegener
barkerBob (suggested), Robert Barker (person), Bobby Boy  
  
### Mimicking Print Stylistic Renderings
_note: In the XML Word Document stylings (underline, bold, etc.) seen in the original transcription disappear; therefore, it is necessary for you to refer to the manuscript or print typescript/edition and use the encoding below to capture such instances pf word styling._  
   
`<hi rend="italics">Italicized Text</hi>`  
  
`<hi rend="emphasis">German Emphasized Text</hi>`   
_note: Once captured in encoding remove the spaces between letters - which is simply pseudo markup used to indicate German emphasis._  

`<hi rend="bold">Bold Text</hi>`  
   
`<hi rend="underline">Underlined Text</hi>`  

`<hi rend="super">Superscript text</hi>`  
_This markup comes after we found in some manuscripts the minutes of a time are written out as superscript to the hour.  
Example: `10<hi rend="super">30</hi>`  
  
