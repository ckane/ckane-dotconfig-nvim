-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " " -- Map spacebar to leader
vim.g.maplocalleader = "\t" -- Map TAB to local-leader

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- Load blink-cmp-avante first
		{
			"saghen/blink.cmp",
			dependencies = {
				"Kaiser-Yang/blink-cmp-avante", -- Required for blink.cmp
			},
			opts = {
				sources = {
					default = { "avante", "lsp", "path", "snippets", "buffer" },
					providers = {
						avante = {
							module = "blink-cmp-avante",
							name = "Avante",
							opts = {},
						},
					},
				},
			},
		},
		-- Enable the LazyExtras plugins and load the enabled ones
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		-- import plugins from ~/.config/nvim/lua/plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "tokyonight", "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- Setup Tree-sitter
local ts_status, treesitter = pcall(require, "nvim-treesitter.configs")
if ts_status then
	treesitter.setup({
		ensure_installed = { "lua", "markdown", "markdown_inline", "yaml" },
		highlight = { enable = true },
	})
end

-- Setup Outline keymap (<leader>o)
vim.keymap.set("n", "<leader>o", "<cmd>Outline<cr>", { desc = "Toggle Outline" })

-- Setup NeoTree keymap (<leader>e)
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle NeoTree" })

if vim.g.neovide then
	-- If using neovide, change the font to something I like better
	vim.opt.guifont = "Lilex Nerd Font Medium:h9"
	-- Set the neovide transparency to something slightly transparent but still readable
	vim.g.neovide_opacity = 0.97
	-- Enable smooth scrolling
	vim.g.neovide_smooth_scroll = true
	-- Enable cursor animation
	vim.g.neovide_cursor_animation_length = 0.1
end
