#!/bin/bash

# scrumptious bash scripting
# yeah gippity wrote this

targets=("bash" "git" "kitty" "nvim" "omp" "tmux")

if [ -z "$1" ]; then
  echo "Error: No host provided."
  echo "Usage: $0 <host>"
  exit 1
fi

if [ ! -d "$1" ]; then
  echo "Error: $1 was not found"
  exit 1
fi

merged_dir="built_dotfiles"
rm -rf "$merged_dir"
mkdir -p "$merged_dir"

for dir in "${targets[@]}"; do
  echo "Processing directory: $dir"
  general_dir="$dir"
  host_dir="$1/$dir"

  if [ ! -d "$host_dir" ]; then
    cp -r "$general_dir" "$merged_dir/$dir"
else
    cp -r "$host_dir" "$merged_dir/$dir"
  fi
done

echo "Stowing $merged_dir"
cd $merged_dir
stow -t ~ $(ls)
cd -
