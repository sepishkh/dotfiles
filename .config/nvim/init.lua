-- Options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 20
vim.g.netrw_browse_split = 0

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 20
vim.opt.cursorline = true
vim.opt.wrap = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 2
vim.opt.softtabstop= 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.clipboard = "unnamedplus"
vim.opt.virtualedit = "block"

vim.opt.shortmess:append "I"
vim.opt.mouse = ""

vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("state") .. "/undodir"
vim.opt.undofile = true

vim.opt.path = ",,**,."
vim.opt.wildignore:append { "*.obj", "*.out", "*.o", "*.a", "*/.git/*", "*/build/*", "*/cmake-build*/*" }
vim.opt.suffixes:append { ".c", ".log" }
vim.opt.completeopt = "menu,menuone,noinsert,noselect"

vim.opt.termguicolors = true
vim.cmd.colorscheme("habamax")
vim.opt.showmode = false
require('vim._core.ui2').enable({})

if vim.fn.executable("rg") then
  vim.opt.grepprg = "rg --smart-case --hidden --vimgrep" 
  vim.opt.grepformat = "%f:%l:%c:%m"
end

vim.opt.exrc = true

vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Noevide
if vim.g.neovide then
  vim.opt.guifont = "JetBrainsMono NF:h11.1:w-0.1"
  vim.g.neovide_scale_factor = 1.0
  -- vim.g.neovide_scroll_animation_length = 0.2
  vim.g.neovide_remember_window_size = true
  -- vim.g.neovide_cursor_animation_length = 0.06
  vim.g.neovide_profiler = false
  vim.g.neovide_cursor_animate_in_insert_mode = true
end

vim.opt.makeprg = "cmake --build build"

-- Keybindings
vim.keymap.set("n", "<C-s>", vim.cmd.write)

vim.keymap.set("n", "<leader>e", vim.cmd.Lex)

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<M-h>", "<C-w>>", { desc = "Increase current window width" })
vim.keymap.set("n", "<M-l>", "<C-w><", { desc = "Decrease current window width" })
vim.keymap.set("n", "<M-j>", "<C-w>+", { desc = "Increase current window height" })
vim.keymap.set("n", "<M-k>", "<C-w>-", { desc = "Decrease current window height" })

-- vim.keymap.set("n", "<Tab>", ":bn<CR>", { desc = "Go to the next buffer" })
-- vim.keymap.set("n", "<S-Tab>", ":bp<CR>", { desc = "Go to the previous buffer" })

-- vim.keymap.set("i", "'", "''<left>")
-- vim.keymap.set("i", "\"", "\"\"<left>")
-- vim.keymap.set("i", "(", "()<left>")
-- vim.keymap.set("i", "[", "[]<left>")
-- vim.keymap.set("i", "{", "{}<left>")
-- vim.keymap.set("i", "/*", "/**/<left><left>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move current line up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move current line down" })

vim.keymap.set("n", "<leader><leader>", ":buffer ", { desc = "Search in open buffers" })
vim.keymap.set("n", "<leader>f", ":find ", { desc = "[F]ind Files" })
vim.keymap.set("n", "<leader>g", ":silent grep ", { desc = "[G]rep in Project recursively" })

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>p", '"+]p')

vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>")
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>")
vim.keymap.set("n", "<leader>J", "<cmd>lnext<CR>")
vim.keymap.set("n", "<leader>K", "<cmd>lprev<CR>")

vim.keymap.set("n", "<leader>vs", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>hs", ":split<CR>", { desc = "Split window horizontally" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
	end,
})

-- Plugins
vim.pack.add({
  "git@github.com:nvim-tree/nvim-web-devicons",
  "git@github.com:tpope/vim-commentary",
  {
		src = "git@github.com:nvim-treesitter/nvim-treesitter",
		version = "main",
		build = ":TSUpdate",
	},
  { src = "git@github.com:nvim-lualine/lualine.nvim" },
  { src = "git@github.com:windwp/nvim-autopairs" },
  { src = "git@github.com:neovim/nvim-lspconfig" },
  { src = "git@github.com:mason-org/mason.nvim" },
  { src = "git@github.com:mason-org/mason-lspconfig.nvim" },
})
