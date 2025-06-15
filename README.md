# TRCLoop's Nvim Config

<p align="center">
  <img src="https://github.com/TRC-Loop/neovim-config/blob/main/.github/static/rocket.svg" width=360>
</p>

<p align="center">
  <a href="https://dotfyle.com/TRC-Loop/neovim-config"><img src="https://dotfyle.com/TRC-Loop/neovim-config/badges/plugins?style=for-the-badge" /></a>
  <a href="https://dotfyle.com/TRC-Loop/neovim-config"><img src="https://dotfyle.com/TRC-Loop/neovim-config/badges/leaderkey?style=for-the-badge" /></a>
  <a href="https://dotfyle.com/TRC-Loop/neovim-config"><img src="https://dotfyle.com/TRC-Loop/neovim-config/badges/plugin-manager?style=for-the-badge" /></a>
</p>
<p align="center">
  https://dotfyle.com/TRC-Loop/neovim-config
</p>
<p align="center">
  <img src="https://img.shields.io/github/actions/workflow/status/TRC-Loop/neovim-config/nvim-health.yml?style=for-the-badge&logo=neovim&label=NVIM%20HEALTHCHECK">
  <img src="https://img.shields.io/github/repo-size/TRC-Loop/neovim-config?style=for-the-badge">
  <img src="https://img.shields.io/github/stars/TRC-Loop/neovim-config?style=for-the-badge&logo=github">
</p>

<p align="center">
  <strong>Screenshots</strong>
</p>
<p align="center">
  <img src="https://github.com/TRC-Loop/neovim-config/blob/main/.github/static/screenshot.webp">
  <img src="https://github.com/TRC-Loop/neovim-config/blob/main/.github/static/screenshot_code.webp">
</p>

> *Dog does not come with Neovim config!*



<!--
> [!NOTE]  
> This Config is not finished and is **WIP**
-->

## 🚀 Get Started

### Prerequisites
- Neovim of course: [Install](https://github.com/neovim/neovim/blob/master/INSTALL.md)
- Luarocks (recommended): [Install](https://github.com/luarocks/luarocks/wiki/Download)
- Nerdfont (Meslo): [Download](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Meslo.zip), [All Fonts](https://www.nerdfonts.com/font-downloads)
- Supported Terminal: [MacOS iTerm2](https://iterm2.com), [Windows Terminal](https://github.com/microsoft/terminal)
- C Compiler (like [gcc](https://gcc.gnu.org) or [clang](https://clang.llvm.org))

### Install Command

> [!IMPORTANT]  
> Make sure your Neovim Config Directory is empty/non-existent. Delete it using
> ```bash
> rm -rf ~/.config/nvim
> ```
> *or windows (Powershell) `Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim`, cmd: `rmdir /s /q %LOCALAPPDATA%\nvim
`*

**MacOS/Linux:**

```bash
git clone https://github.com/TRC-Loop/neovim-config.git ~/.config/nvim
```

**Windows CMD**
```batch
git clone https://github.com/TRC-Loop/neovim-config.git %LOCALAPPDATA%\nvim
```

**Windows Powershell**
```powershell
git clone https://github.com/TRC-Loop/neovim-config.git $env:LOCALAPPDATA\nvim
```


### Install LSPs

**Python:**

```bash
pip install pyright
```

**Lua:**

https://luals.github.io/#neovim-install

**Go:**

```bash
go install golang.org/x/tools/gopls@latest
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

### 💬 [Comment.nvim](https://github.com/numToStr/Comment.nvim)

Toggle comments with `gcc` or `gc` in Visual mode.

### 🪄 [nvim-autopairs](https://github.com/windwp/nvim-autopairs)

Auto closes brackets, quotes, etc.

### 🌳 [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

Better syntax highlighting and parsing.

### 🚪 [ToggleTerm](https://github.com/akinsho/toggleterm.nvim)

Open terminal with `<leader>t`. Close it by typing `exit` in the Terminal.

### 🎨 [catppuccin](https://github.com/catppuccin/nvim)

Custom theme settings in `catppuccin-custom.lua`.

### 🧠 [which-key.nvim](https://github.com/folke/which-key.nvim)

Shows keybindings popup when you type a `<leader>` command.

### 🧱 [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

Adds indentation guides.

### 🔧 [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

LSP support, config in `lsp.lua`.

### 🕵️‍♂️ [git-blame](https://github.com/f-person/git-blame.nvim)

Shows Git Info in Code.

### 👾[neocord](https://github.com/IogaMaster/neocord)

Adds Discord RPC so your friends know what you're up to. Config: `lua/config/neocord.lua`

### 🥖 [nvim-navic](https://github.com/SmiteshP/nvim-navic)

Shows Breadcrumbs in top of the window (eg. in which function you are)

## 💡 Ideas

Maybe make a Macro on your keyboard which automatically installs nvim, with this config!

## 📥 Contributing

If you've got an Idea which plugin could be added, open a pull request or an Issue, i appreciate all ideas!

---

<img src="https://raw.githubusercontent.com/TRC-Loop/neovim-config/refs/heads/main/.github/static/footer.svg">
