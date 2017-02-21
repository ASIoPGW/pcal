
NAME=main

all: ${NAME}.pdf

${NAME}.pdf: ${NAME}.dvi
	@dvipdfmx ${NAME}

${NAME}.dvi: ${NAME}.tex\
             Chapters/Chapter1.tex Chapters/Chapter2.tex Chapters/Chapter3.tex\
             Chapters/Chapter4.tex Chapters/Chapter5.tex Chapters/Chapter6.tex\
	     Chapters/Chapter7.tex Chapters/Chapter8.tex
	@latex ${NAME}
	@bibtex ${NAME}
	@latex ${NAME}

.PHONY: clean

clean:
	@if [ `ls * | grep aux$ | wc -l` -gt 0 ]; then rm */*.aux; fi
	@if [ -f ${NAME}.pdf ]; then rm ${NAME}.pdf; fi
	@if [ -f ${NAME}.dvi ]; then rm ${NAME}.dvi; fi
	@if [ -f ${NAME}.aux ]; then rm ${NAME}.aux; fi
	@if [ -f ${NAME}.bbl ]; then rm ${NAME}.bbl; fi
