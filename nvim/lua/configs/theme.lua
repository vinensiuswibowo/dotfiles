
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
