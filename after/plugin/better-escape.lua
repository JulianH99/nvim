local ok, better_scape =  pcall(require, 'better_scape')


if ok then
	better_scape.setup({
		mapping = { "jj" }
	})
end
