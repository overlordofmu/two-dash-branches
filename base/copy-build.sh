#!/bin/bash

FILE_LIST=(
_redirects
Page-2/
green-river.png
index.html
large.jpg
ads.txt
.well-known/
)

FROM="pre/"
TO="post/"

echo "Logging of CI environment variable: CI=${CI}"
echo "Logging of ARBITRARY environment variable: ARBITRARY=${ARBITRARY}"

echo rm -Rf "${TO}"*
rm -Rf "${TO}"*

for i in "${FILE_LIST[@]}" ; do
  if [ "${i:(-1)}" == "/" ] ; then
    echo cp -R "${FROM}""${i%/}" "${TO}"
    cp -R "${FROM}""${i%/}" "${TO}"
  else
    echo cp "${FROM}""$i" "${TO}"
    cp "${FROM}""$i" "${TO}"
  fi
done

cp ../netlify.toml .

echo "Fake build complete!"

exit 0
