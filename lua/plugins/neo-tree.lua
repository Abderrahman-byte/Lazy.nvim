return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = function()
      return {
        {
          "<leader>s",
          function()
            require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
          end,
          desc = "Explorer NeoTree (Root Dir)",
        },
        {
          "<leader>ge",
          function()
            require("neo-tree.command").execute({ source = "git_status", toggle = true })
          end,
          desc = "Git Explorer",
        },
        {
          "<leader>be",
          function()
            require("neo-tree.command").execute({ source = "buffers", toggle = true })
          end,
          desc = "Buffer Explorer",
        },
      }
    end,
  },
}
