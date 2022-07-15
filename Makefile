RM			= rm -f
PDFLATEX	= pdflatex

.PHONY: all
all: athena_isa.pdf

athena_isa.pdf:
	$(PDFLATEX) -jobname=athena_isa src/main.tex
	$(PDFLATEX) -jobname=athena_isa src/main.tex


.PHONY: clean
clean:
	$(RM) athena_isa.pdf

.PHONY: re
re: clean all
