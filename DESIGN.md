# Design and compatibility

The calendar artwork supplies the ornament. Application surfaces are deliberately quiet. This is one dark variant.

| Role | Colour | Use |
| --- | --- | --- |
| Ink | `#171313` | Primary surfaces |
| Deep ink | `#110e0e` / `#0c0909` | Recessed surfaces |
| Raised lacquer | `#2b2021` | Elevated/editor surfaces |
| Oxblood | `#503137` | Selection background |
| Parchment | `#eee0cd` | Ordinary text |
| Ivory | `#fff5e6` | Selected text and cursor |
| Antique gold | `#d9b66f` | Accents and active borders |
| Ash rose | `#a68e86` | Muted and disabled text |
| Coral | `#ed8274` | Errors |
| Jade | `#a6bf8e` | Success |
| Amber | `#e6c477` | Warnings |
| Porcelain | `#9cafcf` | Information / blue syntax |
| Celadon | `#8ebfbb` | Cyan syntax |
| Plum | `#cfa0ba` | Magenta syntax |

Native labels/icons accompany state colours. Transparency and actual font rendering need live checks. Omarchy owns focus, hover, selection, spacing and font controls; no custom shell sections are needed. Review low-alpha focus borders on the real display.

## Application coverage

Sources inspected from `omacom/omarchy`, branch `quattro`, on 20 September 2026. Installed app versions are unavailable here. Blob hashes are recorded in VALIDATION.md.

| Surface | Source | Behaviour | Evidence / reload |
| --- | --- | --- | --- |
| Bar, menus, launcher, popups, notifications, polkit, lock | `default/themed/shell.toml.tpl` | Ink, parchment and gold; native layout | Generated config checked; live rendering NOT RUN; theme-set hot reload |
| Window borders | `default/themed/hyprland.lua.tpl` | Gold active, warm grey inactive | Generated config checked; compositor NOT RUN; restart-hyprctl hook |
| Kitty | `default/themed/kitty.conf.tpl` | ANSI palette and oxblood selection | Generated config checked; app NOT RUN; restart-terminal hook |
| Neovim | `default/themed/neovim.lua.tpl` | Aether semantic palette | Generated config checked; Neovim/Aether NOT RUN; reopen editor |
| btop | `default/themed/btop.theme.tpl` | Semantic graph colours and gold selections | Generated config checked; app NOT RUN; restart-btop hook |
| GTK apps | `bin/omarchy-theme-set-gnome` | Prefer-dark / Adwaita-dark | Hook inspected; DBus/GTK NOT RUN |
| Other apps | Installed Omarchy templates | Palette inheritance where supported | NOT RUN; no inferred compatibility pass |

## XPS verification

Record `omarchy-version`, `git -C "$OMARCHY_PATH" rev-parse HEAD`, theme hashes, session version, monitor mode and scale. Check the current bar orientation, 1× and actual XPS scale. Inspect bar text, calendar labels, launcher selection, keyboard focus, disabled controls, notifications, password prompts, a terminal, editor and GTK file chooser.

Switch into the theme, out again, and back a second time. Check shell restart/login and app reloads. Preserve previous theme/background and restore them after temporary testing. Test the Git-installed path before public release; never remove `.git` to alter staging rules.
