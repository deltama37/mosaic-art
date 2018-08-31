#!/bin/sh

pushd `dirname $0`

if [ -z $1 ]; then
  echo "please input keyword"
  exit 1
fi

OUTPUT_DIR="../photos"
KEYWORD=$1

googleimagesdownload --keywords "${KEYWORD}" --output_directory="${OUTPUT_DIR}" --no_directory --prefix="${KEYWORD}" --limit 5 --aspect_ratio=square

cd "${OUTPUT_DIR}"

i=0
for file in *; do
  i=`expr $i + 1`
  mv "$file" $i".jpg"
done

popd
