#!/bin/bash

if [ "$1" == "--date" ]; then
  echo "Data: $(date)"
fi

if [ "$1" == "--logs" ]; then
  num_files=100
  if [ -n "$2" ]; then
    num_files=$2
  fi
  
  for ((i=1; i<=num_files; i++)); do
    echo "log${i}.txt - skrypt.sh - $(date)" > "log${i}.txt"
  done
  echo "Utworzono $num_files plików log."
fi

if [ "$1" == "--help" ]; then
  echo "Opcje:"
  echo "--date /d    - wyświetlenie dzisiejszej daty"
  echo "--logs [n] / -l [n] - utworzenie 100 plików log.txt"
  echo "--help / -h        - wyswietlenie pomocy"
  echo "--init             - klonowanie repo i ustawienie PATH"
  echo "--error [n] / -e [n] - utworzenie plików errorx/errorx.txt"
fi

elif [[ "$1" == "--init" ]]; then
    REPO_URL=$(git config --get remote.origin.url)
    TARGET_DIR="$(pwd)/repo-klon"

    git clone "$REPO_URL" "$TARGET_DIR"

    export PATH="$PATH:$TARGET_DIR"
    echo "Skrypt dodany do PATH: $TARGET_DIR"

elif [[ "$1" == "--error" || "$1" == "-e" ]]; then
    num_files=100
    [[ -n "$2" ]] && num_files=$2

    for ((i=1; i<=num_files; i++)); do
        mkdir -p "error${i}"
        echo "error${i}/error${i}.txt - skrypt.sh - $(date)" > "error${i}/error${i}.txt"
    done
    echo "Utworzono $num_files katalogów z plikami error."


