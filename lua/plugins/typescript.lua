return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "typescript-language-server")
      table.insert(opts.ensure_installed, "vue-language-server")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          enabled = false,
        },
        vtsls = {
          enabled = false,
        },
        ts_ls = {
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                -- Adjust the location as needed; here we assume it’s installed via Mason
                location = vim.fn.stdpath("data")
                  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                languages = { "vue" },
              },
            },
          },
          filetypes = {
            "javascript",
            "javascript.jsx",
            "javascriptreact",
            "typescript",
            "typescript.tsx",
            "typescriptreact",
            "vue",
          },
          settings = {
            typescript = {
              tsserver = {
                useSyntaxServer = false,
              },
              inlayHints = {
                allowRenameOfImportPath = true,
                includeCompletionsForImportStatements = true,
                includeCompletionsForModuleExports = true,
                includeCompletionsWithInsertText = true,
                includeInlayParameterNameHints = "none", -- 'none' | 'literals' | 'all'
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayVariableTypeHints = false,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = false,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "none", -- 'none' | 'literals' | 'all'
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayVariableTypeHints = false,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = false,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        volar = {
          filetypes = { "vue", "typescript", "javascript" },
          init_options = {
            vue = {
              -- Set to false for full takeover mode, so Volar provides type checking for both .vue and .ts parts
              hybridMode = false,
            },
          },
          settings = {
            typescript = {
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },
                parameterTypes = { enabled = false },
                parameterNames = { enabled = "none" },
              },
            },
          },
        },
      },
      setup = {
        -- OPTIONAL: Prevent both LSPs from attaching at once.
        -- Uncomment the following autocmd if you want ts_ls to stop when Volar is active and vice versa.
        --
        -- function(server_name, opts)
        --   vim.api.nvim_create_autocmd("LspAttach", {
        --     group = vim.api.nvim_create_augroup("LspAttachConflicts", { clear = true }),
        --     callback = function(args)
        --       local client = vim.lsp.get_client_by_id(args.data.client_id)
        --       if client and client.name == "volar" then
        --         for _, other in ipairs(vim.lsp.get_active_clients()) do
        --           if other.name == "ts_ls" then
        --             other.stop()
        --           end
        --         end
        --       elseif client and client.name == "ts_ls" then
        --         for _, other in ipairs(vim.lsp.get_active_clients()) do
        --           if other.name == "volar" then
        --             client.stop()
        --           end
        --         end
        --       end
        --     end,
        --   })
        -- end,
      },
    },
  },
}
