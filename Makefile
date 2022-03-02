usage:
	@/bin/echo "make por.test	Will test por exercise"

%.test: %.fomabin %.gold.tsv
	cut -f 1 $*.gold.tsv | flookup -i -w "" $*.fomabin | diff -y $*.gold.tsv -

%.fomabin: %.foma
	foma -l $*.foma -e "save stack $*.fomabin" -s

.PHONY: usage *.test

