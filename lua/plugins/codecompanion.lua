return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		"nvim-lua/plenary.nvim",
		-- Test with blink.cmp
		{
			"saghen/blink.cmp",
			lazy = false,
			version = "*",
			opts = {
				keymap = {
					preset = "enter",
					["<S-Tab>"] = { "select_prev", "fallback" },
					["<Tab>"] = { "select_next", "fallback" },
				},
				cmdline = { sources = { "cmdline" } },
				sources = {
					default = { "lsp", "path", "buffer", "codecompanion" },
				},
			},
		},
	},
	opts = {
		--Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
		adapters = {
			azure_openai = function()
				return require("codecompanion.adapters").extend("azure_openai", {
					env = {
						api_key = "<changeme>",
						endpoint = "<changeme>",
						deployment = "<changeme>",
						api_version = "2025-04-01-preview",
					},
					schema = {
						model = {
							default = "gpt-4o-mini",
						},
					},
				})
			end,
		},
		opts = {
			log_level = "DEBUG",
		},
		strategies = {
			--NOTE: Change the adapter as required
			chat = { adapter = "copilot" },
			cmd = { adapter = "copilot" },
			inline = { adapter = "copilot" },
			-- chat = { adapter = "azure_openai" },
			-- cmd = { adapter = "azure_openai" },
			-- inline = { adapter = "azure_openai" },
		},
		extensions = {
			mcphub = {
				callback = "mcphub.extensions.codecompanion",
				opts = {
					make_tools = true,
					show_server_tools_in_chat = true,
					make_vars = true,
					make_slash_commands = true,
					show_result_in_chat = true,
				},
			},
		},
	},
}
