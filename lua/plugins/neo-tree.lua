return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", 
    },
    config = function()
        require("neo-tree").setup({ follow_current_file = { enabled = true } })
        Map("n", "<C-p>", ":Neotree toggle<CR>", Opts)
    end
}
