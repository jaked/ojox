all: myocamlbuild.ml
	ocamlbuild ojox.cmjsa

doc:
	ocamlbuild -no-links doc.docdir/index.html

install:
	ocamlfind install ojox META _build/*.cmi _build/*.cmjsa

uninstall:
	ocamlfind remove ojox

clean:
	ocamlbuild -clean
	rm -f myocamlbuild.ml

myocamlbuild.ml:
	ln -s ../../tools/myocamlbuild.ml
