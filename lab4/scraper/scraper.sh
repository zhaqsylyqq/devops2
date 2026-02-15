#!/bin/sh
set -eu
REPO_URL="https://raw.githubusercontent.com/zhaqsylyqq/devops2/refs/heads/main/lab4/lab4-content/current.html"
OUT="/data/index.html"

while true; do
  curl -fsSL "$REPO_URL" -o "$OUT" || echo "[scraper] fetch failed"
  sleep 5
done
