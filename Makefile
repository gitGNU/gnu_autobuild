PREFIX=/usr/local
VERSION=1.0
NAME=autobuild

all:
	@echo "Use 'make install'."

$(NAME).1: $(NAME)
	help2man --name="Generate HTML build logs" ./$(NAME) > $(NAME).1

install:
	install -D -c $(NAME) $(PREFIX)/sbin/$(NAME)

clean:
	rm -f *~ *.bak autobuild-log*.txt

# Maintainer targets below.

.PHONY: ChangeLog

$(NAME)-$(VERSION).tar.gz: ChangeLog
	rm -rf $(NAME)-$(VERSION){,.tar.gz,.tar.gz.sig}
	mkdir $(NAME)-$(VERSION)
	cp $(NAME) $(NAME).1 ChangeLog Makefile COPYING $(NAME)-$(VERSION)
	tar cfz $(NAME)-$(VERSION).tar.gz $(NAME)-$(VERSION)
	gpg -b $(NAME)-$(VERSION).tar.gz

ChangeLog:
	rm -f ChangeLog
	cvs2cl --FSF --fsf --usermap .cvsusers -I ChangeLog -I .cvs
	cvs commit -m "Generated." ChangeLog
