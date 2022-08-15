CC     ?= cc
PREFIX := /usr/local

all: config.h rose

config.h:
	cp config.def.h $@

rose: rose.o
	$(CC) `pkgconf --libs webkit2gtk-5.0 gtk4-x11 libcurl` -o $@ $?

rose.o: rose.c
	$(CC) `pkgconf --cflags webkit2gtk-5.0 gtk4-x11 libcurl` -c $<

install: rose
	mkdir -p /usr/share/themes/rose
	cp -f themes/* /usr/share/themes/rose
	cp -f rose $(PREFIX)/bin/rose

uninstall:
	rm -f $(PREFIX)/bin/rose

clean:
	rm -f rose rose.o

.SILENT: config.h rose rose.o
.PHONY: all install uninstall clean
