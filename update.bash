#!/bin/bash

# Configuration bits...
CHISEL_HASH="b957336f965fc0b081df773929f42ab2a5fc115a"

# Reference the main directory, for later
TOP="$(pwd)"
SRC="$TOP"/src

# Create a temporary directory in which we'll be doing all the dirty
# work
TMP="$(mktemp -d -t chisel-benchmarks.XXXXXXXXXX)"
trap "rm -rf $TMP" EXIT

mkdir -p "$SRC"

# First we go ahead and clone the main Chisel repository
cd $TMP
git clone git://github.com/ucb-bar/chisel.git --reference /var/cache/git

# Build a copy of Chisel so we can obtain the JAR file
cd "$TMP"/chisel
git reset --hard $CHISEL_HASH
sbt publish-local

# Copy that JAR file out into the target directory.
cd "$TMP"/chisel/
cat "$(find -name "chisel_*-SNAPSHOT.jar")" | base64 > "$SRC"/chisel-jar.bash

# Also attempt to generate a tarball of the headers that come out of
# the Chisel distribution, for later use.
cd "$TMP"/chisel/src/main/resources/
find -iname "*.h" | xargs tar -c | base64 > "$SRC"/headers-tar.bash
