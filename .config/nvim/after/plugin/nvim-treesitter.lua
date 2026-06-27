require('nvim-treesitter').setup({})

require('nvim-treesitter').install({ 
  "bash", 
  "c", 
  "cmake", 
  "cpp", 
  "dockerfile",
  "html",
  "json",
  "lua",
  "make",
  "markdown",
  "php",
  "python"
})

local config = require("nvim-treesitter.config")
local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  callback = function(args)
    if vim.list_contains(config.get_installed(), vim.treesitter.language.get_lang(args.match)) then
      vim.treesitter.start(args.buf)
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
