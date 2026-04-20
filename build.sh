#!/bin/bash
# Build script for progress-abl-skills distribution package
set -e

DIST_DIR="dist"
VERSION="1.0.0"

echo "Building progress-abl-skills distribution package..."

mkdir -p "$DIST_DIR"
rm -f "$DIST_DIR"/*.skill

echo "Packaging progress-abl skill..."
(cd skills && zip -rq "../$DIST_DIR/progress-abl.skill" "progress-abl/" -x "*.DS_Store")

echo ""
echo "Build complete! File in $DIST_DIR/:"
ls -lh "$DIST_DIR/progress-abl.skill"
