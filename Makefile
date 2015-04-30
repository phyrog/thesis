TEXOPTS="-shell-escape"
FILENAME="example"
COMPILE=pdflatex ${TEXOPTS} ${FILENAME}.tex

all:
		${COMPILE}
		makeglossaries ${FILENAME}
		biber ${FILENAME}
		${COMPILE}
		${COMPILE}

clean:
		rm -f ${FILENAME}.{aux,log,toc,out,lol,glo,gls,lof,glg,ist,lot,bcf,blg,run.xml,bbl} ${FILENAME}.glossary.aux
		rm -f images/uni-logo-eps-converted-to.pdf
		rm -rf _minted-${FILENAME}

cleanpdf:
		rm -f ${FILENAME}.pdf

cleanall: clean cleanpdf
