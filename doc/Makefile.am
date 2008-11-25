# Copyright (C) 2004, 2008 Simon Josefsson.
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

EXTRA_DIST = autobuild.html autobuild.ps autobuild.pdf texinfo.css

info_TEXINFOS = autobuild.texi htmlfontify.texi
autobuild_TEXINFOS = gpl-3.0.texi fdl-1.3.texi

AM_MAKEINFOHTMLFLAGS = --no-split --number-sections --css-include=texinfo.css

# Man pages.

dist_man_MANS = autobuild.1 htmlize.1
MAINTAINERCLEANFILES = $(dist_man_MANS)

autobuild.1: $(top_srcdir)/autobuild $(top_srcdir)/configure.ac
	$(HELP2MAN) --no-info \
		--name="Read and parse build logs" \
		--output=$@ $(top_srcdir)/autobuild

htmlize.1: $(top_srcdir)/htmlize $(top_srcdir)/configure.ac
	$(HELP2MAN) --no-info \
		--name="Convert file to fancy HTML markup" \
		--output=$@ $(top_srcdir)/htmlize
