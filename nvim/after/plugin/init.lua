vim.cmd([[colorscheme onedark]])
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
local g = vim.g
local api = vim.api
local fn = vim.fn
local new_cmd = api.nvim_create_user_command

require("nvim-lsp-installer").setup({
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = " ",
      server_pending = " ",
      server_uninstalled = " ﮊ",
    },
    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
    },
  },
  max_concurrent_installers = 10,
})

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = { "tsserver", "cssls", "gopls", "html", "sumneko_lua" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  })
end

require("nvim-autopairs").setup({
  fast_wrap = {},
  disable_filetype = { "TelescopePrompt", "vim" },
})

local luasnip = require("luasnip")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

luasnip.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
})

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.luasnippets_path or "" }

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    if require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
})

vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Could be '●', '▎', 'x'
  }
})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
})
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

require("gitsigns").setup({
  signs = {
    add = { hl = "DiffAdd", text = " +", numhl = "GitSignsAddNr" },
    change = { hl = "DiffChange", text = " ~", numhl = "GitSignsChangeNr" },
    delete = { hl = "DiffDelete", text = " -", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "DiffDelete", text = " ‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "DiffChangeDelete", text = " ~", numhl = "GitSignsChangeNr" },
  },
})

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "typescript",
    "css",
    "html",
    "javascript",
    "typescript",
    "go",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
})

require("which-key").setup({
  icons = {
    breadcrumb = "»",
    separator = "  ",
    group = "+ ",
  },
  popup_mappings = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  window = {
    border = "none",
  },
  layout = {
    spacing = 6,
  },
  operators = {
    gc = "Comments",
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", "v:" },
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
})

require("telescope").setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },
  -- extensions_list = { "themes", "terms" },
})

require('onedark').setup {
  style = 'darker',
  transparent = false,
  toggle_style_key = '<leader>ts',
  toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' },
  diagnostics = {
    darker = true, -- darker colors for diagnostic
    undercurl = true, -- use undercurl instead of underline for diagnostics
    background = false, -- use background color for virtual text
  },
  code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },
}
require('onedark').load()

require("neo-tree").setup({
  close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  sort_case_insensitive = false, -- used when sorting files and directories in the tree
  sort_function = nil, -- use a custom function for sorting files and directories in the tree
  -- sort_function = function (a,b)
  --       if a.type == b.type then
  --           return a.path > b.path
  --       else
  --           return a.type > b.type
  --       end
  --   end , -- this sorts files and directories descendantly
  default_component_configs = {
    container = {
      enable_character_fade = true
    },
    indent = {
      indent_size = 2,
      padding = 1, -- extra padding on left hand side
      -- indent guides
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
      -- expander config, needed for nesting files
      with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "ﰊ",
      -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
      -- then these will never be used.
      default = "*",
      highlight = "NeoTreeFileIcon"
    },
    modified = {
      symbol = "[+]",
      highlight = "NeoTreeModified",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
      highlight = "NeoTreeFileName",
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted   = "✖", -- this can only be used in the git_status source
        renamed   = "", -- this can only be used in the git_status source
        -- Status type
        untracked = "",
        ignored   = "",
        unstaged  = "",
        staged    = "",
        conflict  = "",
      }
    },
  },
  window = {
    position = "left",
    width = 40,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["<space>"] = {
        "toggle_node",
        nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
      },
      ["<2-LeftMouse>"] = "open",
      ["<cr>"] = "open",
      ["S"] = "open_split",
      ["v"] = "open_vsplit",
      -- ["S"] = "split_with_window_picker",
      -- ["s"] = "vsplit_with_window_picker",
      ["t"] = "open_tabnew",
      ["w"] = "open_with_window_picker",
      ["C"] = "close_node",
      ["z"] = "expand_all_nodes",
      ["a"] = {
        "add",
        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
        config = {
          show_path = "none" -- "none", "relative", "absolute"
        }
      },
      ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
      -- ["c"] = {
      --  "copy",
      --  config = {
      --    show_path = "none" -- "none", "relative", "absolute"
      --  }
      --}
      ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
      ["q"] = "close_window",
      ["R"] = "refresh",
      ["?"] = "show_help",
    }
  },
  nesting_rules = {},
  filesystem = {
    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false, -- only works on Windows for hidden files/directories
      hide_by_name = {
        --"node_modules"
      },
      hide_by_pattern = { -- uses glob style patterns
        --"*.meta"
      },
      never_show = { -- remains hidden even if visible is toggled to true
        --".DS_Store",
        --"thumbs.db"
      },
    },
    follow_current_file = false, -- This will find and focus the file in the active buffer every
    -- time the current file is changed while the tree is open.
    group_empty_dirs = false, -- when true, empty folders will be grouped together
    hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
    -- in whatever position is specified in window.position
    -- "open_current",  -- netrw disabled, opening a directory opens within the
    -- window like netrw would, regardless of window.position
    -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
    use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
    -- instead of relying on nvim autocmd events.
    window = {
      mappings = {
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["H"] = "toggle_hidden",
        ["/"] = "fuzzy_finder",
        ["D"] = "fuzzy_finder_directory",
        ["f"] = "filter_on_submit",
        ["<c-x>"] = "clear_filter",
        ["[g"] = "prev_git_modified",
        ["]g"] = "next_git_modified",
      }
    }
  },
  buffers = {
    follow_current_file = true, -- This will find and focus the file in the active buffer every
    -- time the current file is changed while the tree is open.
    group_empty_dirs = true, -- when true, empty folders will be grouped together
    show_unloaded = true,
    window = {
      mappings = {
        ["bd"] = "buffer_delete",
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
      }
    },
  },
  git_status = {
    window = {
      position = "float",
      mappings = {
        ["A"]  = "git_add_all",
        ["gu"] = "git_unstage_file",
        ["ga"] = "git_add_file",
        ["gr"] = "git_revert_file",
        ["gc"] = "git_commit",
        ["gp"] = "git_push",
        ["gg"] = "git_commit_and_push",
      }
    }
  }
})

require("hop").setup({
  keys = 'etovxqpdygfblzhckisuran'
})

require('spectre').setup()


vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  nested = true,
  callback = function()
    require('telescope.builtin').find_files()
  end,
})

require("bufferline").setup()
