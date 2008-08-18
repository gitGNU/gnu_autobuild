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

EXTRA_DIST = libidn.txt libidn2.txt libidn.expect

example.html: libidn.txt libidn2.txt
	$(top_srcdir)/htmlize libidn2.txt libidn2.html && \
		$(top_srcdir)/autobuild libidn.txt libidn2.html > example.html
