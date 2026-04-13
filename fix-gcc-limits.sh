#!/usr/bin/env bash

# > Normally one of them, limits.h,
# > would in turn include the corresponding system limits.h header,
# > in this case, $LFS/usr/include/limits.h.
# > However, at the time of this build of GCC $LFS/usr/include/limits.h does not exist,
# > so the internal header that has just been installed is a partial, self-contained file
# > and does not include the extended features of the system header.
# Source: https://www.linuxfromscratch.org/mlfs/view/dev-openrc/chapter05/gcc-pass1.html

cd ${BUILDDIR}/${target}/gcc

srcdir="../../gcc-${GCC_VER}/gcc"
libgccdir="${prefix}/lib/gcc/${target}/${GCC_VER}/include"

if [ ! -f  fixed-gcc-limits ]; then
    cat \
        ${srcdir}/limitx.h \
        ${srcdir}/glimits.h \
        ${srcdir}/limity.h \
        > $libgccdir/limits.h \
        || { echo "Error fixing limits.h"; exit 1; }
    touch fixed-gcc-limits
fi
