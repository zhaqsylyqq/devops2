#!/bin/sh
set -u

URL="https://raw.githubusercontent.com/zhaqsylyqq/devops2/main/lab4/lab4-content/current.html"
OUT="/data/index.html"
COUNT=0

while true; do
  COUNT=$((COUNT+1))
  echo "[scraper-lab4] cycle=$COUNT"

  if curl -fsSL "$URL" -o "$OUT"; then
    echo "[scraper-lab4] updated"
  else
    echo "[scraper-lab4] fetch failed"
  fi

  if [ "$COUNT" -eq 5 ]; then
    echo "[scraper-lab4] simulating crash now"
    exit 1
  fi

  sleep 5
done
