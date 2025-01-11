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

  # If no host-specific directory, just copy the general directory
  if [ ! -d "$host_dir" ]; then
    cp -r "$general_dir" "$merged_dir/$dir"
    continue
  fi

  # Create destination directory for the current target
  mkdir -p "$merged_dir/$dir"

  while IFS= read -r -d '' file; do
    filename=$(basename "$file")
    if [ -f "$host_dir/$filename" ]; then
      cp "$host_dir/$filename" "$merged_dir/$dir/$filename"
    else
      cp "$file" "$merged_dir/$dir/$filename"
    fi
  done < <(find "$general_dir" -mindepth 1 -maxdepth 1 -type f -print0)

  while IFS= read -r -d '' file; do
    filename=$(basename "$file")
    if [ ! -f "$general_dir/$filename" ]; then
      cp "$file" "$merged_dir/$dir/$filename"
    fi
  done < <(find "$host_dir" -mindepth 1 -maxdepth 1 -type f -print0)
done

echo "Stowing $merged_dir"
cd $merged_dir
stow -t ~ $(ls)
cd -
