require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "clangd",
    "docker_compose_language_service",
    "dockerls",
    "gopls",
    "html",
    "jsonls",
    "ts_ls",
    "lua_ls",
    "pyright",
    "pylsp",
    "sqlls",
    "tflint",
    "yamlls"
  }
})

