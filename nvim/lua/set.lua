local opt = vim.opt
local g = vim.g

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.title = true
opt.clipboard = "unnamedplus"
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.number = true
opt.numberwidth = 2
opt.ruler = false
opt.shortmess:append("sI")
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 200
opt.undofile = true
opt.updatetime = 250
opt.relativenumber = true

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

local default_providers = {
	"node",
	"perl",
	"python3",
	"ruby",
}

g.tokyonight_style = "night"
g.tokyonight_transparent = true
g.mapleader = " "
