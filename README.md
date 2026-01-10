# 🧛 personal nvim config

This is my **personal Neovim configuration**.

I built this while daily-driving Neovim and slowly tuning things to feel
**calm, low-strain, and distraction-free**.  
It’s not a framework, not a starter kit, and not meant to fit everyone.

If something here helps you, feel free to copy it.  
If not, that’s totally fine 🙂

---

## ✨ What this config is about

- One Dark–based colors, softened for long coding sessions
- Minimal UI with rounded popups and clean borders
- Non-intrusive notifications and messages
- Fast navigation and sane defaults
- Plugins split cleanly (one file per plugin)

This is a **daily-driver setup**, not a “look how many plugins I use” repo.

---

## 📸 Preview

UI changes over time as I tweak things.

![preview](https://github.com/user-attachments/assets/529dfdc0-e3fc-419b-9791-8a72a1e80f11)

---

## 🗂️ Structure

High-level layout:

```
lua/
├── config/        -- core options, keybindings, lazy bootstrap
└── plugins/       -- each plugin in its own file
```

I prefer keeping things explicit and easy to delete later.

---

## 📦 Plugins

This config includes things like:

- LSP + completion
- Telescope for fuzzy finding
- Treesitter for syntax highlighting
- Git integration
- Formatter & diagnostics
- UI polish (notifications, statusline, popups)
- Terminal integration

Nothing exotic — just well-tuned essentials.

---

## 🛠 Requirements

This config assumes a fairly standard dev setup.  
Most things are optional, but you’ll have a better experience with these installed.

### Required
- **Neovim** `0.9+`
- **git**
- **Node.js** (for LSPs, formatters, Copilot, etc.)
- **npm** (comes with Node)
- **ripgrep** (`rg`) – Telescope live grep
- **fd** – fast file finder used by Telescope

> On Debian/Ubuntu, `fd` is installed as `fdfind`.  
> You should symlink it to `fd`.

---

### 📦 Install (Debian / Ubuntu)

```bash
sudo apt update
sudo apt install -y \
  neovim \
  git \
  ripgrep \
  fd-find \
  nodejs \
  npm
```

Fix the `fd` binary name:

```bash
ln -s $(which fdfind) ~/.local/bin/fd
```

Make sure `~/.local/bin` is in your PATH:

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

---

### 📦 Install (Arch)

```bash
sudo pacman -S --needed \
  neovim \
  git \
  ripgrep \
  fd \
  nodejs \
  npm
```

---

### 📦 Install (macOS – Homebrew)

```bash
brew install \
  neovim \
  git \
  ripgrep \
  fd \
  node \
  npm
```

---

If something doesn’t work, it’s usually:
- missing `node`
- missing `ripgrep`
- or `fd` not being in PATH


---

## 🚀 Trying it out

If you want to test it:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/ruthlesscalm/calm-onedark.nvim ~/.config/nvim
nvim
```

Lazy.nvim will bootstrap and install plugins automatically.

---

## ⌨️ Keybindings

Keymaps are intentionally **not listed here**.

You can see them directly in Neovim:

```vim
:e lua/config/keybinds.lua
```

Feel free to steal whatever feels useful.

---

## ❗ Notes

This repo is **not finished and never will be**.  
It changes as my workflow changes.

If you’re:
- learning Neovim
- building your own config
- curious how others structure things

…this might be useful.

---

Happy hacking 🦇
