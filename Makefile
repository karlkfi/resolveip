prefix=/usr/local/bin

default: build

build:
	@echo "Nothing to build. Use make install"

install: resolveip.sh
	install resolveip.sh $(DESTDIR)$(prefix)

uninstall:
	-rm $(DESTDIR)$(prefix)/resolveip.sh
