#!/bin/bash
# Copies the latest compiled CV PDF to the website and pushes to GitHub.
# Usage: ./scripts/update_cv.sh

set -e

CV_SRC="/Users/dux1n/Desktop/Econ Phd/CV/cv.pdf"
CV_DEST="/Users/dux1n/dux1n4real.github.io/files/cv.pdf"
REPO_DIR="/Users/dux1n/dux1n4real.github.io"

if [ ! -f "$CV_SRC" ]; then
  echo "Error: CV not found at $CV_SRC"
  exit 1
fi

cp "$CV_SRC" "$CV_DEST"
echo "Copied cv.pdf to website."

cd "$REPO_DIR"
git add files/cv.pdf
git commit -m "update CV ($(date '+%Y-%m-%d'))"
git push origin master
echo "Done. CV is now live."
