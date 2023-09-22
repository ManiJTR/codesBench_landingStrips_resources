/**
 * Utility class used to process the document's HTML prior to service calls, typically due to missing markup via getInnerHTML().
 * 
 * @author <a href="mailto:geoff.grain@thomson.com">Geoff Grain</a>
 */


XmlTransmogrifier = {};

XmlTransmogrifier.RegularExpressions = [
	/* 0: The following attributes are typically not quoted by the browser. 
		But some are, so ignore those that start with a single/double quote. */
	new RegExp().compile(/((class|id|name|title|height|width)=(?!['"])(['"])?(([^>'"/ ]| (?=[^"=]+['"]))+)\3?)/g),

	/* 1: These tags do not have ending '/'. */
	new RegExp().compile(/<(br|hr|img|input|link|meta)([^>]*)\s?>/gi),

	/* 2: Namespace declaration not needed -- remove it.  */
	new RegExp().compile(/<\?xml\:namespace prefix\s*=\s*"?tw"?\s*\/>/g),

	/* 3: Lower-case these puppies. Revisit "_ID=", since that could be in text. */
	new RegExp().compile(/((_ID=)|<(\/?SPAN|BR|HR|IMG))/g),

	/* 4: Attempt to accomplish #0's RE in a global fashion (i.e. without specific references to named attributes).  */
	new RegExp().compile(/(<) \s*?  ((\w+:?)+) (\s*? (?!=[\/\?]?>) (\w+) (?:\s* (=) \s* ) ( (?:\'[^\']*\'|\"[^\"]*\"|[^ >]+) ) )* \s*? ([\/\?]?>)/g),
	
	/* 5: getInnerHTML adds an empty class attribute on paratext elements (maybe others too?) -- remove it.  */
	new RegExp().compile(/paratext\s?class=""/g),
];

/** 
  * Uses regular expressions to produce well-formed XML, given what getInnerHTML serves up.
  */
XmlTransmogrifier.getXHTML = function(editor) 
{
	var re = XmlTransmogrifier.RegularExpressions;

	var html = editor.getInnerHTML();
	
	html = html.	
		replace(re[0], '$2="$4"').
		replace(re[1], '<$1$2 />').
		replace(re[2], ' ').
		replace(re[5], 'paratext ').
		replace(re[3], function($1) { return $1.toLowerCase(); });
		
	// Uncomment to restore original method of obtaining content.
	// html = HTMLArea.getHTML(editor._doc.body, false, editor);
	
	return html;
};

/** 
  * Same as getXHTML but operates on a single node as opposed to an entire document.
  * this method PRESERVES the namespace declaration. -CS
  */
XmlTransmogrifier.getSingleElementXHTML = function(element) 
{
	var re = XmlTransmogrifier.RegularExpressions;

	var html = element.innerHTML;
	
	html = html.	
		replace(re[0], '$2="$4"').
		replace(re[1], '<$1$2 />').
		replace(re[2], ' ').
		replace(re[5], 'paratext ').
		replace(re[3], function($1) { return $1.toLowerCase(); });

	return html;
};
