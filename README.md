# TRCLoop's Nvim Config

<p align="center">
  <img src="https://github.com/TRC-Loop/neovim-config/blob/main/.github/static/rocket.svg" width=360>
</p>

<p align="center">
  <img src="https://img.shields.io/github/actions/workflow/status/TRC-Loop/neovim-config/nvim-health.yml?style=for-the-badge&logo=neovim&label=NVIM%20HEALTHCHECK">
  <img src="https://img.shields.io/github/repo-size/TRC-Loop/neovim-config?style=for-the-badge">
  <img src="https://img.shields.io/github/stars/TRC-Loop/neovim-config?style=for-the-badge&logo=github">
</p>

> [!NOTE]  
> This Config is not finished and is **WIP**

## 🚀 Get Started

### Prerequisites
- Neovim of course: [Install](https://github.com/neovim/neovim/blob/master/INSTALL.md)
- Luarocks (recommended): [Install](https://github.com/luarocks/luarocks/wiki/Download)
- Nerdfont (Meslo): [Download](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Meslo.zip), [All Fonts](https://www.nerdfonts.com/font-downloads)
- Supported Terminal: [MacOS iTerm2](https://iterm2.com), [Windows Terminal](https://github.com/microsoft/terminal)

### Install Command

> [!IMPORTANT]  
> Make sure your Neovim Config Directory is empty/non-existent. Delete it using
> ```bash
> rm -rf ~/.config/nvim
> ```




```bash
git clone https://github.com/TRC-Loop/neovim-config.git ~/.config/nvim
```
---

Runs on <a href="https://github.com/folke/lazy.nvim" target="_blank" rel="noopener noreferrer">💤Lazy</a>

## 💻 Keybinds

`<leader>` is ` ` (space)

## 📦 Plugins

### 🗂️ [Neotree](https://github.com/nvim-neo-tree/neo-tree.nvim)
Open with `<leader>e` or `:Neotree toggle`

### 🔭 [Telescope](https://github.com/nvim-telescope/telescope.nvim)
Open with `<leader>ff` or `<leader>fg` for Live-Grep

### 🏁 [Alpha](https://github.com/goolord/alpha-nvim)
Used for the nice Startup-Screen (`nvim`)

### ℹ️ [Lualine](https://github.com/nvim-lualine/lualine.nvim)
Used for the nice little Status bar at the bottom.

Change Datetime format in `lua/plugins/lualine.lua` in the `datetime` function.

### 👍 [Noice](https://github.com/folke/noice.nvim)
Used for the CMDLine. Delete to have the default CMDLine.

### 🚗 [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
Used for CMDLine Autocompletion. Use `<tab>`
