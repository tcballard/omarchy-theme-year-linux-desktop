#!/usr/bin/env bash
set -euo pipefail
source_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)
themes_dir="$HOME/.config/omarchy/themes"
destination="$themes_dir/theme-year-linux-desktop"
if [[ ! -f "$source_dir/colors.toml" || ! -d "$source_dir/backgrounds" ]]; then
  echo 'Use the complete extracted theme package.' >&2
  exit 1
fi
if ! command -v omarchy-theme-set >/dev/null 2>&1; then
  echo 'Omarchy theme commands were not found. Run this on your Omarchy desktop.' >&2
  exit 1
fi
if [[ -e "$destination" || -L "$destination" ]]; then
  printf 'Already installed at %s. No files changed.\n' "$destination" >&2
  exit 1
fi
mkdir -p -- "$themes_dir"
previous_file=$(mktemp "$themes_dir/.theme-year-linux-desktop-previous.XXXXXX")
current_state="$HOME/.local/state/omarchy/current"
{
  printf 'Previous theme: '
  if [[ -f "$current_state/theme.name" ]]; then cat -- "$current_state/theme.name"; else printf '(not recorded)\n'; fi
  printf '\nPrevious background: '
  readlink -f -- "$current_state/background" || true
  printf '\n'
} > "$previous_file"
# Exclusive mkdir refuses collisions rather than merging an existing theme.
mkdir -- "$destination"
cp -R -- "$source_dir/." "$destination/"
printf 'Installed: %s\nPrevious selection: %s\n' "$destination" "$previous_file"
printf 'Apply with: omarchy theme set theme-year-linux-desktop\n'
