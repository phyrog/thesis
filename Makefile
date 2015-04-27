TEXOPTS="-shell-escape"

all:
		pdflatex ${TEXOPTS} thesis.tex
		makeglossaries thesis
		biber thesis
		pdflatex ${TEXOPTS} thesis.tex
		pdflatex ${TEXOPTS} thesis.tex
		pdflatex ${TEXOPTS} thesis.tex

clean:
		rm -f thesis.{aux,log,toc,out,lol,glo,gls,lof,glg,ist,lot,bcf,blg,run.xml,bbl} glossary.aux
		rm -f images/uni-logo-eps-converted-to.pdf
		rm -rf _minted-thesis

cleanpdf:
		rm -f thesis.pdf

cleanall: clean cleanpdf
