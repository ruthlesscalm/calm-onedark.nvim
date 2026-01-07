# 🧛 calm-onedark.nvim

> A calm, low-strain adaptation of the One dark theme for Neovim.
> Built for focus with soft accents, rounded UI, and instant startup time.

![Neovim Version](https://img.shields.io/badge/Neovim-0.9%2B-blueviolet.svg?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-success.svg?style=flat-square)

## Preview
<img width="1920" height="1080" alt="Screenshot_2026-01-07_21_04_45" src="https://github.com/user-attachments/assets/2e6c0a36-6e54-466a-b6af-4c62f1a82063" />


## ✨ Features
* **Theme:** One Dark Pro with custom **Peach (#e3a193)** accents.
* **Soft Mode:** Text contrast is tuned to "Milk White" to prevent eye strain during long sessions.
* **Pro UI:** Distinct suggestion menu with highlighted matches and rounded borders.
* **Workflow:** Integrated Git (Fugitive), Undo History (Undotree), and File Tree.
* **Notifications:** Clean, non-intrusive popups that match the theme.

## 🛠️ Prerequisites
Before installing, ensure you have the following installed on your system:
1.  **[Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)** (v0.9.0 or newer)
2.  **[Ripgrep](https://github.com/BurntSushi/ripgrep)** - *Required for Telescope live grep.*
3.  **GCC / Clang** - *Required for compiling Treesitter parsers.*

## 🚀 Installation

### 1. Backup your current config
```bash
mv ~/.config/nvim ~/.config/nvim.bak
```
### 2. Clone the repository
```bash
git clone https://github.com/ruthlesscalm/calm-onedark.nvim ~/.config/nvim
```
### 3. Start Neovim
Open nvim. The Lazy package manager will automatically bootstrap and install all plugins.
```bash
nvim
```
## ⌨️ Keybindings

To keep this documentation clean, I have not listed every shortcut here. You can view all custom keybindings directly in the configuration file:

Open Neovim and run:
```vim
:e lua/config/keybinds.lua
```
## 📦 Plugin List

This configuration relies on these awesome community plugins:

| Core | UI & Themes | LSP & Completion |
| :--- | :--- | :--- |
| [lazy.nvim](https://github.com/folke/lazy.nvim) | [onedarkpro.nvim](https://github.com/olimorris/onedarkpro.nvim) | [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | [LuaSnip](https://github.com/L3MON4D3/LuaSnip) |
| [harpoon](https://github.com/ThePrimeagen/harpoon) | [nvim-notify](https://github.com/rcarriga/nvim-notify) | [mason.nvim](https://github.com/williamboman/mason.nvim) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | [mini.icons](https://github.com/echasnovski/mini.icons) | [fidget.nvim](https://github.com/j-hui/fidget.nvim) |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | [nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors) | [nvim-autopairs](https://github.com/windwp/nvim-autopairs) |
| [undotree](https://github.com/mbbill/undotree) | | |

## 👤 Author

- Github - [Ruthless Calm](https://github.com/ruthlesscalm)

## 🤝 Contributing

Pull req are welcome. For major changes, open an issue first.

## 📄 License

This project is licensed under the [MIT License](./LICENSE).  
You're free to use, modify, distribute and credit is appreciated.
