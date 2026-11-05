local mapper = function(mode, key, result)
	vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end
vim.g.mapleader = ' '

mapper("n","<Leader>w", ":w<CR>")
mapper("n","<Leader>r", ":set relativenumber<CR>")

-- configuracion telescope 
mapper("n","<Leader>ff", ":Telescope find_files<CR>")
mapper("n","<Leader>fg", ":Telescope live_grep<CR>")
mapper("n","<Leader>fb", ":Telescope buffes<CR>")
mapper("n","<Leader>fh", ":Telescope help_tags<CR>")

-- configuracion nvim-tree
mapper("n", "<F2>", ":NvimTreeToggle<CR>")


