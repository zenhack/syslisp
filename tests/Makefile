
TESTS=$(wildcard tst.*)
DIFFS=$(patsubst tst.%, diff.%,$(TESTS))
CHECKS=$(patsubst tst.%, ok.%,$(TESTS))

tstex.%: tst.%
	cat ../genc.rkt > $@
	printf '(display\n' >> $@
	cat $< >> $@
	printf ')\n' >> $@
	chmod +x $@
act.%: tstex.% ../genc.rkt
	./$< > $@
diff.%: act.%
	diff -u $(patsubst act.%, exp.%, $<) $< > $@
ok.%: diff.%
	test -z "`cat $<`"
	touch $@
exp.%: tstex.%
	./$< > $@

all: check
check: $(CHECKS)
clean:
	rm -f ok.* diff.* act.*
