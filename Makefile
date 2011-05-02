.PHONY    : view clean veryclean

# Commands
PDFLATEX = pdflatex

# Temporary file
AUX    = $(wildcard *.aux *.log *.nav *.out *.snm *.toc *~)
BACKUP = $(wildcard *~ *.bak)
FINAL  = $(wildcard *.pdf)

# main target : create a pdf file
all: main.pdf

# run pdflatex two times or the table of contents does not appear
main.pdf: main.tex agent.tex server.tex purpose.tex
	$(PDFLATEX) -halt-on-error $<
	$(PDFLATEX) -halt-on-error $<
	@echo "-> make view"

view: main.pdf
	see main.pdf

clean:
	$(RM) $(AUX) main.pdf

veryclean: clean
	$(RM) $(BACKUP) $(FINAL)

# use "make touch" to get cross references right
touch:
	touch main.tex && make
