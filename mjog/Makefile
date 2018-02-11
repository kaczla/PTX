
all: analizer test mjog.ps

mjog: mjog.yy.c mjog.tab.c
	gcc -w -o $@ $? -lfl

mjog.yy.c: mjog.l mjog.tab.h
	flex -o $@ $<

mjog.tab.h mjog.tab.c: mjog.y
	bison -d $<

mjog.dot: input.txt mjog
	./mjog < $< > $@

mjog.ps: mjog.dot
	dot -Tps $< -o $@

analizer: analizer.yy.c analizer.tab.c
	gcc -w -o $@ $? -lfl

analizer.yy.c: analizer.l analizer.tab.h
	flex -o $@ $<

analizer.tab.h analizer.tab.c: analizer.y
	bison -d $<

test: input.txt analizer
	./analizer < $<

clean:
	rm -f mjog mjog.yy.c mjog.tab.h mjog.tab.c analizer analizer.yy.c analizer.tab.h analizer.tab.c
