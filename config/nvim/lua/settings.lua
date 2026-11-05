local o = vim.o
local wo = vim.wo

wo.number = true 
o.clipboard = "unnamedplus"

o.mouse = a 
o.mousefocus = true
o.selectmode = true
o.mousemodel = true

o.hidden = true
o.guifont = "Hack NF"
o.lazyredraw = true
-- o.relativenumber = true
-- Lua
-- Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]
