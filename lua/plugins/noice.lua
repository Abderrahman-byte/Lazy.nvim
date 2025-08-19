-- NOTE: this is a temporary fix to ignore the typescript "Request textDocument/documentHighlight"
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    routes = {
      {
        filter = {
          event = "notify",
          find = "Request textDocument/documentHighlight",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "notify",
          find = "Request textDocument/documentHighlight failed",
        },
        opts = { skip = true },
      },
    },
  },
}
