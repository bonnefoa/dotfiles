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
    "tsserver",
    "lua_ls",
    "pyright",
    "pylsp",
    "sqlls",
    "tflint",
    "yamlls"
  }
})

