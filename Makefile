DOT_FILES := $(wildcard *.dot)
PNG_FILES := $(DOT_FILES:.dot=.png)

all: $(PNG_FILES)

%.png: %.dot
	dot -Tpng $< -o $@

