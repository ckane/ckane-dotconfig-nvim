return {
	"toppair/peek.nvim",
	event = "VeryLazy",
	build = "deno task --quiet build:fast",
	config = function()
		require("peek").setup()
		vim.api.nvim_create_user_command("PeekOpen", require("peek").open, { desc = "Open Peek" })
		vim.api.nvim_create_user_command("PeekClose", require("peek").close, { desc = "Close Peek" })
	end,
}
