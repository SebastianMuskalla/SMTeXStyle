#!/bin/sh


# exit when any command fails
set -e

echo "Compiling examples"

cd examples

# clean output
rm -rf .out

# clean old versions
rm -f *.pdf

# compile examples
latexmk --quiet

# copy compiled PDFs
cp .out/*.pdf .

# remove temporary files
rm -rf .out

echo "SUCCESS"
