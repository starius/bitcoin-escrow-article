DOT_FILES := $(wildcard *.dot)
PNG_FILES := $(DOT_FILES:.dot=.png)

MD_FILES := $(wildcard *.md)
HTML_FILES := $(MD_FILES:.md=.html)

all: $(PNG_FILES) $(HTML_FILES)

%.png: %.dot
	dot -Tpng $< -o $@

%.html: %.md
	pandoc -s $< -o $@

