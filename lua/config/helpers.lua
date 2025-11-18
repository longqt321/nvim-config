local fns = {}

function fns.run_current_file()
	local filetype = vim.bo.filetype
	local cmd = ""

	if filetype == "python" then
		cmd = "python " .. vim.fn.shellescape(vim.fn.expand("%"))
	elseif filetype == "go" then
		cmd = "go run " .. vim.fn.shellescape(vim.fn.expand("%"))
	else
		print("No run command defined for filetype: " .. filetype)
		return
	end
	vim.cmd("w")
	vim.cmd("vsplit | terminal " .. cmd)
end

return fns
