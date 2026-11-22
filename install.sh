#!/usr/bin/env bash
# Sets up a fresh Pop!_OS (or Ubuntu) install the way this one was: i3 with
# polybar, rofi, feh and i3lock; kitty and zsh (oh-my-zsh); the fonts; the
# apps; and the tools for building SupaModel and the other Flutter apps.
#
# Run it from this folder, as yourself (not with sudo; it asks for your
# password when it needs it):
#
#   cd ~/Dev/dotfiles && ./install.sh
#
# Safe to run again: what is already there is skipped, and a config file
# already in place is moved aside to <name>.before-dotfiles, never deleted.
# The configs are linked back here, so a change to them is a change to the
# dotfiles.
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
step() { printf '\n\033[1;32m==> %s\033[0m\n' "$*"; }
have() { command -v "$1" >/dev/null 2>&1; }

if [ "$(id -u)" -eq 0 ]; then
  echo "Run this as yourself, not with sudo." >&2
  exit 1
fi

# ---------------------------------------------------------------- programs

step "The apps' own sources (Brave, VS Code, Vivaldi, Cursor, Proton VPN)"
for k in "$here"/Apt/keyrings/*.gpg; do
  sudo install -m 644 "$k" /usr/share/keyrings/
done
for s in "$here"/Apt/sources/*.sources; do
  sudo install -m 644 "$s" /etc/apt/sources.list.d/
done

step "Programs from apt"
sudo apt update
packages=(
  # The desktop: i3 and what its config and polybar start
  i3 i3lock polybar rofi feh kitty x11-xserver-utils xorg
  # The shell
  zsh zsh-autosuggestions zsh-syntax-highlighting micro tree htop jq curl wget git
  unzip xz-utils zip pipx fontconfig
  # Building the Flutter apps for Linux (SupaModel's window, its web view)
  clang cmake ninja-build pkg-config libgtk-3-dev libglu1-mesa libwebkit2gtk-4.1-dev
  # Java 21 for Android builds
  openjdk-21-jdk
  # Everyday apps
  chromium brave-browser code vivaldi-stable cursor proton-vpn-gnome-desktop
  libreoffice vlc transmission-qt gimp inkscape krita imagemagick libimage-exiftool-perl
)
# A package a source no longer has is skipped, not the end of the script.
for p in "${packages[@]}"; do
  if ! dpkg -s "$p" >/dev/null 2>&1; then
    sudo apt install -y "$p" || echo "   (couldn't install $p; skipped)"
  fi
done

step "The font i3, polybar and kitty use: RobotoMono Nerd Font"
if ! fc-list | grep -qi "RobotoMono Nerd Font"; then
  fonts="$HOME/.local/share/fonts/RobotoMono"
  mkdir -p "$fonts"
  tmp="$(mktemp -d)"
  curl -fsSL -o "$tmp/RobotoMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/RobotoMono.zip
  unzip -oq "$tmp/RobotoMono.zip" -d "$fonts"
  rm -rf "$tmp"
  fc-cache -f >/dev/null
fi

# ------------------------------------------------------------------- shell

step "oh-my-zsh, and zsh as your shell"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
if [ "$(getent passwd "$USER" | cut -d: -f7)" != "$(command -v zsh)" ]; then
  chsh -s "$(command -v zsh)"
fi

# ------------------------------------------------------------------ configs

step "The configs, linked to this folder"
link() { # $1 = file here, $2 = where it goes
  mkdir -p "$(dirname "$2")"
  if [ -e "$2" ] && [ ! -L "$2" ]; then
    mv "$2" "$2.before-dotfiles"
    echo "   moved your old $2 to $2.before-dotfiles"
  fi
  ln -sfn "$1" "$2"
}
link "$here/Dots/.zshrc" "$HOME/.zshrc"
link "$here/Dots/i3/config" "$HOME/.config/i3/config"
link "$here/Polybar/config.ini" "$HOME/.config/polybar/config.ini"
link "$here/Polybar/launch.sh" "$HOME/.config/polybar/launch.sh"
link "$here/Polybar/scripts/fred.sh" "$HOME/.config/polybar/scripts/fred.sh"
link "$here/Kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
mkdir -p "$HOME/Pictures/Wallpapers"
cp -n "$here"/Wallpaper/* "$HOME/Pictures/Wallpapers/"
chmod +x "$here/Polybar/launch.sh" "$here/Polybar/scripts/fred.sh"

step "No system beep"
if have gsettings; then
  gsettings set org.gnome.desktop.sound event-sounds false 2>/dev/null || true
  gsettings set org.gnome.desktop.wm.preferences audible-bell false 2>/dev/null || true
fi

# -------------------------------------------------------------- dev tools

step "Rust, and the tools SupaModel's Rust engine is built with"
if [ ! -x "$HOME/.cargo/bin/rustup" ]; then
  curl -fsSL https://sh.rustup.rs | sh -s -- -y
fi
# shellcheck disable=SC1091
. "$HOME/.cargo/env"
# SupaModel for Android: Rust's Android parts (phones and tablets, older
# phones, the emulator), and cargo-ndk (below), which builds the engine with
# the NDK.
rustup target add aarch64-linux-android armv7-linux-androideabi x86_64-linux-android
# One build at a time: more runs this computer out of memory.
for tool in "flutter_rust_bridge_codegen@2.13.0" cargo-ndk cargo-expand cargo-deny wallust; do
  name="${tool%@*}"
  if ! have "$name"; then
    cargo install -j 1 --locked "$tool" || echo "   (couldn't build $name; skipped)"
  fi
done

step "Flutter (stable) in ~/Flutter"
if [ ! -d "$HOME/Flutter" ]; then
  git clone --branch stable https://github.com/flutter/flutter.git "$HOME/Flutter"
fi
"$HOME/Flutter/bin/flutter" config --enable-linux-desktop >/dev/null
"$HOME/Flutter/bin/flutter" precache --linux >/dev/null || true

step "Node (nvm): 20, which the zsh config uses, and 22"
if [ ! -d "$HOME/.nvm" ]; then
  PROFILE=/dev/null bash -c "$(curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh)"
fi
# shellcheck disable=SC1091
( . "$HOME/.nvm/nvm.sh" && nvm install 20 && nvm install 22 && nvm alias default 22 ) >/dev/null

step "Google Cloud SDK in ~/Downloads (where the zsh config looks)"
if [ ! -d "$HOME/Downloads/google-cloud-sdk" ]; then
  mkdir -p "$HOME/Downloads"
  curl -fsSL https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz | tar -xz -C "$HOME/Downloads"
  "$HOME/Downloads/google-cloud-sdk/install.sh" --quiet --usage-reporting false --path-update false --command-completion false
fi

step "yt-dlp, and Claude Code for the terminal"
have yt-dlp || pipx install yt-dlp
have claude || curl -fsSL https://claude.ai/install.sh | bash

# ------------------------------------------------------------------- done

cat <<'EOF'

All done. Log out, pick i3 at the login screen, and log in.

Still to do by hand (each needs you there):
  - Android SDK: install Android Studio, or the command-line tools into
    ~/Android/Sdk, then run:  flutter doctor --android-licenses
  - Sign in again: gcloud auth login, Claude Code (run claude), GitHub
    (copy your ~/.ssh keys back first), Proton VPN.
  - Put back what you saved from the old install (see the README).
EOF
