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

EXTRA_DIST = libidn.txt

example.html: libidn.txt
	$(top_srcdir)/autobuild libidn.txt
	$(top_srcdir)/autobuild --html libidn.txt
	$(top_srcdir)/autobuild --html libidn.txt --hostname latte --timestamp=20040607-0220
	$(top_srcdir)/abindex autobuild,*,log.* > example.html
