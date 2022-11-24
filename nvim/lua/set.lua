local vim = vim
local opt = vim.opt
local g = vim.g

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.title = true
opt.fillchars = { eob = " " }
opt.clipboard = "unnamedplus"
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.number = true
opt.numberwidth = 3
opt.laststatus = 3 -- global statusline
opt.showmode = false
opt.ruler = false
-- opt.shortmess:append("sI")
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 200
opt.undofile = true
opt.updatetime = 250
opt.relativenumber = true
opt.wrap = false
opt.cursorline = true
opt.swapfile = false
opt.list = true
opt.listchars:append("eol:↴")
opt.winbar = "%f %=%m | %l,%c | %p%%"
vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.api.nvim_set_hl(0, "WinBarSeparator", { fg = "#444444" })


local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(default_plugins) do
  g["loaded_" .. plugin] = 1
end


g.mapleader = " "
g.kommentary_create_default_mappings = false
g.loaded_python_provider = 0
g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
g.tokyonight_italic_functions = true
