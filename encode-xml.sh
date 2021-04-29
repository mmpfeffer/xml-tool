#!/bin/bash
FILE="$1"
if [[ $# -ne 1 ]]; then
    echo "usage $(basename $0) [TEMPLATE-FILE-NAME].tmpl"
    echo "Encoded lines between markers #BEGIN-ENCODING# #END-ENCODING#"
    exit 2
fi

if [[ ! $FILE =~ .*\.tmpl ]]; then
    echo "ERROR: input file '$FILE' must be named with .tmpl extension."
    exit 2
fi

if [[ ! -f $FILE ]]; then
    echo ERROR: input file $FILE not found.
    exit 2
fi

sed -e '/^#BEGIN-ENCODING#/,/^#END-ENCODING#/s/</\&lt;/g' \
    -e '/^#BEGIN-ENCODING#/,/^#END-ENCODING#/s/>/\&gt;/g' \
    -e '/^#BEGIN-ENCODING#/,/^#END-ENCODING#/s/&/\&amp;/g' \
    -e '/^#BEGIN-ENCODING#/,/^#END-ENCODING#/s/"/\&quot;/g'  $FILE | sed -e /^#BEGIN-ENCODING#/d -e /^#END-ENCODING/d >${FILE/.tmpl/}
echo "Encoded $FILE as ${FILE/.tmpl/}"
