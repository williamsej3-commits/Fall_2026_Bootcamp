#!/usr/bin/env bash

PATH_TO_CHECK="${1:-.}"

echo "DISK SNAPSHOT"
echo "============="
echo "Target path: $PATH_TO_CHECK"
echo

echo "Filesystem usage:"
df -h "$PATH_TO_CHECK"
echo

echo "Directory size:"
du -sh "$PATH_TO_CHECK" 2>/dev/null
echo

echo "File count:"
find "$PATH_TO_CHECK" -maxdepth 2 -type f 2>/dev/null | wc -l


