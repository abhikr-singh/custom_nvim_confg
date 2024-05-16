return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
  enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
		vim.keymap.set("n", "<leader>ee", ":Neotree focus<CR>")
	end,
}
