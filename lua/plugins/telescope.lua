return {
  "nvim-telescope/telescope.nvim",
  keys = function()
    return {
      { "<leader>/", false },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
      { "<leader>fG", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    }
  end,
}
