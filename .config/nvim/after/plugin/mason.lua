require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {"bashls", "clangd", "cmake", "html", "jsonls", "lua_ls", "phpactor"}
})
