return {
	"MeanderingProgrammer/render-markdown.nvim",
	enabled = true,
	ft = { "markdown", "codecompanion" },
	opts = {
		bullet = {
			-- Turn on / off list bullet rendering
			enabled = true,
		},
		checkbox = {
			-- Turn on / off checkbox state rendering
			enabled = true,
			-- Determines how icons fill the available space:
			--  inline:  underlying text is concealed resulting in a left aligned icon
			--  overlay: result is left padded with spaces to hide any additional text
			position = "inline",
			unchecked = {
				-- Replaces '[ ]' of 'task_list_marker_unchecked'
				icon = "   󰄱 ",
				-- Highlight for the unchecked icon
				highlight = "RenderMarkdownUnchecked",
				-- Highlight for item associated with unchecked checkbox
				scope_highlight = nil,
			},
			checked = {
				-- Replaces '[x]' of 'task_list_marker_checked'
				icon = "   󰱒 ",
				-- Highlight for the checked icon
				highlight = "RenderMarkdownChecked",
				-- Highlight for item associated with checked checkbox
				scope_highlight = nil,
			},
		},
		heading = {
			sign = false,
			icons = { "󰇊 ", "󰇋 ", "󰇌 ", "󰇍 ", "󰇎 ", "󰇏 " },
		},
		latex = {
			-- install sudo pacman -S python-pylatexenc
			enabled = true,

			-- Render $...$ and $$...$$
			render_inline = true,
			render_block = true,

			-- Fancy unicode replacements
			symbols = {
				enabled = true,
			},

			position = "above",
			top_pad = 1,

			-- Highlight for LaTeX
			highlight = "RenderMarkdownMath",
		},
	},
	config = function()
		-- make bold text colored
		vim.api.nvim_set_hl(0, "@markup.strong", {
			fg = "#ff9e64",
			bold = true,
			italic = false,
			underline = false,
		})

		-- re-apply after colorscheme changes
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				vim.api.nvim_set_hl(0, "@markup.strong", {
					fg = "#ff9e64",
					bold = true,
				})
			end,
		})

		-- math color
		vim.api.nvim_set_hl(0, "RenderMarkdownMath", {
			fg = "#7dcfff", -- cyan math
			italic = true,
		})
	end,
}
