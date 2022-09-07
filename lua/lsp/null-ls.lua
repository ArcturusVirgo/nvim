local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("没有找到 null-ls")
  return
end

null_ls.setup({
  debug = false,
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
  sources = { -- formatting
    null_ls.builtins.formatting.shfmt, -- StyLua
    null_ls.builtins.formatting.stylua, -- frontend
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.autopep8, -- python代码格式化
    -- "javascript", "javascriptreact", "json", "jsonc", "markdown", "typescript", "typescriptreact"
    null_ls.builtins.formatting.fixjson, -- json
    null_ls.builtins.formatting.lua_format, -- lua
    -- diagnostics
    null_ls.builtins.diagnostics.flake8 -- formatting.fixjson,
  }
  -- 保存自动格式化
  -- on_attach = function(client)
  --     if client.resolved_capabilities.document_formatting then
  --         vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  --     end
  -- end
})
