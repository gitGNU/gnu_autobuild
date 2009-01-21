dnl Copyright (C) 2004, 2005, 2007, 2008, 2009 Simon Josefsson.
dnl
dnl This file is part of Autobuild.
dnl
dnl Autobuild is free software: you can redistribute it and/or modify
dnl it under the terms of the GNU General Public License as published by
dnl the Free Software Foundation, either version 3 of the License, or
dnl (at your option) any later version.
dnl
dnl Autobuild is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
dnl GNU General Public License for more details.
dnl
dnl You should have received a copy of the GNU General Public License
dnl along with Autobuild.  If not, see <http://www.gnu.org/licenses/>.

AC_PREREQ(2.60)
AC_INIT(autobuild, 5.2, bug-autobuild@josefsson.org)

AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE(gnits)

gl_EARLY

AM_MISSING_PROG(HELP2MAN, help2man, $missing_dir)

AC_PATH_PROG(PERL, perl)
if test -z "$PERL"; then
   AC_MSG_ERROR([perl not found])
fi
$PERL -e 'require 5.005;' || {
   AC_MSG_ERROR([perl 5.005 or better is required])
}

AM_PATH_LISPDIR

gl_INIT

AC_CONFIG_FILES([
  Makefile
  doc/Makefile
  examples/Makefile
  elisp/Makefile
  tests/Makefile
])
AC_OUTPUT
