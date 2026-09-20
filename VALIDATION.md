# Validation — 20 September 2026

Status: **0.1.0 candidate ready for local desktop testing**. No live XPS or Quattro session was available. This is not registry acceptance or accessibility certification.

## PASS — portable checks

- Omarchy theme skill Rust helper: palette structure and required contrast pairs passed.
- Real TOML parser accepted the source palette and generated shell config.
- Current upstream palette resolver accepted all values without warnings and resolved all 16 ANSI colours.
- Upstream template generator produced shell, Hyprland, Kitty, Neovim and btop configs with no unresolved placeholders. Key shell colours, native font size and spacing were asserted.
- Template test changed only IO paths and the parser executable location to keep generation isolated. It did not run the complete theme switcher or any desktop hooks.
- No authored terminal configs, Lua payloads, vscode.json or symlinks at the theme root; upstream templates own those configurations.
- Installer passed Bash syntax validation. It checks for an existing destination before copying and does not apply the theme itself. Its live installation has not been exercised.
- All five PNG files fully decoded; none has embedded metadata. File checksums were refreshed after the oxblood edit. The unchanged off-centre wallpaper is first in filename order; the current upstream background picker uses sorted filenames for a fresh selection.

## Contrast measurements

Ratios use opaque sRGB colours; actual alpha states, text sizes and display conditions still need review.

| Foreground / background | Ratio |
| --- | ---: |
| `foreground` / `background` | 14.20:1 |
| `foreground` / `selection` | 8.81:1 |
| `selection_foreground` / `selection` | 10.60:1 |
| `accent` / `background` | 9.54:1 |
| `accent` / `selection` | 5.92:1 |
| `muted` / `background` | 6.00:1 |
| `dark_foreground` / `background` | 7.77:1 |
| `red` / `background` | 7.06:1 |
| `green` / `background` | 9.19:1 |
| `yellow` / `background` | 11.00:1 |
| `blue` / `background` | 8.29:1 |
| `cyan` / `background` | 9.06:1 |
| `magenta` / `background` | 8.24:1 |

## Wallpaper files

| File | Pixels | Bytes |
| --- | --- | ---: |
| `01-ink-and-gold.png` | 1586 × 992 | 2218375 |
| `02-oxblood-celebration.png` | 1586 × 992 | 2505302 |
| `03-moon-gate.png` | 1586 × 992 | 2321754 |
| `04-ten-thousand-mountains.png` | 1586 × 992 | 2582324 |
| `05-zodiac-procession.png` | 1586 × 992 | 2406247 |

## NOT RUN — remaining desktop and release gates

- XPS rendering, monitor scale, font legibility, portrait/ultrawide crops and lock-control overlap.
- Actual shell consumers: bar orientation, focus/hover/selected/disabled states, notifications, polkit and lock.
- Terminal/editor/GTK runtime and installed app versions.
- Full theme switching and restoration, repeated switching, app reloads and shell restart/login.
- Git-installed theme staging and native installation on the target machine.
- Current registry validator, name collision/reservation check and a genuine desktop preview.
- Public redistribution licensing decision and release/registry submission. Repository upload does not imply a licence grant.

## Upstream evidence

Files fetched from `omacom/omarchy` / `quattro`; blob hashes identify each inspected file. No claim is made that a single installed desktop commit was tested.

| Source | Blob SHA |
| --- | --- |
| [default/themed/shell.toml.tpl](https://github.com/omacom/omarchy/blob/quattro/default/themed/shell.toml.tpl) | `b0a68d8b0c44ca0b146c727beb72d27f8a27b5d4` |
| [themes/kanagawa/colors.toml](https://github.com/omacom/omarchy/blob/quattro/themes/kanagawa/colors.toml) | `e897511d903d5387396c0eabb791669dfbf66a2a` |
| [bin/omarchy-theme-set-templates](https://github.com/omacom/omarchy/blob/quattro/bin/omarchy-theme-set-templates) | `de4d599137ec87c7dce0919556f781efacf05f8d` |
| [bin/omarchy-theme-set](https://github.com/omacom/omarchy/blob/quattro/bin/omarchy-theme-set) | `782b4ba70547bbc1e22043e9be93ce26de96d67d` |
| [bin/omarchy-theme-color](https://github.com/omacom/omarchy/blob/quattro/bin/omarchy-theme-color) | `c5d09ca27dea179881cd40b73e40fb955a6a6758` |
| [default/themed/neovim.lua.tpl](https://github.com/omacom/omarchy/blob/quattro/default/themed/neovim.lua.tpl) | `ad4353f73f85dfce3c367af03acd87552988a4ff` |
| [default/themed/kitty.conf.tpl](https://github.com/omacom/omarchy/blob/quattro/default/themed/kitty.conf.tpl) | `e94c1278b9862ecd28240210cce1e3087760f217` |
| [default/themed/btop.theme.tpl](https://github.com/omacom/omarchy/blob/quattro/default/themed/btop.theme.tpl) | `3cc2d77268c9eb3cf3e76b3226a632b60a47b4e3` |
| [default/themed/hyprland.lua.tpl](https://github.com/omacom/omarchy/blob/quattro/default/themed/hyprland.lua.tpl) | `1a2d6d1a511def73a8a60234ce3c64cbc1fcc859` |
| [bin/omarchy-theme-set-gnome](https://github.com/omacom/omarchy/blob/quattro/bin/omarchy-theme-set-gnome) | `ca298ffb8cd4d3e888987ff420b5959d6f6056ea` |
