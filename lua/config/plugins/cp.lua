return {
	{
		"xeluxee/competitest.nvim",
		dependencies = "muniftanjim/nui.nvim", -- Thư viện UI
		config = function()
			require("competitest").setup({
				local_config_file_name = ".competitest.json",
				floating_border = "rounded",
				save_current_file = true,
				save_all_files = false,
				testcases_directory = "$(PROBLEM)/tests",
				received_problems_path = "$(PROBLEM).$(FEXT)",

				compile_command = {
					cpp = { exec = "g++", args = { "-Wall", "-O2", "$(FNAME)", "-o", "$(FNOEXT)" } },
				},

				run_command = {
					cpp = { exec = "./$(FNOEXT)" },
					python = { exec = "python3", args = { "$(FNAME)" } }, -- Fedora dùng python3
				},
				picker_ui = {
					width = 0.2,
					height = 0.3,
					mappings = {
						focus_next = { "j", "<down>", "<Tab>" },
						focus_prev = { "k", "<up>", "<S-Tab>" },
						close = { "<esc>", "<C-c>", "q", "Q" },
						submit = "<cr>",
					},
				},
				editor_ui = {
					popup_width = 0.4,
					popup_height = 0.6,
					show_nu = true,
					show_rnu = false,
					normal_mode_mappings = {
						switch_window = { "<C-h>", "<C-l>", "<C-i>" },
						save_and_close = "<C-s>",
						cancel = { "q", "Q" },
					},
					insert_mode_mappings = {
						switch_window = { "<C-h>", "<C-l>", "<C-i>" },
						save_and_close = "<C-s>",
						cancel = "<C-q>",
					},
				},
				runner_ui = {
					show_nu = true,
					width = 0.4,
					height = 0.4,
					mappings = {
						run_again = "R",
						run_all_again = "<C-r>",
						kill = "K",
						kill_all = "<C-k>",
						view_input = { "i", "I" },
						view_output = { "a", "A" },
						view_stdout = { "o", "O" },
						view_stderr = { "e", "E" },
						toggle_diff = { "d", "D" },
						close = { "q", "Q" },
					},
					viewer = {
						width = 0.5,
						height = 0.5,
						show_nu = true,
						show_rnu = false,
						open_when_compilation_fails = true,
					},
				},
				companion_port = 27121,
				receive_print_message = true,

				output_compare_method = "squish",
				maximum_time = 1000,
				multiple_testing = -1,
				testcases_use_single_file = true,
				testcases_single_file_format = "$(FNOEXT).txt",
				received_files_extension = "cpp",
				received_problems_prompt_path = false,
				open_received_problems = true,
				start_receiving_persistently_on_setup = true,
				template_file = vim.fn.expand("~/.config/nvim/templates/cpp_template.cpp"),
				evaluate_template_modifiers = true,
				date_format = "%Y-%m-%d %H:%M:%S",
			})

			-- Keymaps tối ưu cho workflow CP
			local map = vim.keymap.set
			map("n", "<F9>", "<cmd>CompetiTest run <cr>", { desc = "CP: Run Test" })
			map("n", "<leader>ta", "<cmd>CompetiTest add_testcase<cr>", { desc = "CP: Add Testcase" })
			map("n", "<leader>te", "<cmd>CompetiTest edit_testcase<cr>", { desc = "CP: Edit Testcase" })
			map("n", "<leader>tr", "<cmd>CompetiTest receive problem<cr>", { desc = "CP: Receive from Browser" })
			map("n", "<leader>tR", "<cmd>CompetiTest receive contest<cr>", { desc = "CP: Receive from Browser" })
		end,
	},
}
