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

SUBDIRS = doc examples elisp tests

ACLOCAL_AMFLAGS = -I m4

m4datadir = $(datadir)/aclocal
m4data_DATA = m4/autobuild.m4

dist_bin_SCRIPTS = autobuild htmlize \
	abput abput-sourceforge abput-testdrive \
	abbuild abbuild-sourceforge

# Maintainer targets below.

ChangeLog:
	git log --pretty --numstat --summary | git2cl > ChangeLog
	cat .clcopying >> ChangeLog

tag = $(PACKAGE)-`echo $(VERSION) | sed 's/\./-/g'`
htmldir = ../www-$(PACKAGE)

release:
	! git-tag -l $(tag) | grep $(PACKAGE) > /dev/null
	rm -f ChangeLog
	$(MAKE) ChangeLog distcheck
	gpg -b $(distdir).tar.gz
	gpg --verify $(distdir).tar.gz.sig
	git commit -m Generated. ChangeLog
	git-tag -u b565716f! -m $(VERSION) $(tag)
	git-push
	git-push --tags
	cd doc && ../build-aux/gendocs.sh --html "--css-include=texinfo.css" \
		-o ../$(htmldir)/manual/ $(PACKAGE) "Autobuild"
	scp $(distdir).tar.gz $(distdir).tar.gz.sig jas@dl.sv.nongnu.org:/releases/autobuild/
	cd $(htmldir) && cvs commit -m "Update." manual/
