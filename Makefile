PREFIX=/usr/local
NAME=autobuild
VERSION=`./$(NAME) --version|head -1|cut -d\  -f 3`

all:
	@echo "Use 'make install'."

$(NAME).1: $(NAME)
	help2man --name="Generate HTML build logs" ./$(NAME) > $(NAME).1

.PHONY: install
install: autobuild.1
	install -D -c $(NAME) $(PREFIX)/sbin/$(NAME)
	install -D -c -m 644 $(NAME).1 $(PREFIX)/man/man1/$(NAME).1

clean:
	rm -f *~ *.bak autobuild-log*.txt

# Maintainer targets below.

.PHONY: release
release: $(NAME).1 ChangeLog
	rm -rf $(NAME)-$(VERSION){,.tar.gz,.tar.gz.sig}
	mkdir $(NAME)-$(VERSION)
	cp $(NAME) $(NAME).1 ChangeLog Makefile COPYING $(NAME)-$(VERSION)
	tar cfz $(NAME)-$(VERSION).tar.gz $(NAME)-$(VERSION)
	gpg -b $(NAME)-$(VERSION).tar.gz
	rm -rf $(NAME)-$(VERSION)

.PHONY: ChangeLog
ChangeLog:
	rm -f ChangeLog
	cvs2cl --FSF --fsf --usermap .cvsusers -I ChangeLog -I .cvs
	cvs commit -m "Generated." ChangeLog
