#!/bin/bash

tofu_args=()
show_output=0

while (($# > 0)); do
  case "$1" in
  -show | --show)
    show_output=1
    ;;
  *)
    tofu_args+=("$1")
    ;;
  esac
  shift
done

tofu init || exit 1

if time tofu plan "${tofu_args[@]}" -out plan.out -no-color -concise -input=false >plan.txt 2>plan.err; then
  if ((show_output)); then
    cat plan.txt
  fi
else
  cat plan.err >&2
fi
