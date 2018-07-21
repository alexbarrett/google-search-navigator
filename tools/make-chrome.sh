#!/usr/bin/env bash

##
# This script builds the extension for the Chrome browser.
##
set -e

echo "Building Google Search Navigator for Chrome"

# Copy the sources into the working directory
BIN=build/chrome
OBJ="$BIN/obj"

echo "Cleaning up previous builds..."
# cleanup the previous build
rm -rf "$OBJ"
mkdir -p "$OBJ"

echo "Copying files..."
cp -R src/*.{html,css,json} "$OBJ"
cp build/src/keymaster.js "$OBJ"
cp icons/* "$OBJ"

echo "Compiling Typescript..."
npx tsc --outDir "$OBJ"

echo "Creating package..."
zip -FS "$BIN/package.zip" $OBJ/*

echo "Build complete"
