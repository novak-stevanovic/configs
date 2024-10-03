return {
    "norcalli/nvim-colorizer.lua",
    config = function()
        vim.opt.termguicolors = true
        require("colorizer").setup({
            '*';
            css = {
                RGB      = true;         -- #RGB hex codes
                RRGGBB   = true;         -- #RRGGBB hex codes
                names    = true;         -- "Name" codes like Blue
                RRGGBBAA = true;        -- #RRGGBBAA hex codes
                rgb_fn   = true;        -- CSS rgb() and rgba() functions
                hsl_fn   = true;        -- CSS hsl() and hsla() functions
                css      = true;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn   = true;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- Available modes: foreground, background
                mode     = 'background'; -- Set the display mode.
            },
        })
        local key = vim.api.nvim_replace_termcodes(":Lazy reload nvim-colorizer.lua<CR>:ColorizerAttachToBuffer<CR>", true, false, true)
        Reload_Colorizer = function()
            vim.api.nvim_feedkeys(key, 'n', false)
        end
        vim.keymap.set("n", "<Leader>rc", Reload_Colorizer)
    end
}
