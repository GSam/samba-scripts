#!/bin/bash

WORK_DIR=`mktemp -d -p "$DIR"`
function cleanup {      
  rm -rf "$WORK_DIR"
}

trap cleanup EXIT

STORE=$(git diff HEAD~ --name-only)
git diff HEAD~ --name-only | cat

git diff HEAD~..HEAD | csplit  --prefix=$WORK_DIR/patch - "/diff --git/" "{*}" -z
git reset HEAD~ --hard

for f in $WORK_DIR/patch*; do
    echo $f
    if ! patch -R -p1 -s -f --dry-run < $f; then
        patch -p1 < $f
    fi
done

for f in $STORE; do
    git add $f
    git commit -m "$f" $f
done
