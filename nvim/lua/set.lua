local opt = vim.opt
local g = vim.g
local api = vim.api
local fn = vim.fn
local new_cmd = api.nvim_create_user_command

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
opt.numberwidth = 2
opt.laststatus = 3 -- global statusline
opt.showmode = false
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
opt.wrap = false
opt.cursorline = true

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

local Mode = {
  ['n']     = 'NORMAL',
  ['no']    = 'O-PENDING',
  ['nov']   = 'O-PENDING',
  ['noV']   = 'O-PENDING',
  ['no\22'] = 'O-PENDING',
  ['niI']   = 'NORMAL',
  ['niR']   = 'NORMAL',
  ['niV']   = 'NORMAL',
  ['nt']    = 'NORMAL',
  ['v']     = 'VISUAL',
  ['vs']    = 'VISUAL',
  ['V']     = 'V-LINE',
  ['Vs']    = 'V-LINE',
  ['\22']   = 'V-BLOCK',
  ['\22s']  = 'V-BLOCK',
  ['s']     = 'SELECT',
  ['S']     = 'S-LINE',
  ['\19']   = 'S-BLOCK',
  ['i']     = 'INSERT',
  ['ic']    = 'INSERT',
  ['ix']    = 'INSERT',
  ['R']     = 'REPLACE',
  ['Rc']    = 'REPLACE',
  ['Rx']    = 'REPLACE',
  ['Rv']    = 'V-REPLACE',
  ['Rvc']   = 'V-REPLACE',
  ['Rvx']   = 'V-REPLACE',
  ['c']     = 'COMMAND',
  ['cv']    = 'EX',
  ['ce']    = 'EX',
  ['r']     = 'REPLACE',
  ['rm']    = 'MORE',
  ['r?']    = 'CONFIRM',
  ['!']     = 'SHELL',
  ['t']     = 'TERMINAL',
}

function lsp_info()
  if rawget(vim, "lsp") then
    for _, client in ipairs(vim.lsp.get_active_clients()) do
      if client.attached_buffers[api.nvim_get_current_buf()] then
        return (vim.o.columns > 100 and "%#St_LspStatus#" .. "   LSP ~ " .. client.name .. " ") or "   LSP "
      end
      return ""
    end
  end
  return ""
end

function lsp_diagnostic()
  if not rawget(vim, "lsp") then
    return ""
  end

  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  errors = (errors and errors > 0) and (" " .. errors .. " ") or ""
  warnings = (warnings and warnings > 0) and (" " .. warnings .. " ") or ""
  hints = (hints and hints > 0) and ("ﯧ " .. hints .. " ") or ""
  info = (info and info > 0) and (" " .. info .. " ") or ""

  return errors .. warnings .. hints .. info
end

function lsp_progress()
  if not rawget(vim, "lsp") then
    return ""
  end

  local Lsp = vim.lsp.util.get_progress_messages()[1]

  if vim.o.columns < 120 or not Lsp then
    return ""
  end

  local msg = Lsp.message or ""
  local percentage = Lsp.percentage or 0
  local title = Lsp.title or ""
  local spinners = { "", "" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  local content = string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
  return (content) or ""
end

function get_mode()
  local mode_code = api.nvim_get_mode().mode
  if Mode[mode_code] == nil then
    return mode_code
  end
  return Mode[mode_code]
end

function get_git()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
    return ""
  end

  local git_status = vim.b.gitsigns_status_dict
  local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
  local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
  local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
  local branch_name = git_status.head
  return branch_name .. added .. changed .. removed
end

function statusline()
  local s = ""
  s = s .. " " .. get_mode() .. " | %f | "
  s = s .. get_git()
  s = s .. "%="
  s = s .. lsp_progress()
  s = s .. lsp_info()
  s = s .. lsp_diagnostic()
  s = s .. "| %l,%c "
  s = s .. "| %p%% "
  return s
end

opt.statusline = "%!luaeval('statusline()')"

-- vim.g.TbTabsToggled = 0

--[[ function tabline()
  local s = ''
  for index, buffer in ipairs(vim.split(vim.fn.execute ":buffers", "\n")) do
    local bufname = fn.bufname(buffer)
    local bufmodified = fn.getbufvar(buffer, '&mod')
    if bufmodified == 1 then
      s = s .. '*' .. ' '
    end
    if bufname ~= '' then
      s = s .. '[' .. index .. '] ' .. fn.fnamemodify(bufname, ':t') .. ' '
    end
  end
  return s
end

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "TabEnter" }, {
  pattern = "*",
  callback = function()
    opt.showtabline = 2
    opt.tabline = "%!luaeval('tabline()')"
  end
}) ]]
