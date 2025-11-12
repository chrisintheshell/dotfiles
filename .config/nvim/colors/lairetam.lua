vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "lairetam"

-- Custom color palette
local colors = {
  fg = "#CDD3DE",
  black = "#263238",
  darker_black = "#1B2B34",
  red = "#E57373",
  baby_pink = "#F06292",
  pink = "#F06292",
  green = "#81C784",
  vibrant_green = "#B9F6CA",
  nord_blue = "#1E88E5",
  blue = "#64B5F6",
  yellow = "#FFF176",
  sun = "#FFD54F",
  purple = "#BA68C8",
  dark_purple = "#9575CD",
  teal = "#4DB6AC",
  orange = "#FFB74D",
  cyan = "#4DD0E1",
  grey = "#65737E",
  light_grey = "#A0A8B7",
  dark_grey = "#4B5263",
}

-- Apply basic highlights
vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "Comment", { fg = colors.comment, italic = true })
vim.api.nvim_set_hl(0, "Keyword", { fg = colors.keyword, bold = true })
-- continue with more highlight groups

-- Function to apply custom highlights (transparency)
local function apply_custom_highlights()
  -- Transparency settings
  local transparent_groups = {
    "Normal",
    "NormalFloat",
    "NormalNC",
    "SignColumn",
    "Folded",
    "FoldColumn",
    "LineNr",
    "CursorLineNr",
    "CursorLine",
    "EndOfBuffer",
    "TelescopeNormal",
    "TelescopeBorder",
    "NvimTreeNormal",
    "NvimTreeNormalNC",
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "StatusLine",
    "StatusLineNC",
  }

  for _, group in ipairs(transparent_groups) do
    vim.api.nvim_set_hl(0, group, { bg = "#263238", ctermbg = "NONE" })
  end

  -- Lualine transparency
  local lualine_groups = {
    "lualine_c_normal",
    "lualine_b_normal",
    "lualine_b_insert",
    "lualine_b_visual",
    "lualine_b_replace",
    "lualine_b_command",
    "lualine_c_insert",
    "lualine_c_visual",
    "lualine_c_replace",
    "lualine_c_command",
  }

  for _, group in ipairs(lualine_groups) do
    vim.api.nvim_set_hl(0, group, { bg = "#263238", ctermbg = "NONE" })
  end
end

-- Apply the transparency settings
apply_custom_highlights()

-- Custom color overrides
--vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg })
-- Comments
vim.api.nvim_set_hl(0, "Comment", { italic = true, fg = colors.grey })
vim.api.nvim_set_hl(0, "@comment", { italic = true, fg = colors.grey })
vim.api.nvim_set_hl(0, "@comment.line", { italic = true, fg = colors.grey })
vim.api.nvim_set_hl(0, "@comment.block", { italic = true, fg = colors.grey })

-- Line numbers
vim.api.nvim_set_hl(0, "LineNr", { fg = colors.grey, bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.fg, bg = "NONE" })

-- Syntax highlighting with custom colors
vim.api.nvim_set_hl(0, "String", { fg = colors.green })
vim.api.nvim_set_hl(0, "Character", { fg = colors.green })
vim.api.nvim_set_hl(0, "Number", { fg = colors.orange })
vim.api.nvim_set_hl(0, "Boolean", { fg = colors.orange })
vim.api.nvim_set_hl(0, "Float", { fg = colors.orange })
vim.api.nvim_set_hl(0, "Function", { fg = colors.blue })
vim.api.nvim_set_hl(0, "Identifier", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "Statement", { fg = colors.purple })
vim.api.nvim_set_hl(0, "Conditional", { fg = colors.purple })
vim.api.nvim_set_hl(0, "Repeat", { fg = colors.purple })
vim.api.nvim_set_hl(0, "Label", { fg = colors.purple })
vim.api.nvim_set_hl(0, "Operator", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "Keyword", { fg = colors.purple })
vim.api.nvim_set_hl(0, "Exception", { fg = colors.purple })
vim.api.nvim_set_hl(0, "PreProc", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "Include", { fg = colors.purple })
vim.api.nvim_set_hl(0, "Define", { fg = colors.purple })
vim.api.nvim_set_hl(0, "Macro", { fg = colors.purple })
vim.api.nvim_set_hl(0, "PreCondit", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "Type", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "StorageClass", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "Structure", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "Typedef", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "Special", { fg = colors.teal })
vim.api.nvim_set_hl(0, "SpecialChar", { fg = colors.pink })
vim.api.nvim_set_hl(0, "Tag", { fg = colors.red })
vim.api.nvim_set_hl(0, "Delimiter", { fg = colors.fg })
vim.api.nvim_set_hl(0, "SpecialComment", { fg = colors.grey })
vim.api.nvim_set_hl(0, "Debug", { fg = colors.red })
vim.api.nvim_set_hl(0, "Underlined", { underline = true })
vim.api.nvim_set_hl(0, "Error", { fg = colors.red })
vim.api.nvim_set_hl(0, "Todo", { fg = colors.yellow, bold = true })
vim.api.nvim_set_hl(0, "Constant", { fg = colors.orange })

