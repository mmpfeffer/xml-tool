
XML Tools

encode-xml: Convert templated xml files by encoding marked sections, but leaving unmarked sections uncoded.
This is useful, for example, when one must embed XML within XML and may not use CDATA or other syntactic
mechanisms.  Just put marker lines in the file, to indicate which lines should be encoded.

Example

Input:

```<text id="dont-touch">Do not touch this XML</text>
<text id="do-touch" some_attribute="
#BEGIN-ENCODING#
   <embedded-xml-tag>This is embedded XML</embedded-xml-tag>
#END-ENCODING#
">
'''


Output:

```<text id="dont-touch">Do not touch this XML</text>
<text id="do-touch" some_attribute="
   &amp;lt;embedded-xml-tag&amp;gt;This is embedded XML&amp;lt;/embedded-xml-tag&amp;gt;
">'''
