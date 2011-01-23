# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#  latex beamer template makefile
#  this file is part of kdissert templates
#  http://freehackers.org/~tnagy/kdissert/index.html
#  created by Thomas Nagy <tnagy2^8@yahoo.fr, 2004
#  permission is granted to distribute modifications and
#  copies of this file without restrictions
#

# main target : create a pdf file


# run pdflatex two times or the table of contents does not appear
all: main.pdf

main.pdf: main.tex agent.tex server.tex purpose.tex
	export TEXINPUTS=$$TEXINPUTS:.:`pwd`/beamermindist/:`pwd`/beamermindist/themes; \
	export TEXINPUTS=$$TEXINPUTS:`pwd`/beamermindist/themes/color; \
	export TEXINPUTS=$$TEXINPUTS:`pwd`/beamermindist/themes/font ; \
	export TEXINPUTS=$$TEXINPUTS:`pwd`/beamermindist/themes/inner; \
	export TEXINPUTS=$$TEXINPUTS:`pwd`/beamermindist/themes/outer; \
	export TEXINPUTS=$$TEXINPUTS:`pwd`/beamermindist/themes/theme; \
	export TEXINPUTS=$$TEXINPUTS:`pwd`/beamermindist/art; \
       	export GS_OPTIONS="-sPAPERSIZE=a4"; \
	pdflatex main.tex && pdflatex main.tex
	@echo "-> make view"

viewps: main.ps
	gv main.ps

view: main.pdf
	see main.pdf

clean:
	rm -f main.out main.aux main.toc main.log main.nav main.snm
	touch main.tex

# same thing : run latex two times or the table of contents does not appear
main.ps: main.tex agent.tex server.tex purpose.tex
	export TEXINPUTS=$$TEXINPUTS:.:`pwd`/beamermindist/:`pwd`/beamermindist/themes; \
	export TEXINPUTS=$$TEXINPUTS:`pwd`/beamermindist/themes/color; \
	export TEXINPUTS=$$TEXINPUTS:`pwd`/beamermindist/themes/font ; \
	export TEXINPUTS=$$TEXINPUTS:`pwd`/beamermindist/themes/inner; \
	export TEXINPUTS=$$TEXINPUTS:`pwd`/beamermindist/themes/outer; \
	export TEXINPUTS=$$TEXINPUTS:`pwd`/beamermindist/themes/theme; \
	export TEXINPUTS=$$TEXINPUTS:`pwd`/beamermindist/art; \
       	export GS_OPTIONS="-sPAPERSIZE=a4"; \
	latex main.tex -o main.dvi && latex main.tex -o main.dvi
	dvips main.dvi -o main.ps
	@echo "-> make viewps"

# use "make touch" to get cross references right
touch:
	touch main.tex && make
