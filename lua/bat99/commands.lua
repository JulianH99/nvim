vim.api.nvim_create_user_command("W", function()
	vim.cmd([[noa w]])
end, {})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.html",
	callback = function()
		local manage_path = vim.fs.normalize(vim.loop.cwd() .. "/manage.py")
		print(manage_path)

		if vim.fn.filereadable(manage_path) == 1 then
			vim.cmd("set ft=htmldjango")
		end
	end,
})
