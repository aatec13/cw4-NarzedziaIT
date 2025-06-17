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
  echo "--date    - wyświetlenie dzisiejszej daty"
  echo "--logs [n] - utworzenie 100 plików log.txt"
fi
