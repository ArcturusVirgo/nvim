local packer = require("packer")

packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'

    ----------------------- 主题
    -- tokyonight
    use("folke/tokyonight.nvim")
    -- onedark
    use("ful1e5/onedark.nvim")
    use("Mofiqul/vscode.nvim")
    use("shaunsingh/nord.nvim")


    ----------------------- 插件
    -- nvim-tree （文件树）
    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons"
    })
    -- bufferline（标签页）
    use({
      "akinsho/bufferline.nvim",
      requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }
    })
    -- lualine（状态栏）
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" }
    })
    use("arkav/lualine-lsp-progress")
    -- telescope （模糊搜索）
    use {
      'nvim-telescope/telescope.nvim',
      requires = { "nvim-lua/plenary.nvim" }
    }
    -- telescope extensions （模糊搜索扩展）
    use "LinArcX/telescope-env.nvim"
    -- alpha-nvim (启动页)
    use { 'goolord/alpha-nvim' }
    use "itsuki0927/base46"
    -- project （项目）
    use("ahmedkhalf/project.nvim")
    -- treesitter （代码高亮）
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    })
    ----------------------- LSP
    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client
    }
    use 'WhoIsSethDaniel/mason-tool-installer.nvim' -- lsp自动升级安装
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'nvim-lua/lsp-status.nvim' --从内置 LSP 客户端生成状态栏组件

    -- 代码格式化
    use("mhartington/formatter.nvim")
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

    -- ui
    use { 'kkharji/lspsaga.nvim' }
    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")
    -- 注释
    use 'numToStr/Comment.nvim'
    -- 匹配括号
    use "windwp/nvim-autopairs"
    -- 引号切换
    use 'kylechui/nvim-surround'


  end,
  config = {
    -- 并发数限制
    max_jobs = 16,
    -- 自定义源
    git = {
      --   default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      --   default_url_format = "https://gitclone.com/github.com/%s",
    },
    display = {
      open_fn = function()
        return require("packer.util").float({
          border = "single"
        })
      end
    }
  }
})

-- 每次保存 plugins.lua 自动安装插件
pcall(vim.cmd, [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]])
