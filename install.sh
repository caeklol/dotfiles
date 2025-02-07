#!/bin/bash

# scrumptious bash scripting
# yeah gippity wrote this
# the boring parts at least

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

  cp -r "$general_dir" "$merged_dir/$dir"

  if [ -d $host_dir ]; then
	  host_specific_files=$(find $host_dir -type f | sed "s/^$1\///")
	  IFS=$'\n' read -rd '' -a host_specific_files <<<"$host_specific_files" # host_specific_files = split($hsf, "\n")
	  for file in "${host_specific_files[@]}"; do
		file_without_path=$(dirname "$file")
		mkdir -p "$merged_dir/$file_without_path"
	  	cp "$1/$file" "$merged_dir/$file" # -r might be unnecessary but idk
	  done
  fi

done

echo "Stowing $merged_dir"
cd $merged_dir
stow -t ~ $(ls)
cd -
