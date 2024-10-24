return {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
    dependencies =
    {
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    },

    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    },

    config = function()

        local telescope = require("telescope")
        local actions = require("telescope.actions")

        local ignore_filetypes_list = {
            "venv", "__pycache__", "%.xlsx", "%.jpg", "%.png", "%.webp",
            "%.pdf", "%.odt", "%.ico", "%.class"
        }

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<CR>"] = actions.select_default + actions.center,
                    }
                },
                file_ignore_patterns = ignore_filetypes_list,
            }
        })

        telescope.load_extension("fzf")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find, {})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
        vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
        vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, {})
        vim.keymap.set("n", "<leader>t", builtin.resume, {})
    end
}
