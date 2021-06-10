#!/bin/sh
#
# This script builds RPM and DEB package for mydumper.
# To compile binaries look at https://github.com/maxbube/mydumper_builder
# Requirements: yum install rpm-build dpkg dpkg-devel fakeroot

SOURCE=/tmp/src/mydumper
TARGET=/opt/PKGS
WORK_DIR=/tmp/pkgbuild-`date +%s`
EXTRA_SUFFIX=""
set -e

PROJECT=mydumper
WORKSPACE=$(dirname "$(readlink -f "$0")")

if [ "$#" = 2 ]; then
    VERSION=$1
    RELEASE=$2
else
    echo "USAGE: sh build.sh <version> <revision>"
    exit 1
fi

REALVERSION=${VERSION}

build_rpm() {
    ARCH=x86_64
    SUBDIR=$1
    DISTRO=$2

    mkdir -p $WORK_DIR/{BUILD,BUILDROOT,RPMS,SOURCES,SRPMS} $WORK_DIR/SOURCES/$PROJECT-$VERSION $TARGET
    cp -r $SOURCE/$SUBDIR/* $WORK_DIR/SOURCES/$PROJECT-$VERSION
    cd $WORK_DIR/SOURCES
    tar czf $PROJECT-$VERSION.tar.gz $PROJECT-$VERSION/
    cd ..

    rpmbuild -ba $WORKSPACE/rpm/$PROJECT.spec \
             --define "_topdir $WORK_DIR" \
             --define "version $VERSION" \
             --define "release $RELEASE" \
             --define "distro $DISTRO"
    PKG=$PROJECT-$VERSION-$RELEASE.$DISTRO.$ARCH.rpm
    mv RPMS/$PKG $TARGET

    rpm -qpil --requires $TARGET/$PKG
    echo
    echo "RPM done: $TARGET/$PKG"
    echo
    rm -rf $WORK_DIR
}

build_deb() {
    ARCH=amd64
    SUBDIR=$1
    DISTRO=$2

    mkdir -p $WORK_DIR/${PROJECT}_${VERSION}/DEBIAN $TARGET
    cd $WORK_DIR
    cp $WORKSPACE/deb/* $WORK_DIR/${PROJECT}_$VERSION/DEBIAN/
    sed -i "s/%{version}/$VERSION-$RELEASE/" $WORK_DIR/${PROJECT}_$VERSION/DEBIAN/control
    $WORKSPACE/deb/files $SOURCE/$SUBDIR $WORK_DIR/${PROJECT}_$VERSION

    fakeroot dpkg --build ${PROJECT}_$VERSION
    PKG=${PROJECT}_$REALVERSION-${RELEASE}${EXTRA_SUFFIX}.${DISTRO}_${ARCH}.deb
    mv ${PROJECT}_$VERSION.deb $TARGET/$PKG

    echo
    dpkg -I $TARGET/$PKG
    dpkg -c $TARGET/$PKG
    echo
    echo "DEB done: $TARGET/$PKG"
    echo
    rm -rf $WORK_DIR
}

# function "source dir" "distro"
#build_rpm "el6" "el6"
build_rpm "el7" "el7"
build_rpm "el8" "el8"

build_deb "trusty" "trusty"
build_deb "xenial" "xenial"
build_deb "bionic" "bionic"
build_deb "focal" "focal"

#build_deb "wheezy" "wheezy"
VERSION=${REALVERSION}jessie
build_deb "jessie" "jessie"
VERSION=${REALVERSION}stretch
build_deb "stretch" "stretch"
VERSION=${REALVERSION}buster
build_deb "buster" "buster"


EXTRA_SUFFIX="-80"
build_deb "xenial8" "xenial"
build_deb "bionic8" "bionic"
build_deb "focal8" "focal"

#build_deb "wheezy" "wheezy"
VERSION=${REALVERSION}jessie
build_deb "jessie8" "jessie"
VERSION=${REALVERSION}stretch
build_deb "stretch8" "stretch"
VERSION=${REALVERSION}buster
build_deb "buster8" "buster"




exit 0
