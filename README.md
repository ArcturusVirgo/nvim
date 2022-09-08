# 介绍
本仓库用来存储我的neovim配置

# 结构
```
nvim
│  init.lua
│  README.md
│
├─lua
│  │  basic.lua
│  │  colorscheme.lua
│  │  compile.lua
│  │  fix-yank.lua
│  │  keybindings.lua
│  │  plugins.lua
│  │
│  ├─lsp
│  │      cmp.lua
│  │      formatter.lua
│  │      lsp-status.lua
│  │      lspconfig.lua
│  │      lspsaga.lua
│  │      mason-lspconfig.lua
│  │      mason.lua
│  │      null-ls.lua
│  │      setup.lua
│  │      ui.lua
│  │
│  └─plugin-config
│          alpha.lua
│          bufferline.lua
│          Comment.lua
│          galaxyline.lua
│          indent-blankline.lua
│          nvim-autopairs.lua
│          nvim-tree.lua
│          nvim-treesitter.lua
│          project.lua
│          setup.lua
│          surround.lua
│          telescope.lua
│
├─pack
└─plugin
        packer_compiled.lua
```
# 安装必要的软件
## scoop安装

Scoop 默认使用普通用户权限，其本体和安装的软件默认会放在 %USERPROFILE%\scoop(即 C:\Users\用户名\scoop)，使用管理员权限进行全局安装 (-g) 的软件在 C:\ProgramData\scoop。如果有自定安装路径的需求，那么要提前设置好环境变量，否则后续再改不是一件容易的事情。
设置用户安装路径
```powershell
$env:SCOOP='D:\Scoop'
[Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')
```
设置全局安装路径（需要管理员权限）
```powershell
$env:SCOOP_GLOBAL='D:\Scoop_Global'
[Environment]::SetEnvironmentVariable('SCOOP_GLOBAL', $env:SCOOP_GLOBAL, 'Machine')
```
设置允许 PowerShell 执行本地脚本
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
```powershell
# 使用国内源安装
iwr -useb https://gitee.com/glsnames/scoop-installer/raw/master/bin/install.ps1 | iex
scoop config SCOOP_REPO 'https://gitee.com/glsnames/Scoop-Core'
scoop update
# 使用默认源安装
iwr -useb get.scoop.sh | iex
```
## 其他软件安装
```powershell
scoop bucket add nerd-fonts
scoop install JetBrainsMono-NF-Mono
scoop install aria2
scoop install neovim
scoop install nodejs
scoop install python
scoop install git
scoop install fd
scoop install ripgrep
```
