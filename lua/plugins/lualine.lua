local function project_name()
	local cwd = vim.uv.cwd()
	local i, j = string.find(cwd, "/[^/]*$")
	return string.sub(cwd, i + 1, j)
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = false,
			theme = "auto",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff" },
			lualine_c = {
				{
					"buffers",
					--use_mode_colors = true
					buffers_color = {
						active = function()
							local suffix = require("lualine.highlight").get_mode_suffix() or "_inactive"
							return "lualine_a" .. suffix
						end,
						inactive = "lualine_a_inactive",
					},
				},
			},
			lualine_x = {},
			lualine_y = { project_name },
			lualine_z = { "location" },
		},
		extensions = {
			"toggleterm",
		},
	},
}
