.PHONY: all figures paper clean

all: figures paper

figures:
	@set -e; cd figures; for figure in fig_*.tex; do \
		pdflatex -interaction=nonstopmode -halt-on-error "$$figure"; \
	done

paper:
	latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex

clean:
	latexmk -c main.tex
	@set -e; cd figures; for figure in fig_*.tex; do latexmk -c "$$figure"; done
