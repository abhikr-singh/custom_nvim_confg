return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
      "folke/todo-comments.nvim"
    },
		config = function()
      local telescope = require("telescope")
			telescope.setup({
				defaults = {
					path_display = { "smart" },
				},
			})

      telescope.load_extension("fzf")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files in CWD" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep in CWD" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find files in buffer" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
