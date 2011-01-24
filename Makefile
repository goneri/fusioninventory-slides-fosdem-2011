# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#  latex beamer template makefile
#  this file is part of kdissert templates
#  http://freehackers.org/~tnagy/kdissert/index.html
#  created by Thomas Nagy <tnagy2^8@yahoo.fr, 2004
#  permission is granted to distribute modifications and
#  copies of this file without restrictions
#

# main target : create a pdf file

.PHONY    : view clean veryclean

# Commands
PDFLATEX = pdflatex

# Temporary file
AUX    = $(wildcard *.aux *.log *.nav *.out *.snm *.toc)
BACKUP = $(wildcard *~ *.bak)
FINAL  = $(wildcard *.pdf)

# run pdflatex two times or the table of contents does not appear
all: main.pdf

main.pdf: main.tex agent.tex server.tex purpose.tex
	$(PDFLATEX) $<
	$(PDFLATEX) $<
	@echo "-> make view"

view: main.pdf
	see main.pdf

clean:
	$(RM) $(AUX)

veryclean: clean
	$(RM) $(BACKUP) $(FINAL)

# use "make touch" to get cross references right
touch:
	touch main.tex && make
