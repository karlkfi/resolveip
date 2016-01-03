DESTDIR=/usr/local/bin

default: build

build:
	@echo "Nothing to build. Use make install"

install: resolveip.sh
	install resolveip.sh $(DESTDIR)
