PREFIX=/usr/local
PACKAGE=autobuild
VERSION=`./autobuild --version|head -1|cut -d\  -f 3`

all:
	@echo "Use 'make install'."

autobuild.1: autobuild
	help2man --name="Generate build logs" ./autobuild > autobuild.1
	cvs commit -m "Generated." autobuild.1

abindex.1: abindex
	help2man --name="Create HTML index to build logs" ./abindex > abindex.1
	cvs commit -m "Generated." abindex.1

.PHONY: install
install: autobuild.1 abindex.1
	install -D -c $(PACKAGE) $(PREFIX)/sbin/$(PACKAGE)
	install -D -c -m 644 autobuild.1 $(PREFIX)/man/man1/autobuild.1
	install -D -c -m 644 abindex.1 $(PREFIX)/man/man1/abindex.1

clean:
	rm -f *~ *.bak

# Maintainer targets below.

.PHONY: ChangeLog
ChangeLog:
	rm -f ChangeLog
	cvs2cl --FSF --fsf --usermap .cvsusers -I ChangeLog -I .cvs
	cvs commit -m "Generated." ChangeLog

.PHONY: release
release: autobuild.1 abindex.1 ChangeLog
	rm -rf $(PACKAGE)-$(VERSION){,.tar.gz,.tar.gz.sig}
	mkdir $(PACKAGE)-$(VERSION)
	cp autobuild autobuild.1 abindex abindex.1 ChangeLog Makefile COPYING $(PACKAGE)-$(VERSION)
	tar cfz $(PACKAGE)-$(VERSION).tar.gz $(PACKAGE)-$(VERSION)
	gpg -b $(PACKAGE)-$(VERSION).tar.gz
	rm -rf $(PACKAGE)-$(VERSION)
