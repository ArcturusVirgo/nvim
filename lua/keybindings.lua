-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- 保存本地变量
local map = vim.api.nvim_set_keymap
local opt = {
    noremap = true,
    silent = true
}

local pluginKeys = {} -- 插件快捷键

------------------------------ 基本配置 ------------------------------
-- 方向相关
map("n", "i", "k", opt) -- i:上
map("n", "k", "j", opt) -- k:下
map("n", "j", "h", opt) -- j:左
map("n", "dj", "dh", opt) -- dj:删除左
map("n", "I", "10k", opt) -- I:10x上
map("n", "K", "10j", opt) -- K:10x下
map("n", "J", "10h", opt) -- J:10x左
map("n", "L", "10l", opt) -- L:10x右
map("v", "i", "k", opt) -- i:上
map("v", "k", "j", opt) -- k:下
map("v", "j", "h", opt) -- j:左
map("v", "I", "10k", opt) -- I:10x上
map("v", "K", "10j", opt) -- K:10x下
map("v", "J", "10h", opt) -- J:10x左
map("v", "L", "10l", opt) -- L:10x右
-- 写入相关
map("n", "h", "i", opt) -- h:插入写
-- 缩进控制
map("n", "<Tab>", "V>", opt)
map("n", "<S-Tab>", "V<", opt)
map('v', '<Tab>', '<gv', opt)
map('v', '<S-Tab>', '>gv', opt)
-- 保存退出
map("n", "<C-s>", ":w<CR>", opt)
map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)
-- 分屏相关
map("n", "s", "", opt)
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
map("n", "sc", "<C-w>c", opt)
map("n", "sco", "<C-w>o", opt)
-- 分屏比例控制
map("n", "si", ":resize +5<CR>", opt)
map("n", "sk", ":resize -5<CR>", opt)
map("n", "sl", ":vertical resize +10<CR>", opt)
map("n", "sj", ":vertical resize -10<CR>", opt)
map("n", "s=", "<C-w>=", opt)
-- 窗口跳转
map("n", "<A-j>", "<C-w>h", opt)
map("n", "<A-k>", "<C-w>j", opt)
map("n", "<A-i>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- Terminal相关
map("n", "<A-=>", ":sp | terminal D:\\PowerShell\\PowerShell-7.2.6-win-x64\\pwsh.exe -Nologo<CR>a", opt)
map("n", "<A-=>v", ":vsp | terminal D:\\PowerShell\\PowerShell-7.2.6-win-x64\\pwsh.exe -Nologo<CR>a", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
-- ctrl+D向下复制一行
map("n", "<C-d>", "Y<End>p", opt)
map("i", "<C-d>", "<Esc>Y<End>pi", opt)
map("v", "<C-d>", "Ykp", opt)

------------------------------ 插件配置配置 ------------------------------
------------------------------ nvim-tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt) -- alt + m 键打开关闭tree
-- 列表快捷键
pluginKeys.nvimTreeList = {{
    key = {"<CR>", "o", "<2-LeftMouse>"}, -- 打开文件或文件夹
    action = "edit"
}, {
    key = "v", -- 分屏打开文件
    action = "vsplit"
}, {
    key = "h", -- 显示隐藏文件
    action = "split"
}, {
    key = "+", -- 对应 filters 中的 custom (node_modules)
    action = "toggle_custom"
}, {
    key = ".", -- Hide (dotfiles)
    action = "toggle_dotfiles"
}, {
    key = "<F5>",
    action = "refresh"
}, {
    key = "a",
    action = "create"
}, {
    key = "d",
    action = "remove"
}, {
    key = "r",
    action = "rename"
}, {
    key = "x",
    action = "cut"
}, {
    key = "c",
    action = "copy"
}, {
    key = "p",
    action = "paste"
}, {
    key = "s",
    action = ""
}}

------------------------------ bufferline
-- 左右Tab切换
map("n", "<C-j>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<C-w>l", ":BufferLineCloseRight<CR>", opt)
map("n", "<C-w>j", ":BufferLineCloseLeft<CR>", opt)

------------------------------ Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt) -- 查找文件
map("n", "<C-f>", ":Telescope live_grep<CR>", opt) -- 全局搜索
-- Telescope 列表中快捷键
pluginKeys.telescopeList = {
    i = {
        -- 上下移动
        ["<S-k>"] = "move_selection_next",
        ["<S-i>"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",
        -- 历史记录
        -- ["<C-n>"] = "cycle_history_next",
        -- ["<C-p>"] = "cycle_history_prev",
        -- 关闭窗口
        ["<C-w>"] = "close",
        ["<Esc>"] = "close",
        -- 预览窗口上下滚动
        ["<Left>"] = "preview_scrolling_up",
        ["<Right>"] = "preview_scrolling_down",
        ["<S-j>"] = "preview_scrolling_up",
        ["<S-l>"] = "preview_scrolling_down"
    },
    n = {
        -- 上下移动
        ["k"] = "move_selection_next",
        ["i"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",
        -- 历史记录
        -- ["<C-n>"] = "cycle_history_next",
        -- ["<C-p>"] = "cycle_history_prev",
        -- 关闭窗口
        ["<C-w>"] = "close",
        ["<Esc>"] = "close",
        -- 预览窗口上下滚动
        ["<Left>"] = "preview_scrolling_up",
        ["<Right>"] = "preview_scrolling_down",
        ["j"] = "preview_scrolling_up",
        ["l"] = "preview_scrolling_down"
    }
}

------------------------------ nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    return {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"})
    }
end

------------------------------ null-ls 代码格式化
map("n", "<C-A-l>", ":lua vim.lsp.buf.formatting()<CR>", opt)
map("i", "<C-A-l>", ":lua vim.lsp.buf.formatting()<CR>", opt)

------------------------------ lsp相关
-- rename
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
-- code action
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
-- go xx
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
-- diagnostic
map("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
map("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
map("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)

return pluginKeys
