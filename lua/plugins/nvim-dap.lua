return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap-python",
		},
		keys = {
			{
				"<leader>td",
				function()
					require("neotest").run.run({ strategy = "dap" })
				end,
				desc = "Debug Nearest",
			},
			{
				"<leader>dB",
				function()
					require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "Breakpoint Condition",
			},
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Run/Continue",
			},
			{
				"<leader>da",
				function()
					require("dap").continue({ before = get_args })
				end,
				desc = "Run with Args",
			},
			{
				"<leader>dC",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "Run to Cursor",
			},
			{
				"<leader>dg",
				function()
					require("dap").goto_()
				end,
				desc = "Go to Line (No Execute)",
			},
			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
				desc = "Step Into",
			},
			{
				"<leader>dj",
				function()
					require("dap").down()
				end,
				desc = "Down",
			},
			{
				"<leader>dk",
				function()
					require("dap").up()
				end,
				desc = "Up",
			},
			{
				"<leader>dl",
				function()
					require("dap").run_last()
				end,
				desc = "Run Last",
			},
			{
				"<leader>do",
				function()
					require("dap").step_out()
				end,
				desc = "Step Out",
			},
			{
				"<leader>dO",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
			},
			{
				"<leader>dP",
				function()
					require("dap").pause()
				end,
				desc = "Pause",
			},
			{
				"<leader>dr",
				function()
					require("dap").repl.toggle()
				end,
				desc = "Toggle REPL",
			},
			{
				"<leader>ds",
				function()
					require("dap").session()
				end,
				desc = "Session",
			},
			{
				"<leader>dt",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
			{
				"<leader>dw",
				function()
					require("dap.ui.widgets").hover()
				end,
				desc = "Widgets",
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Setup dap-ui
			dapui.setup()

			-- Auto open/close dap-ui
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Detect Python venv (checks .venv first, then venv)
			local cwd = vim.fn.getcwd()
			local python_path = nil
			if vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
				python_path = cwd .. "/.venv/bin/python"
			elseif vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
				python_path = cwd .. "/venv/bin/python"
			else
				python_path = "python" -- fallback to system Python
			end

			require("dap-python").setup(python_path)

			-- Keymaps
			-- vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
			-- vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
			-- vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
			-- vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
			-- vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			-- vim.keymap.set("n", "<leader>B", function()
			-- 	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			-- end, { desc = "Debug: Conditional Breakpoint" })
			-- vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug: Open REPL" })
			-- vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Debug: Run Last" })
			--
			-- vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle DAP UI" })
			-- vim.keymap.set("n", "<leader>dd", function()
			-- 	dap.run({
			-- 		type = "python",
			-- 		request = "launch",
			-- 		name = "Launch file",
			-- 		program = vim.fn.expand("%:p"), -- current file
			-- 		console = "externalTerminal",
			-- 	})
			-- end, { desc = "Debug: Run Current File" })
		end,
	},
}
