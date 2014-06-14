all:
	xelatex ubuntutips.tex
#bibtex	ubuntutips
#xelatex ubuntutips.tex
#xelatex ubuntutips.tex
clean:
	rm *.toc *.out *.aux *.listing *.log chapter/*.aux appendix/*.aux preface/*.aux reference/*.aux
