INSTALL = install
PREFIX  = /usr/bin

po2lmo: src/po2lmo.o src/template_lmo.o src/plural_formula.o
	$(CC) $(LDFLAGS) -o src/po2lmo src/po2lmo.o src/template_lmo.o src/plural_formula.o -s

install:
	$(INSTALL) -m 755 src/po2lmo $(PREFIX)

clean:
	$(RM) src/po2lmo src/*.o

src/contrib/lemon: src/contrib/lemon.c src/contrib/lempar.c
	$(CC) -o src/contrib/lemon $<

src/plural_formula.c: src/plural_formula.y src/contrib/lemon
	./src/contrib/lemon -q $<
