VERSION=2.69
TAR=http://ftp.gnu.org/gnu/autoconf/autoconf-$VERSION.tar.xz

function recipe_version {
    echo "$VERSION"
    skip=1
}

function recipe_update {
    echo "skipping update"
    skip=1
}

function recipe_build {
    wget -O build-aux/config.sub http://git.savannah.gnu.org/cgit/config.git/plain/config.sub
    ./configure --build=${BUILD} --host=${HOST} --prefix=''
    "$REDOX_MAKE" -j"$($NPROC)"
    skip=1
}

function recipe_test {
    echo "skipping test"
    skip=1
}

function recipe_clean {
    "$REDOX_MAKE" clean
    skip=1
}

function recipe_stage {
    dest="$(realpath $1)"
    "$REDOX_MAKE" DESTDIR="$dest" install
    skip=1
}
