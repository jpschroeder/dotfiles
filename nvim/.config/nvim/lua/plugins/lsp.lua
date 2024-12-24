return {
  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'williamboman/mason.nvim',
    opts = {
      ui = {
        border = 'rounded',
      },
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { 'lua_ls', 'gopls', 'pyright' },
    },
  },
  {
    'saghen/blink.cmp',
    -- dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = { preset = 'default' },
      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },
      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        -- default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
        default = { 'lazydev', 'lsp', 'path' },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
      -- signature = { enabled = true },
    },
    opts_extend = { 'sources.default' },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'saghen/blink.cmp',
      'folke/lazydev.nvim',
    },
    opts = {
      servers = {
        lua_ls = {},
        gopls = {},
        pyright = {},
      },
    },
    config = function(_, opts)
      -- Set the diagnostic icons
      vim.diagnostic.config {
        signs = {
          text = { ERROR = '', WARN = '', INFO = '', HINT = '' },
          -- text = { ERROR = " ", WARN  = " ", INFO  = " ", HINT  = " "}
        },
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then
            return
          end

          -- Style the built in keymaps to use rounded borders
          vim.keymap.set('n', 'K', function()
            return vim.lsp.buf.hover { border = 'rounded' }
          end, { desc = 'Hover Information', buffer = args.buf })

          vim.keymap.set({ 'i', 's' }, '<C-S>', function()
            vim.lsp.buf.signature_help { border = 'rounded' }
          end, { desc = 'Signature Help' })

          if client:supports_method 'textDocument/formatting' then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format { bufnr = args.buf, id = client.id }
              end,
            })
          end
        end,
      })

      local lspconfig = require 'lspconfig'
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end,
  },
}
