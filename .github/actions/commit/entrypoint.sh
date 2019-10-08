#!/bin/bash

set -ex

cd docs || exit 1
git config user.email "github-actions[bot]@users.noreply.github.com"
git config user.name "github-actions[bot]"
if git status -s|grep '\.po'; then
  git add .
  git commit -m '[po] auto sync'
  header="$(echo -n token:"$GITHUB_TOKEN" | base64)"
  git -c http.extraheader="AUTHORIZATION: basic $header" push
fi
