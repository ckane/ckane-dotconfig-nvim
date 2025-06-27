return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		"nvim-lua/plenary.nvim",
		{
			"ravitemer/mcphub.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			-- For mcp-hub install/updates to work, make sure an askpass is configured in /etc/sudo.conf
			build = "sudo npm install -g mcp-hub@latest",
			config = function()
				require("mcphub").setup({
					native_servers = {},
					extensions = {
						avante = {
							enabled = true,
							make_slash_commands = true,
							make_vars = true,
						},
					},
				})
			end,
		},
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
			chat = { adapter = "azure_openai" },
			cmd = { adapter = "azure_openai" },
			inline = { adapter = "azure_openai" },
		},
		extensions = {
			mcphub = {
				callback = "mcphub.extensions.codecompanion",
				opts = {
					make_vars = true,
					make_slash_commands = true,
					show_result_in_chat = true,
				},
			},
		},
	},
}
