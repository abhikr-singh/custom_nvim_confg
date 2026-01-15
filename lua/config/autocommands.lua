vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch", -- highlight group to use
			timeout = 200, -- time in ms before highlight fades
		})
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.opt.conceallevel = 2
		vim.opt.concealcursor = "nc"
	end,
})
