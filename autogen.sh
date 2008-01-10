#!/bin/sh
rm -f confdefs.h config.* configure aclocal.m4 stamp-h* install-sh missing mkinstalldirs
rm -rf autom4te.cache
find . -name Makefile -exec rm {} \;
find . -name Makefile.in -exec rm {} \;

echo "Running aclocal..."
aclocal $ACLOCAL_FLAGS || exit 1
echo "Done with aclocal"

echo "Running autoheader..."
autoheader || exit 1
echo "Done with autoheader"

echo "Running aclocal..."
automake --copy --add-missing || exit 1
echo "Done with automake"

echo "Running autoconf..."
autoconf || exit 1
echo "Done with autoconf"
