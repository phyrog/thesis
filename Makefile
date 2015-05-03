TEXOPTS="-shell-escape"
FILENAME="example"

all: pdf

pdf:
		latexmk -pdflatex='pdflatex ${TEXOPTS}' -pdf -quiet ${FILENAME}.tex

debug:
		latexmk -pdflatex='pdflatex ${TEXOPTS}' -pdf ${FILENAME}.tex

clean:
		rm -f ${FILENAME}.{aux,log,toc,out,lol,glo,gls,lof,glg,ist,lot,bcf,blg,run.xml,bbl,fls,fdb_latexmk} ${FILENAME}.glossary.aux
		rm -f images/uni-logo-eps-converted-to.pdf
		rm -rf _minted-${FILENAME}

cleanpdf:
		rm -f ${FILENAME}.pdf

cleanall: clean cleanpdf
