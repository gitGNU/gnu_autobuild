# Copyright (C) 2004 Simon Josefsson.
#
# This file is part of Autobuild.
#
# Autobuild is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
#
# Autobuild is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Autobuild; see the file COPYING.  If not, write to the
# Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
# MA 02111-1307, USA.

ACLOCAL_AMFLAGS = -I .

m4datadir = $(datadir)/aclocal
m4data_DATA = autobuild.m4

dist_bin_SCRIPTS = autobuild abindex
dist_man_MANS = autobuild.1 abindex.1
MAINTAINERCLEANFILES = autobuild.1 abindex.1

EXTRA_DIST = logs/autobuild.log
TESTS = tst-autobuild

autobuild.1: autobuild $(top_srcdir)/configure.ac
	$(HELP2MAN) --no-info \
		--name="Read and parse build logs" \
		--output=$@ $(top_builddir)/autobuild

abindex.1: abindex $(top_srcdir)/configure.ac
	$(HELP2MAN) --no-info \
		--name="Create HTML index to build logs" \
		--output=$@ $(top_builddir)/abindex

# Maintainer targets below.

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
	echo "directory: $(PACKAGE)" > $(distdir).tar.gz.directive
	gpg --clearsign $(distdir).tar.gz.directive
	cp -v $(distdir).tar.gz{,.sig} $(htmldir)/releases/
	cd $(htmldir) && cvs add -kb releases/$(distdir).tar.gz{,.sig} && \
		cvs commit -m "Update." releases/
