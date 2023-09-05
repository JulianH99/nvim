local ok, startup = pcall(require, 'startup')


if ok then
	startup.setup {
		theme = "dashboard",
		options = {
			mapping_keys = false
		}
	}
end
