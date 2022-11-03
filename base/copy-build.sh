#!/bin/bash


FROM="./pre/"
TO="./post/"

echo "Logging of CI environment variable: CI=${CI}"
echo "Logging of ARBITRARY environment variable: ARBITRARY=${ARBITRARY}"

echo rm -Rf "${TO}"*
rm -Rf "${TO}"*

for i in $(ls $FROM) ; do
  if [[ -d "${FROM}${i}" ]] ; then
    echo cp -R "${FROM}${i}" "${TO}"
    cp -R "${FROM}""${i%/}" "${TO}"
  else
    echo cp "${FROM}""$i" "${TO}"
    cp "${FROM}""$i" "${TO}"
  fi
done

cp ../netlify.toml .

echo "Fake build complete!"

exit 0

