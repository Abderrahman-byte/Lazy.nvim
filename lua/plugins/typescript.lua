-- lua/plugins/vue_typescript.lua
return {
  -- ensure mason installs the servers
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      -- needed for Vue SFC + Volar
      vim.list_extend(opts.ensure_installed, { "vue-language-server", "typescript-language-server" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      -- servers config
      servers = {
        -- keep ts_ls present for pure TS/JS files, but don't let it own .vue
        ts_ls = {
          enabled = true,
          filetypes = {
            "typescript",
            "typescript.tsx",
            "typescriptreact",
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            -- DO NOT include "vue" here when using Volar takeover
          },
          -- If you want ts_ls to use workspace TS, you can add init_options.tsserver.path here
        },

        -- Volar (vue-language-server). Name in lspconfig may be "volar" or "vue_ls" depending on your nvim-lspconfig.
        volar = {
          filetypes = { "vue", "typescript", "javascript" },
          init_options = {
            vue = {
              -- takeover mode: Volar provides the TS type service for SFCs
              hybridMode = false,
            },
          },
          -- example Volar-specific settings, tweak inlay hints etc. as you like
          settings = {
            typescript = {
              inlayHints = {
                parameterNames = { enabled = false },
                parameterTypes = { enabled = false },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                enumMemberValues = { enabled = false },
              },
            },
          },
        },
      },

      -- optional: if you want to avoid both LSPs attaching simultaneously
      setup = {
        -- if you need extra logic on attach/disable, put it here
      },
    },
  },
}
