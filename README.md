# Dotfiles

i3 on Pop!_OS (or Ubuntu): polybar with economy numbers, rofi, kitty, zsh
with oh-my-zsh, RobotoMono Nerd Font.

| Folder | What |
|---|---|
| `Dots/.zshrc` | zsh |
| `Dots/i3/config` | i3 |
| `Polybar/` | polybar, its launcher and the economy numbers script |
| `Kitty/kitty.conf` | kitty |
| `Wallpaper/` | wallpapers |
| `Apt/` | the sources and public keys for Brave, VS Code, Vivaldi, Cursor and Proton VPN |

## A new install

```
cd ~/Dev/dotfiles && ./install.sh
```

It installs the programs, the font, oh-my-zsh, Rust, Flutter, Node, the
Google Cloud SDK and Claude Code, and links the configs here. Safe to run
again. The Android SDK and signing in to everything are by hand (the
script says how at the end).

## Before wiping the old install

Copy these somewhere off the computer. None of them are in git:

- `~/Documents/SupaModel Workbooks` (your models)
- `~/.ssh` (your GitHub key)
- `~/.claude` (Claude's memory and conversations)
- `~/Dev/sec-data` and `~/Dev/Investments`
- The private settings files git leaves out:
  `~/Dev/server/app_config.json`, `~/Dev/server/functions/.env`,
  `~/Dev/SupaModel/.secrets/`, `~/Dev/HustlaApp/android/key.properties`,
  `~/Dev/HustlaApp/firebase/functions/.env.hustla-dev-env` and
  `.env.hustla-prod-env`
- The HustlaApp signing key (`hustla-redux-x7gx9y-keystore.jks`), wherever
  you keep it: it isn't on this computer
