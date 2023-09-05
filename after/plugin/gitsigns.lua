local ok, _ = pcall('require', 'gitsigns')

if ok then
	require('gitsigns').setup()
end
