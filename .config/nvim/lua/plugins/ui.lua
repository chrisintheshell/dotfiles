-- Custom color palette (same as in colorscheme.lua)
local colors = {
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
  fg = "#CDD3DE",
  grey = "#65737E",
}

return {
  -- Configure lualine statusline
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- Custom oceanic theme with your color palette
      local oceanic_theme = {
        normal = {
          a = { fg = colors.darker_black, bg = colors.blue, gui = "bold" },
          b = { fg = colors.fg, bg = "NONE" },
          c = { fg = colors.fg, bg = "NONE" },
        },
        insert = {
          a = { fg = colors.darker_black, bg = colors.green, gui = "bold" },
          b = { fg = colors.fg, bg = "NONE" },
          c = { fg = colors.fg, bg = "NONE" },
        },
        visual = {
          a = { fg = colors.darker_black, bg = colors.purple, gui = "bold" },
          b = { fg = colors.fg, bg = "NONE" },
          c = { fg = colors.fg, bg = "NONE" },
        },
        replace = {
          a = { fg = colors.darker_black, bg = colors.red, gui = "bold" },
          b = { fg = colors.fg, bg = "NONE" },
          c = { fg = colors.fg, bg = "NONE" },
        },
        command = {
          a = { fg = colors.darker_black, bg = colors.yellow, gui = "bold" },
          b = { fg = colors.fg, bg = "NONE" },
          c = { fg = colors.fg, bg = "NONE" },
        },
        inactive = {
          a = { fg = colors.grey, bg = "NONE" },
          b = { fg = colors.grey, bg = "NONE" },
          c = { fg = colors.grey, bg = "NONE" },
        },
      }

      -- Apply theme and options
      opts.options = vim.tbl_extend("force", opts.options or {}, {
        theme = oceanic_theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      })

      -- Customize sections with rounded separators
      opts.sections = vim.tbl_extend("force", opts.sections or {}, {
        lualine_a = {
          {
            "mode",
            separator = { left = "", right = "" },
            right_padding = 2,
          },
        },
        lualine_b = {
          { "branch", icon = "" },
          { "diff", symbols = { added = " ", modified = " ", removed = " " } },
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = " ",
            },
          },
        },
        lualine_c = {
          {
            "filename",
            path = 1, -- Show relative path
            symbols = {
              modified = " ●",
              readonly = " ",
              unnamed = " [No Name]",
            },
          },
        },
        lualine_x = {
          {
            "lsp_progress",
            display_components = { "lsp_client_name", "spinner" },
            spinner_symbols = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype", icon_only = true },
        },
        lualine_y = { "progress" },
        lualine_z = {
          {
            "location",
            separator = { left = "", right = "" },
            left_padding = 2,
          },
        },
      })

      -- Inactive sections
      opts.inactive_sections = vim.tbl_extend("force", opts.inactive_sections or {}, {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      })

      return opts
    end,
  },

  -- Additional UI configurations can be added here
  -- For example, if you want to configure other UI elements like bufferline, neo-tree, etc.
}
