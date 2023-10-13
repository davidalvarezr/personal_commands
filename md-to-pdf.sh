#!/bin/bash

# CSS Source
# https://gist.github.com/JamesMessinger/5d31c053d0b1d52389eb2723f7550907

FILE_PATH="$1"

PARENT_PATH=$(dirname "$FILE_PATH")
FILE_NAME_WITH_EXTENSION=$(basename "$FILE_PATH")
FILE_NAME="${FILE_NAME_WITH_EXTENSION%.*}"
FILE_EXTENSION="${FILE_NAME_WITH_EXTENSION##*.}"
CSS_FILE_PATH="$(dirname "$0")/vs-code-markdown.css"
PDF_MARGIN="1.5cm"

pandoc \
    --pdf-engine-opt=--enable-local-file-access \
    -V margin-left=$PDF_MARGIN \
    -V margin-right=$PDF_MARGIN \
    -V margin-top=$PDF_MARGIN \
    -V margin-bottom=$PDF_MARGIN \
    -f gfm -t html5 --metadata pagetitle="test.md" \
    --css $CSS_FILE_PATH \
    "$FILE_PATH" -o "$PARENT_PATH/${FILE_NAME}.pdf"



