#!/bin/bash
export NODE_OPTIONS=--max-old-space-size=32768

EXTENSIONS=`cat extensions.txt`
until jupyter labextension install $EXTENSIONS --no-build  
do
    echo "Extensions failed to install"
done

until jupyter lab build --dev-build=False
do
    echo "Extension failed to install"
done


for item in `cat extensions_server.txt`; do
    jupyter serverextension enable --py $item
done
