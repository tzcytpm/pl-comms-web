#!/bin/bash

set -e

mydir="$(dirname "$(realpath "$0")")"

echo $mydir

pushd "$mydir" > /dev/null

# element-logo.svg -> privateline-logo.png
find "$mydir" -name "*.tsx*" -exec \
    sed -i '' -e  's|element-logo\.svg|plcomms-logo\.png|g' '{}' \;

# scalar.vector.im-> mtxnode1.privateline.dev
find "$mydir" -name config.json -exec \
    sed -i '' -e  's|scalar\.vector\.im|mtxnode1\.privateline\.dev|g' '{}' \;

# vector.im-> privateline.dev
find "$mydir" -name config.json -exec \
    sed -i '' -e  's|vector\.im|im\.privateline\.dev|g' '{}' \;

# element.io-> privateline.dev
find "$mydir" -name config.json -exec \
    sed -i '' -e  's|element\.io|im\.privateline\.dev|g' '{}' \;	

# element.io-> privateline.dev
find "$mydir/src/i18n/strings" -name "*.json" -exec \
    sed -i '' -e  's|element\.io|im\.privateline\.dev|g' '{}' \;	

# element.io-> privateline.dev
find "$mydir/src" -name "*.html" -exec \
    sed -i '' -e  's|element\.io|im\.privateline\.dev|g' '{}' \;	

# element.io-> privateline.dev
find "$mydir/src" -name "*.ts*" -exec \
    sed -i '' -e  's|element\.io|im\.privateline\.dev|g' '{}' \;	

popd > /dev/null

echo "Seems like language is up-to-date :)"
