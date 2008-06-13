# Since ZEBU is a python script, there's really little to build.  This just
# prepares the man pages for installation, and installs everything into place.

PREFIX=	/usr/local
PAGES=	zebu.1.gz zebu.conf.5.gz
INSTFLAGS= -o root -g wheel -b

all: man

man: $(PAGES)

clean:
	rm -f $(PAGES)

zebu.1.gz: zebu.1
	gzip -9 -c zebu.1 > zebu.1.gz

zebu.conf.5.gz: zebu.1
	gzip -9 -c zebu.conf.5 > zebu.conf.5.gz

install: all
	install -m 0444 $(INSTFLAGS) zebu.1.gz $(PREFIX)/man/man1
	install -m 0444 $(INSTFLAGS) zebu.conf.5.gz $(PREFIX)/man/man5
	install -m 0555 $(INSTFLAGS) zebu $(PREFIX)/sbin
