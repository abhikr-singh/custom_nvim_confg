return {
	{
		"olimorris/codecompanion.nvim", -- The KING of AI programming
		cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
		dependencies = {},
		opts = {
			adapters = {
				http = {
					gemini = function()
						return require("codecompanion.adapters").extend("gemini", {
							env = {
								api_key = "GEMINI_API_KEY",
							},
						})
					end,
				},
				acp = {
					gemini_cli = function()
						return require("codecompanion.adapters").extend("gemini_cli", {
							defaults = {
								auth_method = "gemini-api-key", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
							},
							env = {
								api_key = "GEMINI_API_KEY",
							},
						})
					end,
				},
			},
			strategies = {
				chat = {
					adapter = {
						name = "gemini",
						model = "gemini-2.5-flash",
					},
					roles = {
						user = "abhi",
					},
					opts = {
						completion_provider = "blink",
					},
					keymaps = {
						send = {
							modes = {
								i = { "<C-CR>", "<C-s>" },
							},
						},
						completion = {
							modes = {
								i = "<C-x>",
							},
						},
					},
					slash_commands = {
						["buffer"] = {
							keymaps = {
								modes = {
									i = "<C-b>",
								},
							},
						},
						["fetch"] = {
							keymaps = {
								modes = {
									i = "<C-f>",
								},
							},
						},
						["file"] = { -- Add this new slash command
							keymaps = {
								modes = {
									i = "<C-p>", -- Suggested keymap for file search
								},
							},
						},
						["help"] = {
							opts = {
								max_lines = 1000,
							},
						},
						-- ["image"] = {
						-- 	keymaps = {
						-- 		modes = {
						-- 			i = "<C-i>",
						-- 		},
						-- 	},
						-- 	opts = {
						-- 		dirs = { "~/Documents/Screenshots" },
						-- 	},
						-- },
					},
				},
				inline = {
					adapter = {
						name = "gemini",
						model = "gemini-2.0-flash",
					},
				},
				chat_cli = {
					adapter = {
						name = "gemini_cli",
					},
				},
			},
			display = {
				action_palette = {
					provider = "default",
				},
				chat = {
					show_references = true,
					show_header_separator = true,
					show_tools_processing = true,
					show_token_count = true,
					-- show_settings = true,
					-- Change the default icons
					icons = {
						buffer_pin = " ",
						buffer_watch = "👀 ",
						tool_success = "󰸞",
					},
				},
				diff = {
					provider = "mini_diff",
				},
			},
			opts = {
				log_level = "DEBUG",
			},
		},
		keys = {
			{
				"<C-a>",
				"<cmd>CodeCompanionActions<CR>",
				desc = "Open the action palette",
				mode = { "n", "v" },
			},
			{
				"<Leader>a",
				"<cmd>CodeCompanionChat Toggle<CR>",
				desc = "Toggle a chat buffer",
				mode = { "n", "v" },
			},
			{
				"<LocalLeader>a",
				"<cmd>CodeCompanionChat Add<CR>",
				desc = "Add code to a chat buffer",
				mode = { "v" },
			},
		},
	},
}
