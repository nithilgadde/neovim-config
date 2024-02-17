local config = require("plugins.configs.lspconfig")
local navic = require("nvim-navic")
local navbuddy = require("nvim-navbuddy")
local on_attach = config.on_attach
local capabilities = config.capabilities
local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
    navbuddy.attach(client, bufnr)
  end
})

lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"lua"},
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
    navbuddy.attach(client, bufnr)
  end
})

lspconfig.clangd.setup({
  on_attach = on_attach,
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
    navbuddy.attach(client, bufnr)
  end,
  capabilities = capabilities,
  filetypes = {"c", "cpp"},
})

lspconfig.jdtls.setup({
  on_attach = on_attach,
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
    navbuddy.attach(client, bufnr)
  end,
  capabilities = capabilities,
  filetypes = {"java"},
})


