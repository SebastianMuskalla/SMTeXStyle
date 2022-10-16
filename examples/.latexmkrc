$pdf_mode = 5; # use xelatex to produce xdv, then use xdvipdfmx
$dvi_mode = 0;
$postscript_mode = 0;

$pdflatex = "pdflatex -synctex=0 -interaction=nonstopmode -halt-on-error %O %S";
$xelatex = "xelatex --no-pdf -synctex=0 -interaction=nonstopmode -halt-on-error %O %S"; # generate xdv file (saves time)

# use bibtex/biber if bib files exist
# always cleanup .bbl files
$bibtex_use = 2;

# change to the directory of the file before compiling
$do_cd = 1;
