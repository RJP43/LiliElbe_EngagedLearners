# Lili Elbe Digital Archive Encoding Guidelines  
  
_Note: These guidelines define the Lili Elbe digital archive's encoding expectations and customizations of the TEI guidelines as defined in [the project's ODD schema file](https://gitlab.com/ctsdh/lili-elbe-code/blob/master/schema/LEDA_ODD.ODD). These guidelines focus on the encoding of the TEI `<text>` element; therefore, encoders should reference [the project's TEI Header template](https://raw.githubusercontent.com/RJP43/LiliElbe_EngagedLearners/master/ProjectDocs/TEIHeader_Template.xml) for encoding expectations/customizations regarding the `<teiHeader>` element._   
  
## Basic Structural Encoding 
  
The Lili Elbe Digital Archive deals with several different types of texts including: entire books, book sections and chapters, diary entries, magazine and journal articles, and letters. Each of these different text-types require slightly different structuring of the TEI `<text>` element's descendant elements. In this section of the guidelines each text types' basic structure is defined.   
  
### Books / Book Sections / Book Chapters   
_See [A1.xml](https://gitlab.com/ctsdh/lilielbe_A1/blob/master/A1.xml) as example._  

````
<text>
  <front>
    <!--place any text that appears before the chapter divisions in <front>-->
    
    <!--may contain the following divisions; 
    additional divisions should be kept in the order they appear in the print rendition -->
    
    <div type="intro"><!--introduction text divided into <p> elements--></div>
    <div type="loi"><!--list of illustrations--></div>
    <div type="foreword"><!--foreword text divided into <p> elements--></div>
    
    <!--additional <p> elements should be used for each of the paragraphs in the various divisions
    and/or text sitting directly in <front>-->
  </front>
  <body>
    <div type="chapter" n="#"><!--@n numerical value changes pending on chapter number in book-->
      <p style="heading">
        <num style="chapter"><!--literal chpt title or roman numeral heading--></num>
      </p>
      
      <!--additional <p> elements should be used for each of the paragraphs in the chpt-->
      
    </div>
    
    <!--use multiple div[@type="chapter"] elements to account for every chpt being encoded from the book-->
    
  </body>
	<back>
    <!--place any text that appears after the chpt divisions in <back>;
    additional <p> elements should be used for each of the paragraphs within <back>-->
  </back>
</text>

````
