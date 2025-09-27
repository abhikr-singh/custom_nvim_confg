return {
	"rebelot/kanagawa.nvim",
	opts = {},
	config = function()
		require("kanagawa").setup({
			transparent = true,
		})
		-- vim.cmd("colorscheme kanagawa");
	end,
}
