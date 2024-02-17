local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local navic = require("nvim-navic")
local navbuddy = require("nvim-navbuddy")

vim.g.rustaceanvim = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
    navbuddy.attach(client, bufnr)
  end,
}