-- Treesitter highlights
vim.api.nvim_set_hl(0, "@string", { fg = colors.green })
vim.api.nvim_set_hl(0, "@number", { fg = colors.orange })
vim.api.nvim_set_hl(0, "@boolean", { fg = colors.orange })
vim.api.nvim_set_hl(0, "@float", { fg = colors.orange })
vim.api.nvim_set_hl(0, "@function", { fg = colors.blue })
vim.api.nvim_set_hl(0, "@function.builtin", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "@function.macro", { fg = colors.red })
vim.api.nvim_set_hl(0, "@parameter", { fg = colors.orange })
vim.api.nvim_set_hl(0, "@method", { fg = colors.blue })
vim.api.nvim_set_hl(0, "@field", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "@property", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "@constructor", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@conditional", { fg = colors.purple })
vim.api.nvim_set_hl(0, "@repeat", { fg = colors.purple })
vim.api.nvim_set_hl(0, "@label", { fg = colors.purple })
vim.api.nvim_set_hl(0, "@operator", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "@keyword", { fg = colors.purple })
vim.api.nvim_set_hl(0, "@exception", { fg = colors.purple })
vim.api.nvim_set_hl(0, "@variable", { fg = colors.fg })
vim.api.nvim_set_hl(0, "@type", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@type.builtin", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "@constant", { fg = colors.orange })
vim.api.nvim_set_hl(0, "@constant.builtin", { fg = colors.orange })
vim.api.nvim_set_hl(0, "@constant.macro", { fg = colors.red })
vim.api.nvim_set_hl(0, "@string.regex", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "@string.escape", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "@tag", { fg = colors.red })
vim.api.nvim_set_hl(0, "@tag.attribute", { fg = colors.orange })
vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = colors.grey })

-- UI elements
vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.fg, bg = colors.darker_black })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.darker_black, bg = colors.blue })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = colors.black })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.grey })
vim.api.nvim_set_hl(0, "Visual", { bg = colors.dark_grey })
vim.api.nvim_set_hl(0, "VisualNOS", { bg = colors.dark_grey })
vim.api.nvim_set_hl(0, "Search", { fg = colors.darker_black, bg = colors.yellow })
vim.api.nvim_set_hl(0, "IncSearch", { fg = colors.darker_black, bg = colors.sun })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = colors.black })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = colors.black })
vim.api.nvim_set_hl(0, "VertSplit", { fg = colors.black, bg = "NONE" })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.black, bg = "NONE" })
vim.api.nvim_set_hl(0, "TabLine", { fg = colors.grey, bg = colors.darker_black })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = colors.darker_black })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = colors.fg, bg = colors.black })

-- Diagnostics
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.red })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.blue })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellow })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.blue })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.cyan })

-- Git signs
vim.api.nvim_set_hl(0, "DiffAdd", { fg = colors.green })
vim.api.nvim_set_hl(0, "DiffChange", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "DiffDelete", { fg = colors.red })
vim.api.nvim_set_hl(0, "DiffText", { fg = colors.blue })
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.green })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.red })
