TEXOPTS=-shell-escape

%:
		latexmk -pdflatex='pdflatex ${TEXOPTS}' -pdf -quiet $@.tex

clean:
		rm -f *.{aux,log,toc,out,lol,glo,gls,lof,glg,ist,lot,bcf,blg,run.xml,bbl,fls,fdb_latexmk}
		rm -f images/uni-logo-eps-converted-to.pdf
		rm -rf _minted-*

cleanpdf:
		rm -f ${FILENAME}.pdf

cleanall: clean cleanpdf
