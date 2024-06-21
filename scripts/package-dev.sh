#!/usr/bin/env bash

set -e

if [ -n "$DIST_VERSION" ]; then
    version=$DIST_VERSION
else
    version=`git describe --dirty --tags || echo unknown`
fi

yarn clean
VERSION=$version yarn build:dev

# include the sample config in the tarball. Arguably this should be done by
# `yarn build`, but it's just too painful.
cp config.sample.json webapp/

mkdir -p dist
cp -r webapp privateline-comms-$version

# Just in case you have a local config, remove it before packaging
rm privateline-comms-$version/config.json || true

$(dirname $0)/normalize-version.sh ${version} > privateline-comms-$version/version

tar chvzf dist/privateline-comms-$version.tar.gz privateline-comms-$version
rm -r privateline-comms-$version

echo
echo "Packaged dist/privateline-comms-$version.tar.gz"
