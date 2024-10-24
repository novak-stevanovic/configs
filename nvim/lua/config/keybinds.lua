Opts = { noremap = true, silent = true }
Map = vim.api.nvim_set_keymap

Map("i", "jk", "<Esc>", Opts)
Map("n", "a", "<Esc>", Opts)

Map("i", "<C-c>", "<Esc>", Opts)
Map("n", "<C-c>", "<Esc>", Opts)
Map("v", "<C-c>", "<Esc>", Opts)

Map("n", "d_", "d^", Opts)
Map("n", "y_", "y^", Opts)
Map("n", "c_", "c^", Opts)

--MOVE
Map("v", "K", ":m '<-2<CR>gv=gv", Opts)
Map("v", "J", ":m '>+1<CR>gv=gv", Opts)

--JOIN
Map("n", "J", "mzJ`z", Opts)
Map("n", "gJ", "mzgJ`z", Opts)

--SEARCH
Map("n", "n", "nzzzv", Opts)
Map("n", "N", "Nzzzv", Opts)
Map("n", "*", "*N", Opts)
Map("v", "*", "*N", Opts)
Map("n", "<Leader>h", ":nohl<CR>", Opts)

--WINDOWS
Map("n", "<S-UP>", ":split<CR><C-w><C-k>", Opts)
Map("n", "<S-DOWN>", ":split<CR><C-W><DOWN>", Opts)
Map("n", "<S-LEFT>", ":vsplit<CR><C-w><C-h>", Opts)
Map("n", "<S-RIGHT>", ":vsplit<CR><C-W><RIGHT>", Opts)
Map("n", "<C-q>", ":q<CR>", Opts)

--TABS
Map("n", "<Leader>nt", ":tabnew<CR>", Opts)
Map("n", "<C-LEFT>", "gT", Opts)
Map("n", "<C-RIGHT>", "gt", Opts)
Map("n", "<C-UP>", ":tabmove +1<CR>", Opts)
Map("n", "<C-DOWN>", ":tabmove -1<CR>", Opts)

--AUTOCOMPLETE
Map("i", "<C-f>", "<C-x><C-f", Opts)


--TERMINAL
Map("t", "<C-t>", "<C-\\><C-n>", Opts)
Map("n", "<C-t>", ":term<CR>", Opts)

--LSP
-- vim.api.nvim_create_autocmd('LspAttach', {
--     group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--     callback = function(ev)
--         -- Enable completion triggered by <c-x><c-o>
--         vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--         -- Buffer local mappings.
--         -- See `:help vim.lsp.*` for documentation on any of the below functions
--         local lsp_opts = { buffer = ev.buf }
--
--         vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, lsp_opts)
--         vim.keymap.set('n', 'gd', vim.lsp.buf.definition, lsp_opts)
--         vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, lsp_opts)
--         vim.keymap.set('n', 'K', vim.lsp.buf.hover, lsp_opts)
--         vim.keymap.set('i', '<A-k>', vim.lsp.buf.hover, lsp_opts)
--         --vim.keymap.set('n', '<C-K>', vim.lsp.buf.signature_help, lsp_opts)
--         vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, lsp_opts)
--         vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, lsp_opts)
--         vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, lsp_opts)
--         --vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, lsp_opts)
--         vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, lsp_opts)
--         vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, lsp_opts)
--         vim.keymap.set('n', 'gR', vim.lsp.buf.references, lsp_opts)
--         vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, lsp_opts)
--         if vim.bo.filetype=="java" then
--             local jdtls = require("jdtls")
--             vim.keymap.set("n","<Leader>or", jdtls.organize_imports)
--             vim.keymap.set("n","<Leader>ev", jdtls.extract_variable)
--             vim.keymap.set("n","<Leader>ec", jdtls.extract_constant)
--             --vim.keymap.set("n"," crv <Esc><Cmd>", jdtls.extract_variable(true))
--             --vim.keymap.set("n"," crc <Esc><Cmd>", jdtls.extract_constant(true))
--             vim.keymap.set("n","<Leader>em", jdtls.extract_method)
--
--         end
--     end,
-- })
--
local key = vim.api.nvim_replace_termcodes("o<C-c>:.!pwd<CR>V\"+yu", true, false, true)
local copy_current_directory_into_clipboard = function()
    vim.api.nvim_feedkeys(key, 'n', false)
    print("Copied current directory into clipboard.")
end
local function get_filepath()
    local filetype = vim.bo.filetype
    if filetype=="neo-tree" then
        print("Neo-Tree is not a valid filetype.")
        return
    end

    local buffer_name = vim.api.nvim_buf_get_name(0)
    local buffer_name_length = string.len(buffer_name)
    local index = buffer_name_length

    for i = buffer_name_length, 1, -1 do
        if string.sub(buffer_name, i, i) == "/" then
            index = i
            break
       end
    end

    local filepath = string.sub(buffer_name, 1, index)
    return filepath
end

local function copy_filepath_into_clipboard()

    local filepath = get_filepath()

    local lineNum = vim.api.nvim_win_get_cursor(0)[1]

    vim.api.nvim_buf_set_lines(0, lineNum, lineNum, true, {filepath})

    local key2 = vim.api.nvim_replace_termcodes("jV\"+ydd", true, false, true)
    vim.api.nvim_feedkeys(key2, 'n', false)
    print("Copied filepath into clipboard.")
end

local function set_working_directory_to_current_buffer_path()

    local filepath = get_filepath()

    vim.cmd("cd" .. filepath)
end

vim.keymap.set("n", "<Leader>o", function() vim.cmd [[silent !open .]] end)
vim.keymap.set("n", "<Leader>cwd", copy_current_directory_into_clipboard)
vim.keymap.set("n", "<Leader>cfp", copy_filepath_into_clipboard)
vim.keymap.set("n", "<Leader>swd", set_working_directory_to_current_buffer_path)

