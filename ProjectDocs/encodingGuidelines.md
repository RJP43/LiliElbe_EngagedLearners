# Lili Elbe Digital Archive Encoding Guidelines  
  
_note: These guidelines define the Lili Elbe digital archive's encoding expectations and customizations of the TEI guidelines as defined in [the project's ODD](https://gitlab.com/ctsdh/lili-elbe-code/blob/master/schema/LEDA_ODD.ODD) and [LEDA_ODD.rng schema](https://github.com/RJP43/LiliElbe_EngagedLearners/blob/master/ProjectDocs/LEDA_ODD.rng). These guidelines focus on the encoding of the TEI `<text>` element; therefore, encoders should reference [the project's TEI Header template](https://raw.githubusercontent.com/RJP43/LiliElbe_EngagedLearners/master/ProjectDocs/TEIHeader_Template.xml) and the associated [Capturing Metadata lesson](https://github.com/RJP43/LiliElbe_EngagedLearners/wiki/Capturing-Metadata) for encoding expectations/customizations regarding the `<teiHeader>` element._   
  
## Steps to take before Encoding  
  
### Capturing Special Characters
Change any XML special characters to designated XML entities (ie. `&` becomes `&amp;`).   
_For special characters, use the HTML Entity codes preceded by “&#” and followed by a semicolon “;”. For example, to render an en dash (HTML Entity Code 8211), you would enter “&#8211;”. Here’s a list of HTML Entity Codes: https://www.html.am/reference/html-special-characters.cfm - Use column titled: HTML Entity Number._
  
### Standardize XML Filename  
_note: XML documents should be named the same as the .docx transcription files without the parentheticals and any text that follows the first whitespace. Verify with Dr. Caughie or Emily on the correct filename._  
````
19211922ThomsenSdiaryentries Comments(9.21.18).docx   
↓  
19211922ThomsenSdiaryentries.xml  
````  
   
## Basic Text-Type Structural Encoding 
  
The Lili Elbe Digital Archive deals with several different types of texts including: entire books, book sections and chapters, diary entries, magazine and journal articles, and letters. Each of these different text-types require slightly different structuring of the TEI `<text>` element's descendant elements. In this section of the guidelines each text-types' basic structure is defined.   
  
### Texts with Translations  
Any text that has an English translation should have the following  double `<div>` structure surrounding that particular text-type's encoding structure. For example, if encoding a letter that has a translation then first implement this "Texts with Translations" structural markup and then continue with the structural markup specified under the "Letters" text-type heading for the original-language text inside the `<div type="original">` as well as the translated text inside the `<div type="translation">`. _See [0000-00-00ThomsenTHoyer.xml](https://github.com/RJP43/LiliElbe_EngagedLearners/blob/master/ProjectDocs/Examples/0000-00-00ThomsenTHoyer.xml) as example._  
  
````
<text>
  <body>  
    <div type="original">
    	<!-- specific text-type encoding structure (i.e. letter, book chapter, etc.) -->
    </div>
    <div type="translation">
    	<!-- specific text-type encoding structure (i.e. letter, book chapter, etc.) -->
    </div>
  </body>
</text>
````
  
### Books / Book Sections / Book Chapters   
_See [A1.xml](https://github.com/RJP43/LiliElbe_EngagedLearners/blob/master/ProjectDocs/Examples/A1.xml) as edition example._ For book sections and single chapters use only the `<text>` element and the `<body>` element. If a translated section/chapter, the following structure should be used in both the `<div type="original">` and the `<div type="translation">`.  _See [Lili's Foreword](https://github.com/RJP43/LiliElbe_EngagedLearners/blob/master/ProjectDocs/Examples/LiliForeword.xml) as example._  

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
_See [Sandheden](https://github.com/RJP43/LiliElbe_EngagedLearners/blob/master/ProjectDocs/Examples/Sanheden.xml) as example._ If a translated text, the following structure should be used in both the `<div type="original">` and the `<div type="translation">`.   
  
````
<div rend="head" style="periodical"><!--text that appears before headlines; could include title and date-->
   <p>
      <title><!--name of newspaper/mag/journal, if included in facsimile image otherwise delete--></title>
      <date when="yyyy-mm-dd"><!--exact transcription of date, if included in facsimile image otherwise delete--></date>
   <p>    
</div>
<div rend="headlines">
      <list>
           <item rend="primary"><!--text of main headline--></item>
           <!--additional <item> elements with no @rend attribute value can be used to list sub-headlines-->
      </list>
</div>
<div rend="body">
<!--<p> elements should be used for each of the paragraphs making up the article body-->
</div>
````  
  
### Letters  
_See [0000-00-00ThomsenTHoyer.xml](https://github.com/RJP43/LiliElbe_EngagedLearners/blob/master/ProjectDocs/Examples/0000-00-00ThomsenTHoyer.xml) as example._ If a translated text, the following structure should be used in both the `<div type="original">` and the `<div type="translation">`.   
  
````
<div rend="head" syle="letter">
  <!--letter head; often includes address lines (with <placeName> elements) and date (in <date> elements)use <p> elements to separate lines -->
</div>
<div rend="body">
  <p><!--salutation; dear so and so--></p>
  <!--<p> elements should be used for each of the paragraphs making up the letter body-->
    <signed><!--transcription of signature in a linked <persName> element--></signed>  
  <postscript>
    <!--transcription of content written after signature by letter author; ps-->
    <!--<p> elements should be used for each of the paragraphs making up postcript--> 
  </postscript>
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
_note: Besides letter and diary entries collation IDs for paragraphs are added in the pipeline process transforming to HTML._
  
`<p style="letter" xml:id="a1c00l00p00">Letter Text</p>`  
`<p style="GreteDiary" xml:id="a1c00d00p00">Diary Text</p>`  
`<p style="LiliDiary" xml:id="a1c00d00p00">Diary Text</p>`

_note: change xml:id attribute-value to match the paragraph collation ID found in the [collation spreadsheets](https://gitlab.com/ctsdh/lili-elbe-code/tree/master/collationSpreadsheets). Every paragraph of each letter has a unique ID reflecting the edition (a1 | b1 | g1 | d1 | tr |ts), chapter, letter|diary entry #, and paragraph # (within the letter|diary entry)_. **Diary entries included in letters get the style attribute with the appropriate attribute-value but do not have assigned xml:id attribute-value pairs at this time.**    
  
### Page and Column Breaks  
  
**Recurring Page Headers**    
_note: In instances where a page number and a recurring heading are both present, logical element hierarchy is to put the page beginning with the numbering before the heading because the heading exists on the page (being indicated by the pb with the oage numbering)._  

`<pb style="heading" rend="MIW"/>`   
`<pb style="heading" rend="Introduction"/>`   
`<pb style="heading" rend="Foreword"/>`   
`<pb style="heading" rend="Mozaïques"/>`
  
**Page Numbers**
_When a page number literally appears in the original, print rendition capture it with the following encoding:_    
`<pb style="page" n="v"/>`  
   
`<pb style="page" n="16"/>`  
  	
_Capture artificial page numbers (either of the Word Document transcriptions or implied when text continues on a new page) with the following encoding:_   
`<pb n="18"/>`  
  
_In articles, there are sometime columns. At the end of each column use the `<cb/>` self-closing element with the `@n` attribute and attribute-value matching the number of column break it is. Column numbering should be based on the article as a whole rather than individual pages._    
`<cb n="#"/>`  
  
_note: When transcribing a text we have made the decision as a project to remove line break hyphenation. Therefore, if a word in the print rendition of a text is hyphenated because there was not enough room in the print rendition to fit the entire word on a single line simply remove the hyphenation. **When a word is split over a page break/beginning - `<pb/>` take the second part of the word (after the hyphenation) and paste it directly after the first part of the word (removing the hyphenation) and then proceed with the `<pb>` encoding.**_   

### Figures, Photos, Illustrations, Images  
_note: In the main editions we have assigned image XML:IDs so that if an image is referenced anywhere else in the document we can link such instances by providing a corresp attribute value containing the XML:ID preceded by a hashtag (like this: `<p corresp=”#i00>Reference to image.</p>`). When assigning an XML:ID for images start with `i` which stands for image. Follow this with a two digit representation of the number image in the parent text; So the first image would be `i01`._ See example below.

````
<figure xml:id="i##" facs="URL">
   <figDesc><!--direct transcription of image caption provided in print rendition--></figDesc>
      <!--If there is no caption on the image then leave a self-closing `<figDesc/>` element.-->
      <!-- figDesc should include any markup indicating styling, people, places as well as the seg markup if there is translation-->
   <note source="team member ID">Encoder description of image (that can be used as alt. text); any information about the placement of the photo on the print page and image credit. Please use complete sentences.</note>
</figure>
````
  
**All figures must have a `facs` attribute. The attribute value for each illustraion should provide the url to the illustration in the Lili Elbe Digital Archive's media library.**  
Example: `facs="http://www.lilielbe.org/media/periodicals/Sandheden_i01.jpg"`  
   
### Prosopography Markup    
_note: All proper people and places (and some not proper) are captured in the following two elements: `<persName>` and `<placeName>`. Both elements can have a key attribute-value that gets checked against a prosopography list imported into our ODD schema of all the people and places across the entire project. This allows us to keep track of people and place across files no matter if the literal string of text is directly providing the proper name of the person/place or not. When encoding prosopography information it is important to refer to our [`LEDA_Prosopography.xml`](https://github.com/RJP43/LiliElbe_EngagedLearners/blob/master/ProjectDocs/LEDA_Prosopography.xml) in order to determine the appropriate keys to use for each person or place you come across in your XML. Every `@xml:id` attribute-value in the [`LEDA_Prosopography.xml` file](https://github.com/RJP43/LiliElbe_EngagedLearners/blob/master/ProjectDocs/LEDA_Prosopography.xml) is a possible key attribute-value that can be used in your XML files. If a person or place is not listed [`LEDA_Prosopography.xml`](https://github.com/RJP43/LiliElbe_EngagedLearners/blob/master/ProjectDocs/LEDA_Prosopography.xml), or if there is an alternate name used in your XML for an existing person/place not included in the `LEDA_Prosopography.xml`, then encoders are instructed to notify Rebecca - **@RJP43** in their team issue or [create an issue](https://github.com/RJP43/LiliElbe_EngagedLearners/issues/23) to alert Dr. Caughie - **@profPLC** and the rest of the team of the newly identified person/place.  From there the project editors will determine if the person or place will get a key ID or simply exist as an encoded `<persName>` or `<placeName>` without a key attribute-value pairing._    
   
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
At the start of encoding a document, encoders should complete a document analysis to determine the sections of these Encoding Guidelines necessary to reference as well as to create a basic prosopography file. A prosopography file is simply a list of all the people and places in a XML text that links all of the alternate names for a place or a person to our [`LEDA_Prosopography.xml` file](https://github.com/RJP43/LiliElbe_EngagedLearners/blob/master/ProjectDocs/LEDA_Prosopography.xml).   
    
Please create a Google doc or spreadsheet with three (or more) columns. Prosopography documentation is the very first round of proofing feedback an encoder can receive from the primary project editors. Dr. Caughie goes through each prosopography file and verifies the correct names are being associated to the correct key IDs, and this file also informs the technical team of important documentation on each person and place that gets added to the schema. Please list the following information for each person and place mentioned in your XML file:  
  
>  Key ID (assigned or suggested), Full Name (person or place), Names used in Text    
Example:     
wegenerE (assigned), Einar Wegener (person), Einar Wegener | Einar | Mr. Wegener   
barkerBob (suggested), Robert Barker (person), Bobby Boy   
    
### Mimicking Print Stylistic Renderings
_note: When text is copied from a Word Document with stylings (underline, bold, etc.) the stylings disappear; therefore, it is necessary for you to refer to the facsimile images of the document and the original Word Document transcription. Use the encoding below to capture such instances of word stylings._   
   
`<hi rend="italics">Italicized Text</hi>`    
      
`<hi rend="emphasis">German Emphasized Text</hi>`    
_note: Once captured in encoding remove the spaces between letters - which is simply pseudo markup used to indicate German emphasis._  
  
`<hi rend="bold">Bold Text</hi>`    
    
`<hi rend="underline">Underlined Text</hi>`   
   
`<hi rend="super">Superscript text</hi>`  
_This markup comes after we found in some manuscripts the minutes of a time are written out as superscript to the hour.   
Example: `10<hi rend="super">30</hi>`_    
  
**There are instances in the German edition where letters and diary entries come in the middle of paragraphs. The TEI does not allow paragraphs to appear in paragraphs; therefore, in these instances we use the `<hi>` element and assign a rend attribute alongside a xml:id attribute in a similar fashion to the Collation Paragraph styling mentioned above.**  

`<hi rend="letter" xml:id="g1c00l00p00">Letter Text</p>`  
`<hi rend="GreteDiary" xml:id="g1c00d00p00">Diary Text</p>`  
`<hi rend="LiliDiary" xml:id="g1c00d00p00">Diary Text</p>`

_note: change xml:id attribute-value to match the paragraph collation ID found in the [collation spreadsheets](https://gitlab.com/ctsdh/lili-elbe-code/tree/master/collationSpreadsheets). Every paragraph of each letter has a unique ID reflecting the edition (a1 | b1 | g1 | d1 | tr |ts), chapter, letter|diary entry #, and paragraph # (within the letter|diary entry)_.
  
### Blank Pages
	`<note style="descText" type="blankPage"/>`   
  
	`<note style="descText" type="blankPage" subtype="rightCover"/>`   
	 
### Publisher Marks  
	`<note style="pubInfo">Publisher Mark</note>`  
	
### Footnotes / Endnotes   
````
<anchor type="footRefStart" n="1"/>  
<hi rend="italics">sakkoanzug</hi>  
<anchor type="footRefEnd" n="1"/>  
<note corresp="fn_001" type="foot" rend="asterisk">Frock-coat.</note>  
````  
**Possible Attribute-Value Pairs**  
  
`@type "foot" or "end"`  
`@rend "asterisk" or numerical value`   
  
### Editor/Translator Comments   
````
<anchor type="commentRangeStart" n="<!--comment number-->"/>  
TEXT BEING REFERENCED<anchor type="commentRangeEnd" n="<!--comment number-->"/><note type="translator or editor" source="team member ID"  
corresp="comment_<!--same comment number-->">COMMENTED TEXT IN COMPLETE SENTENCES</note>  
````

_Source attribute-values should be changed to the two or three letter editor's, encoder’s, or primary translator's initials, which should also be identified in the `<respStmt>` elements in the XML’s teiHeader. Encoders should select whether translator or editor for the note type attribute and changes the comment# to reflect the order of the comment in relation to all of the other comments in the file._  

  
### Encoder Comments
`<!-- Encoder Initials:yyyy-mm-dd: Encoder comment here.-->`
_Change yyyy-mm-dd date to the date of the XML comment's creation._  
  
### Responsibility Stmts and Source Attributes  
_note: When linking an encoder, editor, or translator to a note the encoder’s, editor’s, or translator’s full name and the digitization task associated to them should be detailed in `<respStmt>` elements of the teiHeader. The ref attribute-value linked to the persName in the teiHeader `<respStmt>` elements are what get used as the values in the source attribute of any note elements in the rest of the XML._  
   
### Correcting Errors from Print / Facsimile Images
_note: The LEDA project has decided to make no silent corrections; however, we want to be able to display a corrected version of misspelled text, punctuation errors, etc. for searchability and standardization._  
````
<choice>  
<orig>Text from the Original</orig>  
<reg>Corrected Text</reg>  
</choice>  
````  
**Missing Text/Punctuation in Original**  
````
<choice>  
<orig/>  
<reg>missing text/punctuation</reg>  
</choice>  
````
**Errors with Descendant Elements**  
````
<choice>  
<orig><persName key="hvideNiels">Niel</persName>'s</orig>  
<reg><persName key="hvideNiels">Niels</persName>'</reg>  
</choice>  face   
````
**Errors as Descendant Elements**
````
<persName key="wardalKar">Fräulein Karen   
<choice>  
<orig>Wardel</orig>  
<reg>Wardal</reg>  
</choice>  
</persName>  
````    
  
### Encoding Tricky Transcriptions
_note: The following elements can be used individually or in combination with each other within the `<subst>` element for encoding substitutions (when some text is deleted - whether that be erased, crossed out, written over, etc. - and some other text is inserted as replacement text._  
  
**Substitutions**  
````
<subst>
<del type="XXX"><gap extent="X"/> OR best guess at deleted text</del>
<add place="XXX" type="XXX" rend="XXX">replacement text</add>
</subst>  
````
**Unclear Text**
_note: Use this encoding for stretches of illegible or missing text (cutaways, holes, smudges, etc.). Define the size of the gap by indicating a number of em-spaces in the `@extent` attribute-value. If there is a clear separation of words then include a gap for each word with the `@extent` attribute-value indicating the number of em-spaces for each word respectively._  
`<gap extent="#"/>`   
  
**Additions**     
  `<add place="XXX" type="XXX" rend="XXX">`  
**Possible Attribute-Value Pairs**  
  
`@place`  
"leftMargin"  
"rightMargin"   
"above"  
"below"  
"inline"   
	
`@type`  
"insertion"  
"overwrite"  
"overtype"  
"transposition"
  
`@rend`
"pencil"   
"blackInk"  
"blueInk"
"redCrayon"   
"redPencil"    
			 
**Deletions**  
`<del type="XXX">`
**Possible Attribute-Value Pairs**  
  
`@type`   
"strikethrough"  
"overwrite"  
"overtype"   