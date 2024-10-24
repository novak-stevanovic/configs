return {
	"Yazeed1s/minimal.nvim",
	config = function()
		vim.cmd[[colorscheme minimal]]
        vim.cmd[[
            hi NonText guifg=bg
            hi LineNr guibg=bg
            hi CursorLineNr guifg=#E85A84 gui=none
            highlight Search guibg=#E9D26C guifg=#000000
            highlight CurSearch guibg=#E85A84 guifg=#000000
            highlight @lsp.type.modifier guifg=#E85A84
            highlight @lsp.type.namespace guifg=#7EB7E6 gui=italic
            highlight PreProc guifg=#7EB7E6 gui=bold 
            highlight Include guifg=#E85A84 
            highlight PreProc guifg=#E9D26C gui=bold
            highlight Number guifg=#E9D26C 
            highlight @lsp.type.macro guifg=#E9D26C
            highlight Boolean guifg=#E9D26C
            highlight @lsp.type.parameter guifg=#9c9c9c
            highlight @lsp.type.method guifg=#afd1ed
            highlight @lsp.type.function guifg=#afd1ed
            highlight javaConstant guifg=#E9D26C gui=bold
            highlight @lsp.type.enumMember guifg=#E9D26C
            highlight matchParen guifg=#E85A84
            highlight javaConceptKind guifg=#E85A84
            highlight javaExceptions guifg=#E85A84
            highlight cDefine guifg=#7EB7E6

        ]]
	end
}
-- return { 
--     "rose-pine/neovim", name = "rose-pine"
-- }

