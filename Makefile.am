# Copyright (C) 2004, 2005, 2008 Simon Josefsson.
#
# This file is part of Autobuild.
#
# Autobuild is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Autobuild is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Autobuild.  If not, see <http://www.gnu.org/licenses/>.

SUBDIRS = doc examples

ACLOCAL_AMFLAGS = -I .

m4datadir = $(datadir)/aclocal
m4data_DATA = autobuild.m4

dist_lisp_DATA = htmlfontify.el hfy-cmap.el hfy-emacs20.el

dist_bin_SCRIPTS = autobuild htmlize \
	abput abput-sourceforge abput-testdrive \
	abbuild abbuild-sourceforge

TESTS = tst-autobuild tst-simple
dist_check_SCRIPTS = $(TESTS)

# Maintainer targets below.

# update-po:
# wget --no-verbose --retr-symlinks `curl $(POURL)/ | grep text.gif | sed 's,.*href="\(.*.po\)".*,$(POURL)/\1,g'`

ChangeLog:
	rm -f ChangeLog
	cvs2cl --FSF --fsf --usermap .cvsusers -I ChangeLog -I .cvs
	cat .cvscopying >> ChangeLog
	cvs commit -m "Generated." ChangeLog

tag = $(PACKAGE)-`echo $(VERSION) | sed 's/\./-/g'`
htmldir = ../www-$(PACKAGE)

release:
	cvs upd -p -r HEAD NEWS > /dev/null
	if cvs upd -p -r $(tag) NEWS > /dev/null; then false else true; fi
	rm -f ChangeLog && cvs upd ChangeLog
	cvs commit
	rm -f ChangeLog
	$(MAKE) ChangeLog distcheck
	cvs commit -m "" ChangeLog
	cvs rtag $(tag) $(PACKAGE)
	gpg -b $(distdir).tar.gz
	gpg --verify $(distdir).tar.gz.sig
	cd doc && ./gendocs.sh --html "--css-include=texinfo.css" \
		-o ../$(htmldir)/manual/ $(PACKAGE) "Autobuild"
	cp -v $(distdir).tar.gz{,.sig} $(htmldir)/releases/
	cd $(htmldir) && cvs add -kb releases/$(distdir).tar.gz{,.sig} && \
		cvs commit -m "Update." manual/ releases/
