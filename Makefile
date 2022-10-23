RM			= rm -f
PDFLATEX	= pdflatex

TARGETS=athena_isa.pdf athena_fpu.pdf athena_crypto.pdf

.PHONY: all
all: $(TARGETS)

athena_isa.pdf:
	$(PDFLATEX) -jobname=athena_isa base/main.tex
	$(PDFLATEX) -jobname=athena_isa base/main.tex


athena_fpu.pdf:
	$(PDFLATEX) -jobname=athena_fpu fpu/main.tex
	$(PDFLATEX) -jobname=athena_fpu fpu/main.tex

athena_crypto.pdf:
	$(PDFLATEX) -jobname=athena_crypto crypto/main.tex
	$(PDFLATEX) -jobname=athena_crypto crypto/main.tex

.PHONY: clean
clean:
	$(RM) $(TARGETS) $(TARGETS:.pdf=.aux) $(TARGETS:.pdf=.log) $(TARGETS:.pdf=.toc) $(TARGETS:.pdf=.out)

.PHONY: re
re: clean all
