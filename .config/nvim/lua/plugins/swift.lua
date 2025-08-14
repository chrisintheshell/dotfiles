-- lua/plugins/swift.lua
-- Swift development configuration using blink.cmp in LazyVim

return {
  -- Configure LSP for Swift
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sourcekit = {
          -- Enable file watching capabilities for SourceKit-LSP
          -- This is crucial for Swift development as mentioned in the article
          capabilities = {
            workspace = {
              didChangeWatchedFiles = {
                dynamicRegistration = true,
              },
            },
          },
        },
      },
    },
  },

  -- Since blink.cmp is the default in LazyVim, we just need to ensure
  -- it has the right configuration for Swift development
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- blink.cmp already includes snippet support natively
      -- It will automatically load friendly-snippets if available

      -- Ensure LSP is in the sources (it should be by default)
      opts.sources = opts.sources or {}
      opts.sources.default = opts.sources.default or { "lsp", "path", "snippets", "buffer" }

      -- Enable auto-brackets for Swift functions/methods
      opts.completion = opts.completion or {}
      opts.completion.accept = opts.completion.accept or {}
      opts.completion.accept.auto_brackets = {
        enabled = true,
      }

      return opts
    end,
  },

  -- Optional: Add custom Swift snippets
  -- Place them in ~/.config/nvim/snippets/swift.json (VSCode format)
  -- or create them here programmatically
  {
    "rafamadriz/friendly-snippets",
    -- This will be automatically picked up by blink.cmp
  },

  -- Optional: Swift formatter
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        swift = { "swiftformat" },
      },
    },
  },
}

-- Note: The main differences from the article's nvim-cmp setup:
-- 1. No need for separate cmp-nvim-lsp, cmp-path, cmp-buffer plugins
-- 2. No need for LuaSnip configuration (blink has native snippet support)
-- 3. Simpler configuration overall
-- 4. The keymaps mentioned in the article (tab for completion, etc.)
--    are handled by LazyVim's blink.cmp defaults
