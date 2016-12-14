#!/bin/bash

set -e

file_pattern=$1

function main {
  for revision in `revisions`; do
    echo "`number_of_lines` `commit_description`"
  done
}

function revisions {
  git rev-list --reverse HEAD
}

function commit_description {
  git log --oneline -1 $revision
}

function number_of_lines {
  git ls-tree -r $revision |
  grep "$file_pattern" |
  awk '{print $3}' |
  xargs git show |
  wc -l
}

main
