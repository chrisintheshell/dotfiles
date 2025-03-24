-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "oceanic-next",
  changed_themes = {
    ["oceanic-next"] = {
      base_16 = { base00 = "#263238" },
      base_30 = {
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
      },
    },
  },
  transparency = true,

	hl_override = {
		Comment = { italic = true },
	  ["@comment"] = { italic = true },
	},
}

M.ui = {
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
}

return M
